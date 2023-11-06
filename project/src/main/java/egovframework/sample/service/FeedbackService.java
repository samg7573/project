package egovframework.sample.service;

import java.util.List;

public interface FeedbackService {

	void insertFeedback(FeedbackVO vo) throws Exception;

	void updateFeedback(FeedbackVO vo) throws Exception;

	void deleteFeedback(FeedbackVO vo) throws Exception;

	FeedbackVO selectFeedback(FeedbackVO vo) throws Exception;

	List<FeedbackVO> selectFeedbackList(FeedbackVO vo) throws Exception;

	void increaseRcmdtn(String feedbackId);
	void updateRcmdtn(FeedbackVO vo) throws Exception;
	void updateViewNum2(String feedbackId);

}