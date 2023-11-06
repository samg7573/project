package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.sample.service.CommentfDAO;
import egovframework.sample.service.CommentfVO;

@Repository("commentfdaoMyBatis")
public class CommentfDAOMyBatis implements CommentfDAO{

	@Resource(name="commentfMapper")
	private CommentfMapper commentfmybatis;
	
	public CommentfDAOMyBatis() {
		System.out.println("CommentfDAOMyBatis 생성");
	}
	@Override
	public void insertCommentf(CommentfVO vo) throws Exception {
		System.out.println("CommentfdaoMyBatis로 insert 기능 처리");
		commentfmybatis.insertCommentf(vo);
		
	}

	@Override
	public void updateCommentf(CommentfVO vo) throws Exception {
		System.out.println("CommentfdaoMyBatis로 insert 기능 처리");
		commentfmybatis.updateCommentf(vo);
	}

	@Override
	public void deleteCommentf(CommentfVO vo) throws Exception {
		System.out.println("CommentfdaoMyBatis로 insert 기능 처리");
		commentfmybatis.deleteCommentf(vo);
	}

	@Override
	public List<CommentfVO> selectCommentfList(String bbs_fk) throws Exception {
		System.out.println("CommentfdaoMyBatis로 insert 기능 처리");
		return commentfmybatis.selectCommentfList(bbs_fk);
	}

}
