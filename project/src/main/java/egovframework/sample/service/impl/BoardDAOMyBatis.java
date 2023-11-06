package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.sample.service.BoardDAO;
import egovframework.sample.service.BoardVO;

@Repository("boardDaoMyBatis")
public class BoardDAOMyBatis implements BoardDAO {

	@Resource(name = "boardMapper")
	private BoardMapper mybatis;

	@Resource(name = "categoryMapper")
	private CategoryMapper mybatisc;

	public BoardDAOMyBatis() {
		System.out.println("BoardDAOMyBatis 생성");
	}

	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		System.out.println("MyBatis로 insert 기능 처리");
		mybatis.insertBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		System.out.println("MyBatis로 update 기능 처리");
		mybatis.updateBoard(vo);

	}

	@Override
	public void deleteBoard(BoardVO vo) throws Exception {
		System.out.println("MyBatis로 delete 기능 처리");
		mybatis.deleteBoard(vo);

	}

	@Override
	public BoardVO selectBoard(BoardVO vo) throws Exception {
		System.out.println("MyBatis로 select 기능 처리");
		return (BoardVO) mybatis.selectBoard(vo);
	}

	@Override
	public List<BoardVO> selectBoardList(BoardVO vo) throws Exception {
		System.out.println("MyBatis로 selectBoardList 기능 처리");
		return mybatis.selectBoardList(vo);
	}

	@Override
	public List<BoardVO> selectPracticeListup(BoardVO vo) throws Exception {
		System.out.println("MyBatis로 select(오름차순) 기능 처리");
		return null;
	}

	@Override
	public List<BoardVO> selectPracticeListdown(BoardVO vo) throws Exception {
		System.out.println("MyBatis로 select(내림차순) 기능 처리");
		return null;
	}

	@Override
	public String getIdByName(String categoryName) throws Exception {
		/*
		 * System.out.println("MyBatis로 getIdByName 기능 처리"); return
		 * mybatisc.getIdByName(categoryName);
		 */
		return null;
	}

	@Override
	public void increaseRcmdin(String id) {
		BoardVO board = new BoardVO(); // BoardVO 객체 생성
		board.setId(id); // boardId 값을 설정
		System.out.println("아이디:" + id);
		try {
			board = mybatis.selectBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (board != null) {
			System.out.println("MyBatis로 추천수 증가 기능");
			board.setRcmdin_cnt(board.getRcmdin_cnt() + 1);
			try {
				mybatis.updateBoard(board);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	@Override
	public void updateRcmdin(BoardVO vo) throws Exception {
		mybatis.updateRcmdin(vo);

	}

	@Override
	public void updateViewNum(String id) {
		BoardVO board = new BoardVO(); // BoardVO 객체 생성
	    board.setId(id); // boardId 값을 설정

	    try {
	        board = mybatis.selectBoard(board);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    if (board != null) {
	        System.out.println("MyBatis로 조회수 증가 기능");
	        board.setView_num(board.getView_num() + 1); // 조회수 증가
	        try {
	            mybatis.updateViewNum(board); // 게시물 업데이트
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
		
	}

	@Override
	public int countTotalRecords(BoardVO vo) throws Exception {
		return mybatis.countTotalRecords(vo);
	}
	

}
