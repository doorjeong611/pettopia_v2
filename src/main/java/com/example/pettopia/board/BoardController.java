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
	
	@GetMapping("/board/modifyBoard")
	public String modifyBoard() {
		return "board/modifyBoard";
	}

	@GetMapping("/board/getBoardOne")
	public String getBoardOne(Model model,
								Board board,
								Authentication auth,
								@RequestParam(required = false) String divisionCode,
								@RequestParam(required = false) Integer boardNo
								) {
	    Map<String, Object> map = new HashMap<>();
	   
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
	
	
}
