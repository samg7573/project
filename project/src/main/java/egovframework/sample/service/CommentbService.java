package egovframework.sample.service;

import java.util.List;

public interface CommentbService {
	
	void insertCommentb(CommentbVO vo)throws Exception;//insert
	void updateCommentb(CommentbVO vo)throws Exception;//update
	void deleteCommentb(CommentbVO vo)throws Exception;//delete
	List<CommentbVO>selectCommentbList(String bbs_fk)throws Exception;//select
	

}
