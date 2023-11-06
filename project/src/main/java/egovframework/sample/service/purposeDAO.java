package egovframework.sample.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("purposeRepository")
public class purposeDAO extends EgovAbstractMapper {

	public void insertPurpose(PurposeVO vo) throws Exception {
		insert("insertpurpose", vo);
	}

	public void updatePurpose(PurposeVO vo) throws Exception {
		update("updatepurpose", vo);
	}

	public void deletePurpose(PurposeVO vo) throws Exception {
		delete("deletepurpose", vo);
	}

	public PurposeVO selectPurposeID(PurposeVO vo) throws Exception {
		return selectOne("selectpurposeID", vo);
	}

	
	public List<PurposeVO> selectAllPurposeList(PurposeVO vo) throws Exception {
		return selectList("selectAllpurposeList", vo);
	}

	public List<PurposeVO> selectYM(PurposeVO vo)  throws Exception {
		return selectList("selectYM", vo);
	}
	
	public PurposeVO selectYMD(PurposeVO vo)  throws Exception {
		return selectOne("selectYMD", vo);
	}
}
