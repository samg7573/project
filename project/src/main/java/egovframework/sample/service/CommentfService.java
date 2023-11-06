package egovframework.sample.service;

import java.util.List;

public interface CommentfService {
	void insertCommentf(CommentfVO vo)throws Exception;//insert
	void updateCommentf(CommentfVO vo)throws Exception;//update
	void deleteCommentf(CommentfVO vo)throws Exception;//delete
	List<CommentfVO>selectCommentfList(String bbs_fk)throws Exception;//select
}
