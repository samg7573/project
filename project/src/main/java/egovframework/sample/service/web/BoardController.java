package egovframework.sample.service.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.sample.service.BoardService;
import egovframework.sample.service.BoardVO;
import egovframework.sample.service.CategorybService;
import egovframework.sample.service.CategorybVO;
import egovframework.sample.service.CommentbService;
import egovframework.sample.service.CommentbVO;
import egovframework.sample.service.UserService;
import egovframework.sample.service.UserVO;
import egovframework.sample.service.impl.CategorybMapper;



@Controller
@SessionAttributes("board")
public class BoardController {
   
   @Resource(name="boardService")
   private BoardService boardService;
   
   @Resource(name = "categorybMapper")
    private CategorybMapper categorybMapper;
   
   @Autowired
   private CommentbService commentbService;
   
   @Resource(name = "userService")
   private UserService userService;
   
   @Resource(name = "categorybService")
   private CategorybService categorybService;
   
   @RequestMapping(value="/insertBoard.do",method = RequestMethod.GET)
   public String insertBoardView(BoardVO vo) throws Exception{
      System.out.println("게시글 등록 화면으로 이동");
      
      return "insertBoard";
   }
   
   @RequestMapping(value="/insertBoard.do",method = RequestMethod.POST)
   public String insertBoard(BoardVO vo) throws Exception{
      
      System.out.println("게시글 등록처리");
      boardService.insertBoard(vo);
      return "forward:selectBoardList.do";
   }
   
   @RequestMapping("/updateBoard.do")
   public String updateBoard(@ModelAttribute("board")BoardVO vo, Model model)throws Exception{
      System.out.println("게시글 수정");
      boardService.updateBoard(vo);
      return "forward:selectBoardList.do";
   }
   
   @RequestMapping("/deleteBoard.do")
   public String deleteBoard(BoardVO vo)throws Exception{
      System.out.println("게시글 삭제");
      boardService.deleteBoard(vo);
      return "forward:selectBoardList.do";
   }
   
   @RequestMapping("/selectBoard.do")
   public String selectBoard(BoardVO vo,Model model)throws Exception{
      System.out.println("게시글 상세 조회");
      
      BoardVO selectedBoard = boardService.selectBoard(vo); // 선택한 게시글 조회
       List<CommentbVO> commentbList = commentbService.selectCommentbList(selectedBoard.getId());
       // 댓글 작성자 아이디를 닉네임으로 변경하여 새로운 목록을 생성
       List<CommentbVO> commentbListfinal = new ArrayList<CommentbVO>();

       for (CommentbVO commentb : commentbList) {
           String temp = commentb.getReg_user();
           // 여기서 temp는 댓글 작성자의 아이디
           UserVO user = userService.getUserById(temp);
           commentb.setReg_user(user.getNick_nm()); // 회원 닉네임으로 변경
           commentbListfinal.add(commentb);
       }
       
       String temp = selectedBoard.getReg_user();
       UserVO user = userService.getUserById(temp);
       String temp2 = selectedBoard.getCtgry_b();
       CategorybVO category = categorybService.getIdByName(temp2);
       
       
       
       model.addAttribute("board", selectedBoard);
       model.addAttribute("Nick_nm", user.getNick_nm());
      model.addAttribute("ctgry", category.getClsf_nm());    
       
//      model.addAttribute("board", boardService.selectBoard(vo));
       model.addAttribute("commentbList", commentbListfinal);
      return "selectBoard";
   }
   
   
   @RequestMapping("/selectBoardList.do")
   public String selectBoardList(BoardVO vo, Model model,
       @RequestParam(defaultValue = "1") int page, // 페이지 번호, 기본값 1
       @RequestParam(defaultValue = "10") int pageSize, // 페이지당 게시물 수, 기본값 10
       @RequestParam(value = "searchCondition", required = false) String searchCondition,
       @RequestParam(value = "searchKeyword", required = false) String searchKeyword)
       throws Exception {        
       System.out.println("목록 검색 처리");
       
       // 페이지 번호와 페이지당 게시물 수로 시작 인덱스 계산
       int startIndex = 0;
       if(page == 1)
          startIndex = (page - 1) * pageSize;
       else
          startIndex = ((page - 1) * pageSize)+1;
       // vo에 startIndex와 pageSize 설정
       vo.setStartIndex(startIndex);
       vo.setPageSize(pageSize);
       // 전체 게시물 수 가져오기
       int totalRecords = boardService.countTotalRecords(vo);
       // 페이지 수 계산
       int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
       // 페이지 번호와 페이지당 게시물 수로 시작 인덱스 계산
       int endIndex = (page) * pageSize;
       // 게시물 목록 가져오기
       
       vo.setSearchCondition(searchCondition);
       vo.setSearchKeyWord(searchKeyword);
       vo.setEndIndex(endIndex);
       
       List<BoardVO> boardList = boardService.selectBoardList(vo);
       List<BoardVO> boardListfinal = new ArrayList<BoardVO>();  
//       List<BoardVO> boardListfinal2 = new ArrayList<BoardVO>();
       
       
       for (BoardVO board : boardList) {
          String temp = board.getReg_user();
          String temp2 = board.getCtgry_b();
          UserVO user = userService.getUserById(temp);
          CategorybVO category = categorybService.getIdByName(temp2);
          board.setReg_user(user.getNick_nm());      
          board.setCtgry_b(category.getClsf_nm());
          boardListfinal.add(board);
       }
       
       model.addAttribute("boardList", boardListfinal);
       model.addAttribute("currentPage", page);
       model.addAttribute("totalPages", totalPages);
//       model.addAttribute("boardList", boardService.selectBoardList(vo));
       
       

       return "selectBoardList";
   }
   
   @RequestMapping(value = "/increaseRcmdin.do", method = RequestMethod.POST)
    @ResponseBody
    public String increaseRcmdin(@RequestParam("id") String id) {
      System.out.println("추천수 증가");

       //추가
       BoardVO board = new BoardVO();
       board.setRcmdin_cnt(board.getRcmdin_cnt() + 1);
       //추가
       boardService.increaseRcmdin(id);
        return "Success";
    }
   
   @RequestMapping("/updateViewNum.do")
   public String updateViewNum(@RequestParam("id") String id) throws Exception {
       System.out.println("조회수 증가");

       // 게시물의 조회수를 증가시키는 서비스 메서드를 호출합니다.
       boardService.updateViewNum(id);

       // 게시물 상세 페이지로 리다이렉트합니다.
       return "redirect:/selectBoard.do?id=" + id;
   }
   
   
}