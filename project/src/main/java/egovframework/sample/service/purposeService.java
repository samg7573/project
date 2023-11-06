package egovframework.sample.service;

import java.util.List;

public interface purposeService {

	void insertBoard(PurposeVO vo) throws Exception;

	void updateBoard(PurposeVO vo) throws Exception;

	void deleteBoard(PurposeVO vo) throws Exception;

	PurposeVO selectBoard(PurposeVO vo) throws Exception;

	List<PurposeVO> selectBoardList(PurposeVO vo) throws Exception;
	
	Long BoardListcount() throws Exception;

	PurposeVO selectYMD(PurposeVO vo)throws Exception;
	List<PurposeVO> selectYM(PurposeVO vo)throws Exception;
	

}