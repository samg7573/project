package egovframework.sample.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("exerciseRepository")
public class exerciseDAO extends EgovAbstractMapper {

	public void insertExercise(ExerciseVO vo) throws Exception {
		insert("insertExercise", vo);
	}

	public void updateExercise(ExerciseVO vo) throws Exception {
		update("updateExercise", vo);
	}

	public void deleteExercise(ExerciseVO vo) throws Exception {
		delete("deleteExercise", vo);
	}

	public ExerciseVO selectExerciseID(ExerciseVO vo) throws Exception {
		return selectOne("selectExerciseID", vo);
	}

	public List<ExerciseVO> selectAllExerciseList(ExerciseVO vo) throws Exception {
		return selectList("selectAllExerciseList", vo);
	}

	public List<ExerciseVO> selectOtherUserAllExerciseList(ExerciseVO vo) throws Exception {
		return selectList("otherUserSelectAllExerciseList", vo);
	}

	public List<ExerciseVO> searchingInfo(ExerciseVO vo) throws Exception {
		return selectList("searchingInfo", vo);
	}

	public List<ExerciseVO> OthersearchingInfo(ExerciseVO vo) throws Exception {
		return selectList("OthersearchingInfo", vo);
	}

	public void updateExerInqcnt(ExerciseVO vo) throws Exception {
		update("updateExerInqcnt", vo);
	}

	public  List<ExerciseVO> getDateList(ExerciseVO vo) throws Exception {
		return selectList("getDateList",vo);
	}

}
