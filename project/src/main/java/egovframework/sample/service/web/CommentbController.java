package egovframework.sample.service.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.sample.service.CommentbService;
import egovframework.sample.service.CommentbVO;

@Controller
@SessionAttributes("commentb")
public class CommentbController {
	
	@Autowired
	private CommentbService commentbService;
	
	@RequestMapping(value = "/insertCommentb.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String insertCommentbView(CommentbVO vo)throws Exception{
		System.out.println("댓글 등록");
//		vo.setCmnt("댓글을 입력하세요");
		commentbService.insertCommentb(vo);
		return "redirect:/selectBoard.do?id="+vo.getBbs_fk();//댓글 입력하면 업데이트 되어서 게시물 조회 밑에 보이게
		
	}
	
	@RequestMapping(value = "/deleteCommentb.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteCommentb(CommentbVO vo)throws Exception{
		
		String n=vo.getBbs_fk();
		System.out.println("삭제전:"+vo.getBbs_fk());
		System.out.println("댓글삭제");
		commentbService.deleteCommentb(vo);
		System.out.println("삭제후:"+vo.getBbs_fk());
		return "redirect:/selectBoard.do?id="+n;
		

	}
	
	@RequestMapping(value = "/updateCommentb.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String updateCommentb(@ModelAttribute("commentb")CommentbVO vo)throws Exception{
		System.out.println("댓글 수정");
		commentbService.updateCommentb(vo);
		return "redirect:/selectBoard.do?id="+vo.getBbs_fk();
	}
	

	
	@RequestMapping(value = "/selectCommentbList.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String selectCommentbList(CommentbVO vo,Model model)throws Exception{
		System.out.println("댓글전체확인");
		model.addAttribute("commentbList", commentbService.selectCommentbList(vo.getBbs_fk()));
		return "redirect:/selectBoard.do?id="+vo.getBbs_fk();
	}
	

}
