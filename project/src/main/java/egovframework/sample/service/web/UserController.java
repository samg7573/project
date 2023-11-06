package egovframework.sample.service.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.sample.service.FeedbackService;
import egovframework.sample.service.FeedbackVO;
import egovframework.sample.service.UserService;
import egovframework.sample.service.UserVO;
import egovframework.sample.service.security.PasswordEncoder;
import egovframework.sample.service.security.PasswordGenerator;

@Controller
@SessionAttributes("user")
public class UserController {

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name="feedbackService")
	private FeedbackService feedbackService;
	
	@Autowired
	private PasswordGenerator passwordGenerator;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@RequestMapping(value = "/insertUser.do", method = RequestMethod.GET)
	public String insertUserView(UserVO vo) throws Exception {
		System.out.println("등록 화면으로 이동");
		return "insertUser";
	}

	@RequestMapping(value = "/insertUser.do", method = RequestMethod.POST)
	   public String insertUser(UserVO vo, Model model, HttpServletRequest request) throws Exception {
		System.out.println(vo.getEml());
		System.out.println(vo.getMbr_grd());
	      userService.insertUser(vo);
	      return "forward:loginUser.do";
	   }

	@RequestMapping(value = "/updateUser.do")
	public String updateUser(@ModelAttribute("user") UserVO vo) throws Exception {
		System.out.println("수정되는 회원 정보");
		System.out.println("이름" + vo.getUser_nm());
		System.out.println("닉네임" + vo.getNick_nm());
		System.out.println("아이디" + vo.getUser_id());
		System.out.println("비밀번호" + vo.getUser_pswd());
		System.out.println("성별" + vo.getSexdstn());
		System.out.println("이메일" + vo.getEml());
		System.out.println("회원등급" + vo.getMbr_grd());
		userService.updateUser(vo);
		return "forward:selectUserList.do";
	}

	@RequestMapping(value = "/deleteUser.do")
	public String deleteUser(UserVO vo) throws Exception {
		System.out.println("회원 삭제 처리");
		userService.deleteUser(vo);
		return "forward:selectUserList.do";
	}

	@RequestMapping("/selectUserList.do")
	public String selectUserList(UserVO vo, Model model) throws Exception {
		System.out.println("회원 목록 검색 처리");
		model.addAttribute("userList", userService.selectUserList(vo));
		return "selectUserList";
	}

	@RequestMapping("/selectUser.do")
	public String selectUser(UserVO vo, Model model) throws Exception {
		System.out.println("회원 조회 처리");
		model.addAttribute("user", userService.selectUser(vo));
		return "selectUser";
	}

	@RequestMapping(value = "/loginUser.do", method = RequestMethod.GET)
	public String loginUser(UserVO vo, Model model) throws Exception {
		System.out.println("로그인 처리1");
		return "loginUser";
	}

	@RequestMapping(value = "/loginUser.do", method = RequestMethod.POST)
	public String loginUser(UserVO vo, Model model, HttpSession session) throws Exception {
		System.out.println("로그인 처리2");
		UserVO loggedInUser = userService.loginUser(vo);

		if (loggedInUser == null) {
			System.out.println("로그인 정보가 존재하지 않습니다.");
			return "loginUser";
		} else {
			String storedHashedPassword = loggedInUser.getUser_pswd();
			String inputPassword = vo.getUser_pswd();

			if (PasswordEncoder.authenticate(inputPassword, storedHashedPassword)) {
				System.out.println("로그인 정보 일치");
				session.setAttribute("loggedInUser", loggedInUser);
				FeedbackVO feedbackvo = new FeedbackVO();
				feedbackvo.setId(vo.getId());
				model.addAttribute("feedbackList", feedbackService.selectFeedbackList(feedbackvo));
				return "redirect:showMain.do";
			} else {
				System.out.println("로그인 정보 불일치");
				return "loginUser";
			}
		}
	}

	@RequestMapping(value = "/showMain.do")
	public String showMain(UserVO vo, Model model, HttpSession session) throws Exception {
		UserVO loggedInUser = (UserVO) session.getAttribute("loggedInUser");

		if (loggedInUser != null) {
			model.addAttribute("userName", loggedInUser.getUser_nm());
			model.addAttribute("userId", loggedInUser.getUser_id());
			FeedbackVO feedbackvo = new FeedbackVO();
			feedbackvo.setId(vo.getId());
			model.addAttribute("feedbackList", feedbackService.selectFeedbackList(feedbackvo));
			return "main";
		} else {
			return "loginUser"; 
		}
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("로그아웃");
		session.invalidate();
		return "redirect:/loginUser.do";
	}

	@RequestMapping(value = "/findUserIdByUsername.do", method = RequestMethod.GET)
	public String findUserIdInput(String user_nm, Model model) throws Exception {
		System.out.println("아이디 찾기 처리1");
		return "findUserIdInput";

	}

	@RequestMapping(value = "/findUserIdByUsername.do", method = RequestMethod.POST)
	public String findUserIdByUsername(String user_nm, Model model) throws Exception {
		System.out.println("아이디 찾기 처리2");
		String userId = userService.findUserIdByUsername(user_nm);
		model.addAttribute("user_id", userId);
		return "findUserIdByUsername";

	}

	@RequestMapping(value = "/findPwdByUserId.do", method = RequestMethod.GET)
	public String findUserPwdInput(String user_nm, String user_id, String eml, Model model) throws Exception {
		System.out.println("비밀번호 찾기 처리1");
		return "findUserPwdInput";

	}

	@RequestMapping(value = "/findPwdByUserId.do", method = RequestMethod.POST)
	public String findPwdByUserId(String user_nm, String user_id, String eml, Model model) throws Exception {
		System.out.println("비밀번호 찾기 처리2");

//        String userpswd = userService.findPwdByUserId(user_nm, user_id, eml);
		String userpswd = "1";
		UserVO user = userService.getUserByUserId(user_id);

		if (user != null && user.getUser_nm().equals(user_nm) && user.getEml().equals(eml)) {
			String newPassword = passwordGenerator.generateRandomCode(5);
			String hashedPassword = passwordEncoder.hashPassword(newPassword);

			user.setUser_pswd(hashedPassword);
			userService.updateUser(user);

			model.addAttribute("user_pswd", newPassword);

			return "findPwdByUserId";
		} else {
			return "main";
		}

	}

	@RequestMapping("/checkDuplicateUserId.do")
	@ResponseBody
	public String checkDuplicateUserId(String user_id) throws Exception {
		System.out.println("아이디 중복 체크");
		int isDuplicate = userService.checkDuplicateUserId(user_id);
		if (isDuplicate != 0) {
			return "duplicate";
		} else {
			return "available";
		}
	}

}
