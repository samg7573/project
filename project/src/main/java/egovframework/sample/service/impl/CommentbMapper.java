package egovframework.sample.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.sample.service.CommentbVO;

@Mapper("commentbMapper")
public interface CommentbMapper {
	void insertCommentb(CommentbVO vo)throws Exception;//insert
	void updateCommentb(CommentbVO vo)throws Exception;//update
	void deleteCommentb(CommentbVO vo)throws Exception;//delete
	List<CommentbVO>selectCommentbList(String bbs_fk)throws Exception;//select

}
