package egovframework.sample.service.web;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.sample.service.BoardVO;
import egovframework.sample.service.Category_EVO;
import egovframework.sample.service.ExerciseVO;
import egovframework.sample.service.PurposeVO;
import egovframework.sample.service.UserService;
import egovframework.sample.service.UserVO;
import egovframework.sample.service.categoryService;
import egovframework.sample.service.category_EDAO;
import egovframework.sample.service.exerciseService;
import egovframework.sample.service.purposeService;
import egovframework.sample.service.impl.Message;
import egovframework.sample.service.impl.weekCalendar;
import egovframework.sample.service.security.PasswordEncoder;
import egovframework.sample.service.security.PasswordGenerator;

@Controller
@SessionAttributes("user")
public class mypageController {

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "purposeService")
	private purposeService purposeService;

	@Resource(name = "dayExerviceService")
	private exerciseService excerciseService;

	private weekCalendar weekCalendar;

	@Autowired
	private PasswordGenerator passwordGenerator;

	@Autowired
	private PasswordEncoder passwordEncoder;

	/************ 유저 정보 & 주간 운동 내용 출력 **********/
	@RequestMapping(value = "/mypageinfo.do")
	public String mypageinfofunc(Model model, UserVO userVO, PurposeVO purposeVO, String userId) throws Exception {

		ExerciseVO E_vo = new ExerciseVO();
		List<ExerciseVO> exerciseVOs = new ArrayList<ExerciseVO>();
		/*** 유저 확인 ***/
		userVO = userService.getUserById(userId);

		/*****************************************************************************************************************************/
		// 주차 확인
		LocalDateTime date = LocalDateTime.now();
		String LocalDate = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date_temp = LocalDate.substring(0, LocalDate.lastIndexOf(" "));
		java.util.Date date2 = df.parse(date_temp);
		HashMap<String, String> alltime = weekCalendar.getCurrentWeekOfMonth(date2);

		// 날자 계산
		String[] getDaysOfWeek = weekCalendar.getDaysOfWeek(date_temp);

		// 주 목표 조회.
		String[] val = { "year", "month", "weekOfMonth", "day" };
		int i = 0;
		for (Map.Entry<String, String> entry : alltime.entrySet()) {
			for (int j = 0; j < val.length; j++) {
				if (entry.getKey().equals(val[j])) {
					val[j] = entry.getValue();
					break;
				}
			}
			i++;
		}

		purposeVO.setPrps_y(val[0]);
		purposeVO.setPrps_m(val[1]);
		purposeVO.setMnth_wk(val[2]);
		purposeVO.setReg_user(userVO);

		// 년월id로 가지고 오는 것
		List<PurposeVO> purposeVOs = purposeService.selectYM(purposeVO);
		purposeVO = purposeService.selectYMD(purposeVO);

		/*****************************************************************************************************************************/

		// 총칼로리 & 총 시간 검색.
		Long[] Allcal = new Long[7];
		Long[] Alltime = new Long[7];
		Arrays.fill(Allcal, (long) 0);
		Arrays.fill(Alltime, (long) 0);

		Date date3 = Date.valueOf(getDaysOfWeek[0]);
		E_vo.setStartdt(date3);
		date3 = Date.valueOf(getDaysOfWeek[6]);
		E_vo.setEnddt(date3);
		E_vo.setReg_user(userVO);

		// 주간 운동 총 모음
		exerciseVOs = excerciseService.getDateList(E_vo);

		for (i = 0; i < getDaysOfWeek.length; i++) {
			for (ExerciseVO vo : exerciseVOs) {
				if (Date.valueOf(getDaysOfWeek[i]).equals(vo.getReg_dt())) {
					Allcal[i] = Allcal[i] + vo.getCal();
					Alltime[i] = Alltime[i] + Long.parseLong(vo.getExcr_tm());
				}
			}
		}

		/*****************************************************************************************************************************/

		model.addAttribute("user", userVO);
		model.addAttribute("routine", "me");
		model.addAttribute("today", date_temp);
		model.addAttribute("graphX", getDaysOfWeek);
		model.addAttribute("Allcal", Allcal);
		model.addAttribute("Alltime", Alltime);
		model.addAttribute("purpose", purposeVO);
		model.addAttribute("purposeVOs", purposeVOs);

		return "mypage";
	}

	/************ 유저 정보 & 주간 운동 내용 출력 **********/
	@RequestMapping(value = "/button_mypageinfo.do")
	public String mypageinfofunc_button(Model model, UserVO userVO, PurposeVO purposeVO, String userId,
			@RequestParam String weekbutton_reg_dt) throws Exception {

		ExerciseVO E_vo = new ExerciseVO();
		List<ExerciseVO> exerciseVOs = new ArrayList<ExerciseVO>();
		/*** 유저 확인 ***/
		userVO = userService.getUserById(userId);

		/*****************************************************************************************************************************/
		// 주차 확인
		// LocalDateTime date = LocalDateTime.now();
		// String LocalDate = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd
		// HH:mm:ss"));

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date_temp = weekbutton_reg_dt;
		java.util.Date date2 = df.parse(date_temp);
		HashMap<String, String> alltime = weekCalendar.getCurrentWeekOfMonth(date2);

		// 날자 계산
		String[] getDaysOfWeek = weekCalendar.getDaysOfWeek(date_temp);

		// 주 목표 조회.
		String[] val = { "year", "month", "weekOfMonth", "day" };
		int i = 0;
		for (Map.Entry<String, String> entry : alltime.entrySet()) {
			for (int j = 0; j < val.length; j++) {
				if (entry.getKey().equals(val[j])) {
					val[j] = entry.getValue();
					break;
				}
			}
			i++;
		}

		purposeVO.setPrps_y(val[0]);
		purposeVO.setPrps_m(val[1]);
		purposeVO.setMnth_wk(val[2]);
		purposeVO.setReg_user(userVO);

		// 년월id로 가지고 오는 것
		List<PurposeVO> purposeVOs = purposeService.selectYM(purposeVO);
		purposeVO = purposeService.selectYMD(purposeVO);

		// 주차 검색

		/*****************************************************************************************************************************/

		// 총칼로리 & 총 시간 검색.
		Long[] Allcal = new Long[7];
		Long[] Alltime = new Long[7];
		Arrays.fill(Allcal, (long) 0);
		Arrays.fill(Alltime, (long) 0);

		Date date3 = Date.valueOf(getDaysOfWeek[0]);
		E_vo.setStartdt(date3);
		date3 = Date.valueOf(getDaysOfWeek[6]);
		E_vo.setEnddt(date3);
		E_vo.setReg_user(userVO);

		// 주간 운동 총 모음
		exerciseVOs = excerciseService.getDateList(E_vo);

		for (i = 0; i < getDaysOfWeek.length; i++) {
			for (ExerciseVO vo : exerciseVOs) {
				if (Date.valueOf(getDaysOfWeek[i]).equals(vo.getReg_dt())) {
					Allcal[i] = Allcal[i] + vo.getCal();
					Alltime[i] = Alltime[i] + Long.parseLong(vo.getExcr_tm());
				}
			}
		}

		/*****************************************************************************************************************************/

		model.addAttribute("user", userVO);
		model.addAttribute("routine", "me");
		model.addAttribute("today", date_temp);
		model.addAttribute("graphX", getDaysOfWeek);
		model.addAttribute("Allcal", Allcal);
		model.addAttribute("Alltime", Alltime);
		model.addAttribute("purpose", purposeVO);
		model.addAttribute("purposeVOs", purposeVOs);

		return "mypage";
	}

	/************ 닉네임 중복 체크 **********/
	@RequestMapping("/checkDuplicateUserId_mypage.do")
	@ResponseBody
	public String checkDuplicateUserId_mypage(String user_id) throws Exception {
		System.out.println("아이디 중복 체크");
		int isDuplicate = userService.checkDuplicateUserId(user_id);
		if (isDuplicate != 0) {
			return "duplicate";
		} else {
			return "available";
		}
	}

	/************ 유저 정보 창 **********/

	@RequestMapping(value = "mypagepwOn.do")
	public String mypagepwOn(Model model) throws Exception {
		return "mypagepw";
	}

	/************ 유저 정보 수정 **********/
	@RequestMapping(value = "updateuserinfo.do", method = RequestMethod.POST)
	public String updateuserinfofunc(Model model, @ModelAttribute("user") UserVO userVO, PurposeVO purposeVO)
			throws Exception {
		userService.updateUserInfo(userVO);
		return "forward:/mypageinfo.do?userId=" + userVO.getId() + "&routine=me";

	}

	/************ WEEK 정보 수정 **********/
	@RequestMapping(value = "updateweekinfo.do", method = RequestMethod.POST)
	public String updateweekinfofunc(Model model, @RequestParam String userId, PurposeVO weekupdate, String reg_dt_str)
			throws Exception {
		UserVO userVO = userService.getUserById(userId);
		weekupdate.setReg_user(userVO);
		purposeService.updateBoard(weekupdate);
		String url = "button_mypageinfo.do?userId=" + userId + "&routine=me&weekbutton_reg_dt=" + reg_dt_str;
		model.addAttribute("data", new Message("변경되었습니다.", url));
		return "message";
	}

	/************ 비밀 번호 수정 **********/
	@RequestMapping(value = "/PwUserChange.do")
	public String PwUserChangefunc(Model model, String userId, String now_pw, String new_pw, String new_pwcheck)
			throws Exception {

		String root = "mypageinfo.do?userId=" + userId + "routine=me";
		UserVO user = userService.getUserById(userId);

		String now_hashedPw = passwordEncoder.hashPassword(now_pw);
		String new_hashedPw = passwordEncoder.hashPassword(new_pw);
		String newcheck_hashedPw = passwordEncoder.hashPassword(new_pwcheck);

		if (now_hashedPw.equals(user.getUser_pswd())) {
			if (new_hashedPw.equals(newcheck_hashedPw)) {
				user.setUser_pswd(new_hashedPw);
				userService.updateUserPw(user, userId);
				model.addAttribute("data", new Message("변경됬습니다.", "location='main.do'"));
			}
		} else {
			model.addAttribute("data", new Message("비밀번호가 맞지 않습니다", "location='mypagepwOn.do'"));

		}
		return "message";

	}

}