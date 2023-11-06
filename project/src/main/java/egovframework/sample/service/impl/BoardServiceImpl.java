package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.sample.service.BoardDAO;
import egovframework.sample.service.BoardService;
import egovframework.sample.service.BoardVO;
import egovframework.sample.service.CategorybService;


@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {

	@Resource(name = "boardDaoMyBatis")
	private BoardDAO boardDAO;

	@Resource(name = "egovBoardIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Resource(name = "categoryMapper")
    private CategoryMapper categoryMapper;
	
	public BoardServiceImpl() {
		System.out.println("===> BoardServiceImpl 생성자");
	}

	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		System.out.println("BoardService -- Board 등록");
		String id = egovIdGnrService.getNextStringId();
		vo.setId(id);
		boardDAO.insertBoard(vo);


	}
	
	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		System.out.println("BoardService -- Board 수정");
		boardDAO.updateBoard(vo);

	}

	@Override
	public void deleteBoard(BoardVO vo) throws Exception {
		System.out.println("BoardService -- Board 삭제");
		boardDAO.deleteBoard(vo);

	}

	@Override
	public BoardVO selectBoard(BoardVO vo) throws Exception {
		System.out.println("BoardService -- Board 선택");
		return boardDAO.selectBoard(vo);
	}

	@Override
	public List<BoardVO> selectBoardList(BoardVO vo) throws Exception {
		System.out.println("BoardService -- Board 목록");
		return boardDAO.selectBoardList(vo);
	}

	@Override
	public List<BoardVO> selectPracticeListup(BoardVO vo) throws Exception {
		return boardDAO.selectPracticeListup(vo);
	}

	@Override
	public List<BoardVO> selectPracticeListdown(BoardVO vo) throws Exception {
		return boardDAO.selectPracticeListdown(vo);
	}

    @Override
    public void increaseRcmdin(String id) {
       BoardVO board = new BoardVO(); // BoardVO 객체 생성
        board.setId(id); // boardId 값을 설정
        try {
         board = boardDAO.selectBoard(board);
      } catch (Exception e) {
         e.printStackTrace();
      } 
        
        if (board != null) {
            board.setRcmdin_cnt(board.getRcmdin_cnt() + 1);
            try {
            boardDAO.updateRcmdin(board);
         } catch (Exception e) {
            e.printStackTrace();
         }
        }
    }

	@Override
	public void updateViewNum(String id) {
		BoardVO board = new BoardVO(); // BoardVO 객체 생성
	    board.setId(id); // boardId 값을 설정

	    try {
	        board = boardDAO.selectBoard(board);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    if (board != null) {
	        System.out.println("MyBatis로 조회수 증가 기능");
	        board.setView_num(board.getView_num()); // 조회수 증가
	        try {
	            boardDAO.updateViewNum(board.getId()); // 게시물 업데이트
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
		
		
	}

	@Override
	public int countTotalRecords(BoardVO vo) throws Exception {
		return boardDAO.countTotalRecords(vo);
	}
    
//    @Override
//    public void decreaseRcmdin(String id) {
//        BoardVO board = new BoardVO();
//        board.setId(id);
//        try {
//            board = boardDAO.selectBoard(board);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        if (board != null) {
//            int currentRcmdinCnt = board.getRcmdin_cnt();
//            if (currentRcmdinCnt > 0) {
//                board.setRcmdin_cnt(currentRcmdinCnt - 1);
//                try {
//                    boardDAO.updateRcmdin(board);
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//    }
    
}
