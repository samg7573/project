package egovframework.sample.service.impl;

import java.util.List;

import egovframework.sample.service.CommentbVO;

public interface CommentbDAO {
	void insertCommentb(CommentbVO vo)throws Exception;//insert
	void updateCommentb(CommentbVO vo)throws Exception;//update
	void deleteCommentb(CommentbVO vo)throws Exception;//delete
	List<CommentbVO>selectCommentbList(String bbs_fk)throws Exception;//select

}
