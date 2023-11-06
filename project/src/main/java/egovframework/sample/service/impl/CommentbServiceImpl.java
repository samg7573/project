package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.sample.service.CommentbService;
import egovframework.sample.service.CommentbVO;

@Service
public class CommentbServiceImpl extends EgovAbstractServiceImpl implements CommentbService{

	@Resource(name="commentbdaoMyBatis")
	private CommentbDAO commentbDAO;
	
	@Resource(name="egovCommentBIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Override
	public void insertCommentb(CommentbVO vo) throws Exception {
		//아이디제너레이션(COMMENTB-001의 형식으로 지정)
		String id=egovIdGnrService.getNextStringId();
		vo.setId(id);
		commentbDAO.insertCommentb(vo);
		
	}

	@Override
	public void updateCommentb(CommentbVO vo) throws Exception {
		commentbDAO.updateCommentb(vo);
		
	}

	@Override
	public void deleteCommentb(CommentbVO vo) throws Exception {
		
		commentbDAO.deleteCommentb(vo);
		
		
	}


	@Override
	public List<CommentbVO> selectCommentbList(String bbs_fk) throws Exception {
		return commentbDAO.selectCommentbList(bbs_fk);
	}
	

}
