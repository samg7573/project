package egovframework.sample.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.sample.service.BoardVO;

@Mapper("boardMapper")
public interface BoardMapper {
	void insertBoard(BoardVO vo) throws Exception;
	void updateBoard(BoardVO vo) throws Exception;
	void deleteBoard(BoardVO vo) throws Exception;
	BoardVO selectBoard(BoardVO vo) throws Exception;
	List<BoardVO> selectBoardList(BoardVO vo) throws Exception;
	
	List<BoardVO> selectBoardListup(BoardVO vo) throws Exception;//오름차순
	List<BoardVO> selectBoardListdown(BoardVO vo) throws Exception;//내림차순
	String getIdByName(String categoryName) throws Exception;
	
	void updateRcmdin(BoardVO vo) throws Exception;
	void updateViewNum(BoardVO vo) throws Exception;
	int countTotalRecords(BoardVO vo) throws Exception;
}
