package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.sample.service.CommentfDAO;
import egovframework.sample.service.CommentfService;
import egovframework.sample.service.CommentfVO;

@Service
public class CommentfServiceImpl extends EgovAbstractServiceImpl implements CommentfService{
	@Resource(name="commentfdaoMyBatis")
	private CommentfDAO commentfDAO;
	
	@Resource(name="egovCommentFIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Override
	public void insertCommentf(CommentfVO vo) throws Exception {
		//아이디제너레이션(COMMENTB-001의 형식으로 지정)
		String id=egovIdGnrService.getNextStringId();
		vo.setId(id);
		commentfDAO.insertCommentf(vo);
		
	}

	@Override
	public void updateCommentf(CommentfVO vo) throws Exception {
		commentfDAO.updateCommentf(vo);
		
	}

	@Override
	public void deleteCommentf(CommentfVO vo) throws Exception {
		
		commentfDAO.deleteCommentf(vo);
		
		
	}


	@Override
	public List<CommentfVO> selectCommentfList(String bbs_fk) throws Exception {
		return commentfDAO.selectCommentfList(bbs_fk);
	}
	
}
