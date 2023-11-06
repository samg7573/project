package egovframework.sample.service.web;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.sample.service.Category_EVO;
import egovframework.sample.service.ExerciseVO;
import egovframework.sample.service.UserService;
import egovframework.sample.service.UserVO;
import egovframework.sample.service.categoryService;
import egovframework.sample.service.category_EDAO;
import egovframework.sample.service.exerciseService;
import egovframework.sample.service.impl.weekCalendar;

@Controller
@SessionAttributes("exerciseList")
public class exerciseController {

	@Resource(name = "category_eService")
	private categoryService categoryService;

	@Resource(name = "dayExerviceService")
	private exerciseService excerciseService;

	@Resource(name = "egovIdGnrService_EX")
	private EgovIdGnrService exerciseboardEgovid;
	@Resource(name = "userService")
	private UserService userService;

	private weekCalendar weekCalendar;

	// 카테고리 조회
	@RequestMapping(value = "/selectCategory.do")
	public String selectBoard(category_EDAO vo, Model model, @RequestParam String routine) throws Exception {
		System.out.println("카테고리  조회 처리");

		LocalDateTime date = LocalDateTime.now();
		String LocalDate = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

		model.addAttribute("CategoryList", categoryService.selectCategoryList(vo));

		model.addAttribute("LocalDate_YMD", LocalDate.substring(0, LocalDate.lastIndexOf(" ")));
		model.addAttribute("LocalDate_HMS", LocalDate.substring(LocalDate.lastIndexOf(" ") + 1, LocalDate.length()));
		model.addAttribute("routine", routine);

		return "exerciseUser";
	}

	// 정보수정 카테고리 조회
	@RequestMapping(value = "/UpdateExercise.do")
	public String update(Model model, category_EDAO category_vo, ExerciseVO vo, @RequestParam String id,
			@RequestParam String routine) throws Exception {
		System.out.println("정보수정");

		LocalDateTime date = LocalDateTime.now();
		String LocalDate = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		vo.setExcr_id(id);

		model.addAttribute("CategoryList", categoryService.selectCategoryList(category_vo));

		model.addAttribute("userExInfo", excerciseService.selectBoard(vo));
		model.addAttribute("routine", routine);
		return "exerciseUpdateUser";
	}

	/*
	 * 회원 루틴 작성글 전체목록 검색 me -> 내꺼. Other -> 내꺼를 제외한 나머지.
	 */

	@RequestMapping(value = "/allExerciseselectList.do")
	public String AllExerInfoOtherUserSearch_col(@RequestParam String userId, @RequestParam String routine, Model model,
			category_EDAO category_vo, ExerciseVO vo, String searchWrd, String ser_ctgry_e, String ser)
			throws Exception {
		UserVO reg_user = new UserVO();
		List<ExerciseVO> exerciseVOs = new ArrayList<ExerciseVO>();
		reg_user.setId(userId);
		vo.setReg_user(reg_user);

		if (ser != null) {
			// 카테고리 정립
			Category_EVO category_EVO = new Category_EVO(ser_ctgry_e.substring(0, ser_ctgry_e.lastIndexOf(",")),
					ser_ctgry_e.substring(ser_ctgry_e.lastIndexOf(",") + 1, ser_ctgry_e.length()));

			if (searchWrd.equals(""))
				vo.setTtl(null);
			else
				vo.setTtl(searchWrd);

			if (category_EVO.getE_ctgry_id().equals("0")) {
				vo.setCtgry_e(null);
			} else
				vo.setCtgry_e(category_EVO);

			if (routine.equals("me")) {
				System.out.println("ttl조회검색");
				exerciseVOs = excerciseService.searchingInfo(vo);
			} else if (routine.equals("other")) {
				System.out.println("타회원 루틴 작성글 전체검색 처리");
				exerciseVOs = excerciseService.selectOthersearchingInfo(vo);
			}
		} else {
			if (routine.equals("me")) {
				System.out.println("내꺼 전체검색");
				exerciseVOs = excerciseService.selectBoardList(vo);
			} else if (routine.equals("other")) {
				System.out.println("타회원 루틴 작성글 전체검색 처리");
				exerciseVOs = excerciseService.selectOtherExerBoardList(vo);

			}
		}
		model.addAttribute("exerciseAllList", exerciseVOs);
		model.addAttribute("catorylist", categoryService.selectCategoryList(category_vo));
		model.addAttribute("routine", routine);
		return "exerciseList";
	}

	// 단일 검색.
	@RequestMapping(value = "/selectExindex.do")
	public String singleExerciseInforSearch_col(Model model, category_EDAO category_vo, ExerciseVO vo,
			@RequestParam String id, String userId, @RequestParam String routine) throws Exception {

		System.out.println("단일검색 처리");
		vo.setExcr_id(id);
		if(!routine.equals("me"))
			excerciseService.ExerciseBoardInqcnt(vo);
		ExerciseVO exerciseVOs = excerciseService.selectBoard(vo);
		List<Category_EVO> category_EVOs = categoryService.selectCategoryList(category_vo);
		model.addAttribute("exerciseList", exerciseVOs);
		model.addAttribute("routine", routine);
		return "exerciseInfoSearch";
	}

	// 일일 운동 정보 수정
	@RequestMapping(value = "/updateExInfo.do", method = RequestMethod.POST)
	public String updateExInfo(String ctgry_e_str, String reg_user_str, String reg_dt_YMD, String tMdfcn_dt,
			@ModelAttribute("exerciseList") ExerciseVO vo, @RequestParam String id, String userId,
			@RequestParam String routine) throws Exception {

		// 카테고리 정립
		Category_EVO category_EVO = new Category_EVO(ctgry_e_str.substring(0, ctgry_e_str.lastIndexOf(",")),
				ctgry_e_str.substring(ctgry_e_str.lastIndexOf(",") + 1, ctgry_e_str.length()));

		// 유저 정보 입력.
//		UserVO reg_user = new UserVO();

		// date 정립
		LocalDateTime date = LocalDateTime.now();
		String LocalDate = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		String Mdfcn_dt_YMD = LocalDate.substring(0, LocalDate.lastIndexOf(" "));
		String Mdfcn_dt_HMS = LocalDate.substring(LocalDate.lastIndexOf(" ") + 1, LocalDate.length());

		Date Mdfcn_dt_temp = Date.valueOf(Mdfcn_dt_YMD);

		vo.setMdfcn_dt(Mdfcn_dt_temp);
		vo.setCtgry_e(category_EVO);

		excerciseService.updateBoard(vo);
		return "redirect:allExerciseselectList.do?userId=" + userId + "&routine=" + routine;
	}

	// 일일 운동 정보 입력
	@RequestMapping(value = "/insertExInfo.do", method = RequestMethod.POST)
	public String insertBoard(String ctgry_e_str, String reg_user_str, String reg_dt_YMD, String reg_dt_HMS,
			ExerciseVO vo, String userId, @RequestParam String routine) throws Exception {

		// 카테고리 정립
		Category_EVO category_EVO = new Category_EVO(ctgry_e_str.substring(0, ctgry_e_str.lastIndexOf(",")),
				ctgry_e_str.substring(ctgry_e_str.lastIndexOf(",") + 1, ctgry_e_str.length()));
		UserVO reg_user = new UserVO();
		reg_user.setId(reg_user_str);

		// date 정립
		String dateTemp = (reg_dt_YMD + " " + reg_dt_HMS);
		Date date = Date.valueOf(reg_dt_YMD);
		reg_user = userService.selectUser(reg_user);

		vo.setExcr_id(exerciseboardEgovid.getNextStringId());
		vo.setReg_dt(date);
		vo.setMdfcn_dt(date);
		vo.setCtgry_e(category_EVO);
		vo.setReg_user(reg_user);
		vo.setMdfcn_user(reg_user);

		excerciseService.insertBoard(vo);
		return "redirect:allExerciseselectList.do?userId=" + userId + "&routine=" + routine;
	}

	@RequestMapping(value = "/deleteExerciseBoard.do")
	public String deleteBoard(ExerciseVO vo, @RequestParam String id, @RequestParam String userId,
			@RequestParam String routine) throws Exception {
		System.out.println("게시글 삭제");
		vo.setExcr_id(id);
		excerciseService.deleteBoard(vo);
		return "redirect:allExerciseselectList.do?userId=" + userId + "&routine=" + routine;
	}
}
