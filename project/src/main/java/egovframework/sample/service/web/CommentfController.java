package egovframework.sample.service.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.sample.service.CommentfService;
import egovframework.sample.service.CommentfVO;

@Controller
@SessionAttributes("commentf")
public class CommentfController {

	@Autowired
	private CommentfService commentfService;
	
	@RequestMapping(value = "/insertCommentf.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String insertCommentfView(CommentfVO vo)throws Exception{
		System.out.println("댓글 등록");
		commentfService.insertCommentf(vo);
		return "redirect:/selectFeedback.do?id="+vo.getBbs_fk();//댓글 입력하면 업데이트 되어서 게시물 조회 밑에 보이게
		
	}
	
	@RequestMapping(value = "/deleteCommentf.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteCommentf(CommentfVO vo)throws Exception{
		
		String n=vo.getBbs_fk();
		System.out.println("삭제전:"+vo.getBbs_fk());
		System.out.println("댓글삭제");
		commentfService.deleteCommentf(vo);
		System.out.println("삭제후:"+vo.getBbs_fk());
		return "redirect:/selectFeedback.do?id="+n;
		

	}
	
	@RequestMapping(value = "/updateCommentf.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String updateCommentf(@ModelAttribute("commentf")CommentfVO vo)throws Exception{
		System.out.println("댓글 수정");
		commentfService.updateCommentf(vo);
		return "redirect:/selectFeedback.do?id="+vo.getBbs_fk();
	}
	

	
	@RequestMapping(value = "/selectCommentfList.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String selectCommentfList(CommentfVO vo,Model model)throws Exception{
		System.out.println("댓글전체확인");
		model.addAttribute("commentfList", commentfService.selectCommentfList(vo.getBbs_fk()));
		return "redirect:/selectFeedback.do?id="+vo.getBbs_fk();
	}
}
