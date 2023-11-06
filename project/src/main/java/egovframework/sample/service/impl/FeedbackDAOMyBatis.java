package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.sample.service.FeedbackDAO;
import egovframework.sample.service.FeedbackVO;

@Repository("daoMyBatis")
public class FeedbackDAOMyBatis implements FeedbackDAO{
	
	@Resource(name="FeedbackMapper")
	private FeedbackMapper mybatis;
	
	public FeedbackDAOMyBatis() {
		System.out.println("===>FeedbackDAOMyBatis()생성자");
	}

	public void insertFeedback(FeedbackVO vo) throws Exception{
		System.out.println("MyBatis로 insertFeedback()기능처리");
		mybatis.insertFeedback(vo);
	}
	
	public void updateFeedback(FeedbackVO vo) throws Exception{
		System.out.println("MyBatis로 updateFeedback()기능처리");
		mybatis.updateFeedback(vo);
	}
	
	public void deleteFeedback(FeedbackVO vo) throws Exception{
		System.out.println("MyBatis로 deleteFeedback()기능처리");
		mybatis.deleteFeedback(vo);
	}
	
	public FeedbackVO selectFeedback(FeedbackVO vo) throws Exception{
		System.out.println("MyBatis로 selectFeedback()기능처리");
		return (FeedbackVO) mybatis.selectFeedback(vo);
	}
	
	public List<FeedbackVO> selectFeedbackList(FeedbackVO vo) throws Exception{
		System.out.println("MyBatis로 selectFeedbackList()기능처리");
		return mybatis.selectFeedbackList(vo);

	}
	@Override
	public void increaseRcmdin(String id) {
		FeedbackVO feedback = new FeedbackVO(); // BoardVO 객체 생성
		feedback.setId(id); // feedbackId 값을 설정
		System.out.println("아이디:" + id);
		try {
			feedback = mybatis.selectFeedback(feedback);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (feedback != null) {
			System.out.println("MyBatis로 추천수 증가 기능");
			feedback.setRcmdtn_cnt(feedback.getRcmdtn_cnt() + 1);
			try {
				mybatis.updateFeedback(feedback);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	@Override
	public void updateRcmdtn(FeedbackVO vo) throws Exception {
		mybatis.updateRcmdtn(vo);

	}

	@Override
	public void updateViewNum2(String id) {
		FeedbackVO feedback = new FeedbackVO(); // BoardVO 객체 생성
		feedback.setId(id); // feedbackId 값을 설정
		try {
			feedback = mybatis.selectFeedback(feedback);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (feedback != null) {
			System.out.println("MyBatis로 조회수 증가 기능");
			feedback.setView_num(feedback.getView_num() + 1);
			try {
				mybatis.updateViewNum2(feedback);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
}
