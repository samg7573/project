package egovframework.sample.service;

import java.util.List;

public interface exerciseService {

	void insertBoard(ExerciseVO vo) throws Exception;

	void updateBoard(ExerciseVO vo) throws Exception;

	void deleteBoard(ExerciseVO vo) throws Exception;

	ExerciseVO selectBoard(ExerciseVO vo) throws Exception;

	// 회원 루틴 작성글 전체목록 검색
	List<ExerciseVO> selectBoardList(ExerciseVO vo) throws Exception;

	// 타 회원 루틴 작성글 전체목록 검색
	List<ExerciseVO> selectOtherExerBoardList(ExerciseVO vo) throws Exception;

	List<ExerciseVO> searchingInfo(ExerciseVO vo) throws Exception;

	List<ExerciseVO> selectOthersearchingInfo(ExerciseVO vo) throws Exception;

	void ExerciseBoardInqcnt(ExerciseVO vo) throws Exception;
	
	List<ExerciseVO> getDateList(ExerciseVO vo) throws Exception;
	
	
}