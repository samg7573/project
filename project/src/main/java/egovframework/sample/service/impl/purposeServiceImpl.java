package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.sample.service.PurposeVO;
import egovframework.sample.service.purposeDAO;
import egovframework.sample.service.purposeService;

@Service("purposeService")
public class purposeServiceImpl extends EgovAbstractServiceImpl implements purposeService {

	@Resource(name = "purposeRepository")
	private purposeDAO purposeDAO;
	
	@Override
	public void insertBoard(PurposeVO vo) throws Exception {
		
		purposeDAO.insertPurpose(vo);

	}

	@Override
	public void updateBoard(PurposeVO vo) throws Exception {
		purposeDAO.updatePurpose(vo);

	}

	@Override
	public void deleteBoard(PurposeVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Long BoardListcount() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PurposeVO selectBoard(PurposeVO vo) throws Exception {
		return purposeDAO.selectPurposeID(vo);
	}

	@Override
	public List<PurposeVO> selectBoardList(PurposeVO vo) throws Exception {
		return purposeDAO.selectAllPurposeList(vo);
	}

	@Override
	public List<PurposeVO> selectYM(PurposeVO vo) throws Exception{
		return purposeDAO.selectYM(vo);
	}
	
	@Override
	public PurposeVO selectYMD(PurposeVO vo) throws Exception{
		return purposeDAO.selectYMD(vo);
	}
}
