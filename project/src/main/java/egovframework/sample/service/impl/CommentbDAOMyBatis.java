package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.sample.service.CommentbVO;

@Repository("commentbdaoMyBatis")
public class CommentbDAOMyBatis implements CommentbDAO{
	
	@Resource(name="commentbMapper")
	private CommentbMapper commentbmybatis;
	
	public CommentbDAOMyBatis() {
		System.out.println("CommentbDAOMyBatis 생성");
	}

	@Override
	public void insertCommentb(CommentbVO vo) throws Exception {
		System.out.println("CommentbdaoMyBatis로 insert 기능 처리");
		commentbmybatis.insertCommentb(vo);
		
	}

	@Override
	public void updateCommentb(CommentbVO vo) throws Exception {
		System.out.println("CommentbdaoMyBatis로 update 기능 처리");
		commentbmybatis.updateCommentb(vo);
		
	}

	@Override
	public void deleteCommentb(CommentbVO vo) throws Exception {
		System.out.println("CommentbdaoMyBatis로 delete 기능 처리");
		commentbmybatis.deleteCommentb(vo);
		
	}

	@Override
	public List<CommentbVO> selectCommentbList(String bbs_fk) throws Exception {
		System.out.println("CommentbdaoMyBatis로 selectList 기능처리");
		return commentbmybatis.selectCommentbList(bbs_fk);
	}

}
