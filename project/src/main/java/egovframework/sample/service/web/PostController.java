package egovframework.sample.service.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.sample.service.UserVO;

@Controller
public class PostController {
	@PostMapping("/createPost")
    public String createPost(@RequestParam("content") String content, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("userSession");
        if (user != null) {
            String Id = user.getId();
            String nick_nm = user.getNick_nm();

            // 글 작성 로직
            // 작성자 이름도 함께 저장
        }
        return "redirect:/posts";
    }
}
