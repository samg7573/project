package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.sample.service.ExerciseVO;
import egovframework.sample.service.exerciseDAO;
import egovframework.sample.service.exerciseService;

@Service("dayExerviceService")
public class dayExerciseServiceImpl extends EgovAbstractServiceImpl implements exerciseService {

	@Resource(name = "exerciseRepository")
	private exerciseDAO excerciseDAO;
	
	@Override
	public void insertBoard(ExerciseVO vo) throws Exception {
		excerciseDAO.insertExercise(vo);
	}

	@Override
	public void updateBoard(ExerciseVO vo) throws Exception {
		excerciseDAO.updateExercise(vo);

	}

	@Override
	public void deleteBoard(ExerciseVO vo) throws Exception {
		excerciseDAO.deleteExercise(vo);
	}

	@Override
	public ExerciseVO selectBoard(ExerciseVO vo) throws Exception {
		return excerciseDAO.selectExerciseID(vo);
	}

	//0: 타회원 운동루틴 작성글 목록 검색. 1: 회원 루틴 작성글 목록 검색
	@Override
	public List<ExerciseVO> selectBoardList(ExerciseVO vo) throws Exception {
			return excerciseDAO.selectAllExerciseList(vo);
	}
	
	@Override
	public List<ExerciseVO> selectOtherExerBoardList(ExerciseVO vo) throws Exception {
		return excerciseDAO.selectOtherUserAllExerciseList(vo);
	}	
	
	@Override
	public List<ExerciseVO> searchingInfo(ExerciseVO vo) throws Exception {
		return excerciseDAO.searchingInfo(vo);
	}

	@Override
	public List<ExerciseVO> selectOthersearchingInfo(ExerciseVO vo) throws Exception {
		return excerciseDAO.OthersearchingInfo(vo);
	}

	@Override
	public void ExerciseBoardInqcnt(ExerciseVO vo) throws Exception {
		excerciseDAO.updateExerInqcnt(vo);
	}

	@Override
	public List<ExerciseVO> getDateList(ExerciseVO vo) throws Exception {
		return excerciseDAO.getDateList(vo);
	}
}
