package egovframework.sample.service;

import java.util.List;

public interface BoardDAO {
	void insertBoard(BoardVO vo) throws Exception;
	void updateBoard(BoardVO vo) throws Exception;
	void deleteBoard(BoardVO vo) throws Exception;
	BoardVO selectBoard(BoardVO vo) throws Exception;
	List<BoardVO> selectBoardList(BoardVO vo) throws Exception;
	List<BoardVO> selectPracticeListup(BoardVO vo) throws Exception;//오름차순
	List<BoardVO> selectPracticeListdown(BoardVO vo) throws Exception;//내림차순
	String getIdByName(String categoryName) throws Exception;
	
	void increaseRcmdin(String boardId);
	void updateRcmdin(BoardVO vo) throws Exception;
	void updateViewNum(String boardId);
	int countTotalRecords(BoardVO vo) throws Exception;
}
