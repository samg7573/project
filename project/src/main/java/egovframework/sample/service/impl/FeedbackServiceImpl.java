package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.sample.service.FeedbackDAO;
import egovframework.sample.service.FeedbackService;
import egovframework.sample.service.FeedbackVO;

@Service("feedbackService")
public class FeedbackServiceImpl extends EgovAbstractServiceImpl implements FeedbackService {
//	private static final Logger LOGGER=LoggerFactory.getLogger(FeedbackServiceImpl.class);
	
	@Resource(name ="daoMyBatis") 
	private FeedbackDAO feedbackDAO;
	
	@Resource(name="egovfeedbackIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	
	public FeedbackServiceImpl() {
		System.out.println("로딩");
	}
	
	public void insertFeedback(FeedbackVO vo) throws Exception{
//		LOGGER.trace("TRACE Level Logging");
//		LOGGER.debug("DEBUG Level Logging");
//		LOGGER.info("INFO Level Logging");
//		LOGGER.warn("WARN Level Logging");
//		LOGGER.error("ERROR Level Logging");
		String id=egovIdGnrService.getNextStringId();
		vo.setId(id);
		feedbackDAO.insertFeedback(vo);
	}
	
	public void updateFeedback(FeedbackVO vo) throws Exception{
		
		feedbackDAO.updateFeedback(vo);
	}
	
	public void deleteFeedback(FeedbackVO vo) throws Exception{
		
		feedbackDAO.deleteFeedback(vo);
	}
	
	public FeedbackVO selectFeedback(FeedbackVO vo) throws Exception{
		
		return feedbackDAO.selectFeedback(vo);
	}
	public List<FeedbackVO> selectFeedbackList(FeedbackVO vo) throws Exception{
		
		return feedbackDAO.selectFeedbackList(vo);
	}

	@Override
	public void increaseRcmdtn(String id) {
		FeedbackVO feedback = new FeedbackVO(); // BoardVO 객체 생성
        feedback.setId(id); // boardId 값을 설정
        try {
         feedback = feedbackDAO.selectFeedback(feedback);
      } catch (Exception e) {
         e.printStackTrace();
      } 
        
        if (feedback != null) {
            feedback.setRcmdtn_cnt(feedback.getRcmdtn_cnt() + 1);
            try {
            	feedbackDAO.updateRcmdtn(feedback);
            } catch (Exception e) {
            	e.printStackTrace();
         	}
        }
    }

	@Override
	public void updateRcmdtn(FeedbackVO vo) throws Exception {
		feedbackDAO.updateRcmdtn(vo);
		
	}

	@Override
	public void updateViewNum2(String id) {
		FeedbackVO feedback = new FeedbackVO(); // BoardVO 객체 생성
        feedback.setId(id); // boardId 값을 설정
        try {
         feedback = feedbackDAO.selectFeedback(feedback);
      } catch (Exception e) {
         e.printStackTrace();
      } 
        
        if (feedback != null) {
            feedback.setView_num(feedback.getView_num());
            try {
            	feedbackDAO.updateViewNum2(feedback.getId());
            } catch (Exception e) {
            	e.printStackTrace();
         	}
        }
		
	}	
	
}
