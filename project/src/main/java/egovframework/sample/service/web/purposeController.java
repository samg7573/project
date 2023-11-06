package egovframework.sample.service.web;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

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
import egovframework.sample.service.impl.weekCalendar;

@Controller
public class purposeController {

	@Resource(name = "category_eService")
	private categoryService categoryService;

	@Resource(name = "egovIdGnrService_purpose")
	private EgovIdGnrService exerciseboardEgovid;

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "purposeService")
	private purposeService purposeService;

	private weekCalendar weekCalendar;

	/******************************************
	 * 주간 운동 목표 설정
	 ******************************************/

	@RequestMapping(value = "/insertWeektargetExercise.do")
	public String insertWeektargetExercise(Model model) throws Exception {
		LocalDateTime date = LocalDateTime.now();
		String LocalDate = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date_temp = LocalDate.substring(0, LocalDate.lastIndexOf(" "));
		java.util.Date date2 = df.parse(date_temp);
		HashMap<String, String> alltime = weekCalendar.getCurrentWeekOfMonth(date2);

		model.addAttribute("alltime", alltime);
		model.addAttribute("routine", "me");
		model.addAttribute("today", date_temp);
		return "exerciseweek";
	}

	@RequestMapping(value = "/insertWeek.do")
	public String insertWeek(Model model, PurposeVO vo, String reg_user_str, String reg_dt_str) throws Exception {

		UserVO reg_user = new UserVO();
		reg_user.setId(reg_user_str);
		reg_user = userService.selectUser(reg_user);

		// 날짜 변경
		Date reg_dt = Date.valueOf(reg_dt_str);

		vo.setPrps_id(exerciseboardEgovid.getNextStringId());

		vo.setReg_user(reg_user);
		vo.setReg_dt(reg_dt);
		PurposeVO vo_check = new PurposeVO();
				
		Optional<PurposeVO> optid = Optional.ofNullable(purposeService.selectYMD(vo));
		
		if (optid.isPresent()) {
			vo_check = optid.get();
			vo_check.setWk(vo.getWk());
			vo_check.setAllcal(vo.getAllcal());
			purposeService.updateBoard(vo_check);
		} else {
			purposeService.insertBoard(vo);
		}
		return "redirect:showMain.do";
	}
}
