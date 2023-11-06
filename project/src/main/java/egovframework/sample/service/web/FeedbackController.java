package egovframework.sample.service.web;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import egovframework.sample.service.CommentfService;
import egovframework.sample.service.CommentfVO;
import egovframework.sample.service.FeedbackService;
import egovframework.sample.service.FeedbackVO;
import egovframework.sample.service.UserService;
import egovframework.sample.service.UserVO;

@Controller
@SessionAttributes("feedback")
public class FeedbackController {
	@Resource(name="feedbackService")
	private FeedbackService feedbackService;
	
	@Resource
	private ServletContext servletContext;

	@Autowired
	private CommentfService commentfService;
	
	@Resource(name = "userService")
	private UserService userService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TTL");
		conditionMap.put("내용", "BBS_CN");
		return conditionMap;
	}
	
	
	@RequestMapping(value = "/insertFeedback.do", method=RequestMethod.GET)
	public String insertFeedbackView() throws Exception {
		System.out.println("등록화면이동");
		return "insertFeedback";
	}
	
	@RequestMapping(value = "/insertFeedback.do", method=RequestMethod.POST)
	public String insertFeedback(FeedbackVO vo) throws Exception  {
		//파일 업로드
		String photo = null;
		MultipartFile uploadphoto = vo.getUploadphoto();
		if (!uploadphoto.isEmpty()) {
			String originalPhoto = uploadphoto.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalPhoto);
			UUID uuid = UUID.randomUUID();
			photo = uuid + "." + ext;
			// 파일을 프로젝트 내의 특정 디렉토리에 저장
			
			uploadphoto.transferTo(new File("C:\\eGovFrameDev-3.10.0-64bit\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\photo\\" + photo));
			
//			uploadphoto.transferTo(new File("C:/eGovFrameDev-3.10.0-64bit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/project2/src/main/webapp/photo/" + photo));
		}
		vo.setPhoto(photo);
		System.out.println(vo.getPhoto());
		feedbackService.insertFeedback(vo);
		return "forward:showMain.do";
	}
	
	
	@RequestMapping(value="/updateFeedback.do")
	public String updateFeedback(@ModelAttribute("feedback") FeedbackVO vo) throws Exception{
		System.out.println("수정되는 피드백 정보");
		System.out.println("제목"+vo.getTtl());		//command 값을 가져온다
		System.out.println("수정자"+vo.getMdfcn_user());		//session 값을 가져온다
		System.out.println("내용"+vo.getBbs_cn());	//command 값을 가져온다
		//파일 업로드
		String photo = null;
		MultipartFile uploadphoto = vo.getUploadphoto();
		if (!uploadphoto.isEmpty()) {
			String originalPhoto = uploadphoto.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalPhoto);
			UUID uuid = UUID.randomUUID();
			photo = uuid + "." + ext;
			// 파일을 프로젝트 내의 특정 디렉토리에 저장
			uploadphoto.transferTo(new File("C:\\eGovFrame-3.10.0\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\photo\\" + photo));
			
			// 기존 사진 파일 경로를 가져옴
	        String oldPhotoPath = "C:\\eGovFrame-3.10.0\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\photo\\" + vo.getPhoto();
	        					

	        // 기존 사진 파일을 삭제
	        File oldPhotoFile = new File(oldPhotoPath);
	        if (oldPhotoFile.exists()) {
	            oldPhotoFile.delete();
	        }
	        
			vo.setPhoto(photo);
		
		}else {
			feedbackService.updateFeedback(vo);
			return "redirect:/selectFeedback.do?id=" + vo.getId();
		}
		feedbackService.updateFeedback(vo);
		return "redirect:/selectFeedback.do?id=" + vo.getId();
	}
	
	@RequestMapping(value="/deleteFeedback.do")
	public String deleteFeedback(@ModelAttribute("feedback") FeedbackVO vo) throws Exception {
		System.out.println("피드백 삭제");
		
		// 기존 사진 파일 경로를 가져옴
        String oldPhotoPath = "C:/eGovFrameDev-3.10.0-64bit/workspace/project/src/main/webapp/photo/" + vo.getPhoto();

        // 기존 사진 파일을 삭제
        File oldPhotoFile = new File(oldPhotoPath);
        if (oldPhotoFile.exists()) {
            oldPhotoFile.delete();
        }
        
		feedbackService.deleteFeedback(vo);
		return "forward:showMain.do";
	}
	
	@RequestMapping(value="/selectFeedback.do")
	public String selectFeedback(FeedbackVO vo, Model model) throws Exception {
		System.out.println("피드백 조회 처리");
		
		FeedbackVO selectedFeedback = feedbackService.selectFeedback(vo);
		List<CommentfVO> commentfList = commentfService.selectCommentfList(selectedFeedback.getId());
		
	    
	    List<CommentfVO> commentfListfinal = new ArrayList<CommentfVO>();

	    for (CommentfVO commentf : commentfList) {
	        String temp = commentf.getReg_user();
	        // 여기서 temp는 댓글 작성자의 아이디
	        UserVO user = userService.getUserById(temp);
	        commentf.setReg_user(user.getNick_nm()); // 회원 닉네임으로 변경
	        commentfListfinal.add(commentf);
	    }
	    String temp = selectedFeedback.getReg_user();
	    UserVO user = userService.getUserById(temp);

	    model.addAttribute("feedback", selectedFeedback);
	    model.addAttribute("Nick_nm", user.getNick_nm());
		
//		model.addAttribute("feedback", feedbackService.selectFeedback(vo));
		model.addAttribute("commentfList", commentfListfinal);
		return "selectFeedback";
	}

	
	@RequestMapping(value = "/increaseRcmdtn.do", method = RequestMethod.POST)
    @ResponseBody
    public String increaseRcmdtn(@RequestParam("id") String id) {
      System.out.println("추천수 증가");

       //추가
       FeedbackVO feedback = new FeedbackVO();
       feedback.setRcmdtn_cnt(feedback.getRcmdtn_cnt() + 1);
       //추가
       feedbackService.increaseRcmdtn(id);
        return "Success";
    }
	
	@RequestMapping("/updateViewNum2.do")
	public String updateViewNum(@RequestParam("id") String id) throws Exception {
		System.out.println("조회수 증가");
		
		feedbackService.updateViewNum2(id);
		
		return "redirect:/selectFeedback.do?id=" + id;
	}

}
