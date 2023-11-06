package egovframework.sample.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.sample.service.CommentfVO;

@Mapper("commentfMapper")
public interface CommentfMapper {
	void insertCommentf(CommentfVO vo)throws Exception;//insert
	void updateCommentf(CommentfVO vo)throws Exception;//update
	void deleteCommentf(CommentfVO vo)throws Exception;//delete
	List<CommentfVO>selectCommentfList(String bbs_fk)throws Exception;//select
}
