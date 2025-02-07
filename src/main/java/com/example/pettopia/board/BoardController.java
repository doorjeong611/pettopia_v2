package com.example.pettopia.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Board;
import com.example.pettopia.vo.BoardComment;
import com.example.pettopia.vo.BoardFile;
import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Employee;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@Slf4j
public class BoardController {
	@Autowired BoardService boardService;
	
	// 댓글 작성
	@PostMapping("/board/boardComment")
	public String addComment(BoardComment boardComment,
	                         Authentication auth,
	                         @RequestParam("boardNo") Integer boardNo) {

	    // 로그인 세션에서 사용자 정보 가져오기
	    EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
	    String empNo = empUserDetails.getUsername();
	    
	    // BoardComment 객체에 commentWriterNo 설정
	    boardComment.setCommentWriterNo(empNo);

	    // 일반 댓글 작성 시에는 parentCommentNo를 설정하지 않음
	    boardComment.setParentCommentNo(null);  // 일반 댓글이라면 부모 댓글 번호가 없으므로 null 설정
	    boardComment.setCommentDepth("1");  // 일반 댓글이라면 깊이는 1로 설정

	    // 댓글 작성 처리
	    int result = boardService.addComment(boardComment);

	    // 댓글 작성 결과 처리
	    if (result > 0) {
	        return "redirect:/board/getBoardOne?boardNo=" + boardNo;
	    } else {
	        return "redirect:/board/getBoardOne?boardNo=" + boardNo + "&error=true";
	    }
	}
	
	// 대댓글
	@PostMapping("/board/boardCommentDepth")
	public String addCommentDepth(BoardComment boardComment,
	                               Authentication auth,
	                               @RequestParam("boardNo") Integer boardNo,
	                               @RequestParam(value = "parentCommentNo", required = false) Integer parentCommentNo) {

	    // 로그인 세션에서 사용자 정보 가져오기
	    EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
	    String empNo = empUserDetails.getUsername();

	    // BoardComment 객체에 commentWriterNo 설정
	    boardComment.setCommentWriterNo(empNo);
	    boardComment.setBoardNo(boardNo);

	    // parentCommentNo가 null이면 일반 댓글, 아니면 대댓글
	    if (parentCommentNo != null) {
	        // 대댓글인 경우: parentCommentNo 설정하고, commentDepth는 2로 설정
	        boardComment.setParentCommentNo(parentCommentNo);  // 부모 댓글 번호 (부모의 commentNo를 parentCommentNo로 설정)
	        boardComment.setCommentDepth("2");  // 대댓글이면 깊이는 2
	    } else {
	        // 일반 댓글인 경우: parentCommentNo는 null, commentDepth는 1로 설정
	        boardComment.setParentCommentNo(null); // 일반 댓글은 parentCommentNo가 null
	        boardComment.setCommentDepth("1");  // 일반 댓글 깊이는 1
	    }

	    // 댓글 작성 처리
	    int result = boardService.addCommentDepth(boardComment);

	    // 대댓글 작성 결과 처리
	    if (result > 0) {
	        return "redirect:/board/getBoardOne?boardNo=" + boardNo;
	    } else {
	        return "redirect:/board/getBoardOne?boardNo=" + boardNo + "&error=true";
	    }
	}

	// 게시글 수정 폼 호출
	@GetMapping("/board/modifyBoard")
	public String modifyBoard(Authentication auth,
							  Model model,
							  @RequestParam(required = false) String boardCategory,
							  @RequestParam(required = false) Integer boardNo) {
		// 로그인 세션
	    EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
	    String empNo = empUserDetails.getUsername();;
		
	  
	    
	    // 상세 글보기 셀렉트
	    Map<String, Object> boardOneMap = boardService.getListByBoardOne(boardNo);
	    String boardHeader = (String) boardOneMap.get("boardHeader");
	   
	    log.debug("boardHeader >>>> : "+boardHeader);
	    
	    // 모델값
	    model.addAttribute("boardCategory", boardHeader);
	    model.addAttribute("empNo", empNo);
		model.addAttribute("boardMap",boardOneMap);
		model.addAttribute("boardNo",boardNo);
		
		return "board/modifyBoard";
	}

	// 게시판 수정
	@PostMapping("/board/modifyBoard")
	public String getModifyBoard(Authentication auth,
	                              @ModelAttribute Board board,
	                              @RequestParam(required = false) Integer boardNo,
	                              @RequestParam(value = "boardImg", required = false) MultipartFile boardImg,
	                              @RequestParam(value = "category") String boardCategory,
	                              @RequestParam(value = "content", defaultValue = "") String boardContent,
	                              HttpSession session) {
		
	    log.debug(TeamColor.LJH + "updateBoard : " + board + TeamColor.RESET);

	    // category가 빈 값일 경우 null로 설정
	    if (boardCategory.isEmpty()) {
	        boardCategory = null;
	    }
	    board.setBoardHeader(boardCategory);

	    // 이미지 저장 경로 설정
	    String boardImagePath = session.getServletContext().getRealPath("/boardFile/");
	    
	    try {
	    	boardService.modifyBoardFile(board, boardImg, boardImagePath);
	    } catch (Exception e) {
	        // 예외 처리 (로깅, 사용자에게 오류 메시지 등을 표시)
	        log.error("수정 중 오류 발생", e);
	        return "errorPage"; // 오류 페이지로 리다이렉트 또는 에러 처리
	    }
	    
	    return "redirect:/board/boardList";
	}

	
	@GetMapping("/board/getBoardOne")
	public String getBoardOne(Model model,
								Board board,
								Authentication auth,
								@RequestParam(defaultValue = "") String boardComment,
								@RequestParam(required = false) Integer boardNo
								) {
	    // 댓글 셀렉트
        List<Map<String, Object>> comments = boardService.getSelectBoardComment(boardNo);
        log.debug("comment : " + comments);
	   
	    // 조회수 증가
	    int successViewByBoard = boardService.addBoardView(board);
	    // 상세 글보기 셀렉트
	    Map<String, Object> boardOneMap = boardService.getListByBoardOne(boardNo);
	    
		// 보드헤더 값
	    String boardHeader = (String) boardOneMap.get("boardHeader");
	    
	    // 로그인 세션
	    EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
	    String empNo = empUserDetails.getUsername();
	    String boardWriterNo = board.getBoardWriterNo();
	
	    if(successViewByBoard != 1) {
	    	return "redirect:/board/boardList";
	    }
	    


	    // 모델값  
	    model.addAttribute("comment", comments);
	    model.addAttribute("boardCategory", boardHeader);
	    model.addAttribute("boardWriterNo",boardWriterNo);
	    model.addAttribute("empNo", empNo);
		model.addAttribute("boardMap",boardOneMap);
		model.addAttribute("boardNo",boardNo);
		
	 
		return "board/boardOne";
	}
	
	@PostMapping("/board/addBoard")
	public String addBoard(Model model,
	        HttpSession session,
	        RedirectAttributes redirectAttributes,
	        @ModelAttribute Board board,
	        @RequestParam("boardImg") MultipartFile boardImg,
	        @RequestParam(value = "category") String boardCategory,
	        @RequestParam(value = "content", defaultValue = "빈 값입니다.") String boardContent,
	        Authentication auth) {
		  

	    // category가 빈 값일 경우 null로 설정
	    if (boardCategory.isEmpty()) {
	        boardCategory = null;
	    }
	    
	    // boardCategory를 boardHeader로 설정
	    board.setBoardHeader(boardCategory);  // boardCategory 값이 boardHeader로 사용됨
	    
	    EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
	    String boardWriterNo = empUserDetails.getUsername();
	    
	    // 작성자ID 삽입 
	    board.setBoardWriterNo(boardWriterNo);
	    
	    
	    	String boardImagePath = session.getServletContext().getRealPath("/boardFile/");
			try {
				boardService.addBoardOne(board, boardImg, boardImagePath);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		
	    // boardContent가 제대로 전달되었는지 확인
	    if (board.getBoardContent() == null || board.getBoardContent().isEmpty()) {
	    	log.debug(TeamColor.LJH + "boardContent is empty or null" + TeamColor.RESET);
	    } else {
	    	log.debug(TeamColor.LJH + "boardContent: " + board.getBoardContent() + TeamColor.RESET);
	    }
	   
		
		log.debug("카테고리값 : " + boardCategory);
		
	    // 카테고리 모델에 추가
	    model.addAttribute("boardCategory", boardCategory);
	    
	    // 카테고리 정보 모델에 추가
	    Map<String, Object> categoryByAddBoard = new HashMap<>();
	    model.addAttribute("categoryByAddBoard", categoryByAddBoard);
	   
	    log.debug(TeamColor.LJH + "보드 헤더 : " + boardCategory + TeamColor.RESET);

	    // 리다이렉트
	    return "redirect:/board/boardList";
	}
	
	// 게시글 작성 구현 /board/addBoard/ 작업자 : 이준호
	@GetMapping("/board/addBoard")
	public String addBoard(Model model,
							@RequestParam(required = false) String divisionCode,
							 @RequestParam(value = "category", defaultValue = "ALL") String boardCategory
							 ) {
		
		
		
		
		List<Division> divisionList = boardService.getDivisionList();
		
		Map<String, Object> categoryByAddBoard = new HashMap<>();
	
		categoryByAddBoard.put("division", divisionCode);
		categoryByAddBoard.put("divisionList", divisionList);
		
		model.addAttribute("division", categoryByAddBoard);
		model.addAttribute("CurrentdivisionCode", divisionCode);
		return "board/addBoard";
	}
	
    
	
	// 게시판 리스트 구현 /board/boardList 작업자 : 이준호
	@PostMapping("/board/boardList")
	public String getBoardList() {
		
		return "board/boardList";
	}
	
	@GetMapping("/board/boardList")
	public String boardList(Model model,
	                        Board board,
	                        Authentication auth,
	                        @RequestParam(defaultValue = "1") Integer currentPage,
	                        @RequestParam(defaultValue = "10") Integer rowPerPage,
	                        @RequestParam(value = "category", defaultValue = "ALL") String boardCategory,
	                        @RequestParam(required = false) Integer boardNo,
	                        @RequestParam(required = false) String searchBoard) {

	    // 게시판 목록과 페이징 정보 조회
	    Map<String, Object> result = boardService.getBoardList(currentPage, rowPerPage, boardCategory, new HashMap<>(), searchBoard);

	    // 페이징 정보 추출
	    Integer startPagingNum = (Integer) result.get("startPagingNum");
	    Integer endPagingNum = (Integer) result.get("endPagingNum");
	    Integer lastPage = boardService.getLastPage(rowPerPage, boardCategory, searchBoard);

	    @SuppressWarnings("unchecked")
	    List<Map<String, Object>> boardList = (List<Map<String, Object>>) result.get("boardList");


	    // 로그인된 사용자 정보
	    EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
	    String empNo = empUserDetails.getUsername();

	    // 모델에 데이터 추가
	    model.addAttribute("searchBoard", searchBoard);
	    model.addAttribute("currentPage", currentPage);  // currentPage 값 다시 모델에 추가
	    model.addAttribute("lastPage", lastPage);
	    model.addAttribute("empNo", empNo);
	    model.addAttribute("boardList", boardList);  // boardList 모델에 추가
	    model.addAttribute("boardNo", boardNo);
	    model.addAttribute("boardCategory", boardCategory);
	    model.addAttribute("startPagingNum", startPagingNum);
	    model.addAttribute("endPagingNum", endPagingNum);  // endPagingNum 추가

	    return "board/boardList";  // 게시판 목록 페이지 반환
	}

	
	//	게시글 댓글 통합 삭제 /board/removeBoard 작업자 : 이준호
	@GetMapping("/board/removeBoard")
	public String removeBoard(@RequestParam Integer boardNo) {
		boardService.deleteBoardWithComment(boardNo);
		return "redirect:/board/boardList";
	}
	
	@GetMapping("/board/removeComment")
	public String removeComment(@RequestParam Integer commentNo, @RequestParam Integer boardNo) {
		boardService.deleteComment(commentNo);
		return "redirect:/board/getBoardOne?boardNo=" + boardNo;
	}
	
	@GetMapping("/board/removeFile")
	public String removeFile(@RequestParam Integer boardNo) {
		boardService.deleteFile(boardNo);
		return "redirect:/board/getBoardOne?boardNo=" + boardNo;
	}
	
}
