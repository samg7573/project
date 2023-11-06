package egovframework.sample.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.sample.service.FeedbackVO;

@Mapper("FeedbackMapper")
public interface FeedbackMapper {
	void insertFeedback(FeedbackVO vo)throws Exception;
	
	void updateFeedback(FeedbackVO vo)throws Exception;
	
	void deleteFeedback(FeedbackVO vo)throws Exception;
	
	FeedbackVO selectFeedback(FeedbackVO vo) throws Exception;
	
	List<FeedbackVO> selectFeedbackList(FeedbackVO vo) throws Exception;
		
	void updateRcmdtn(FeedbackVO vo) throws Exception;
	
	void updateViewNum2(FeedbackVO vo) throws Exception;
}
