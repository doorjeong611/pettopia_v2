package com.example.pettopia.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.pettopia.vo.Board;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
public class BoardController {
	@Autowired BoardService boardService;
	
	// 게시글 작성 구현 /board/addBoard/ 작업자 : 이준호
	@GetMapping("/board/addBoard")
	public String addBoard() {
		
		return "board/addBoard";
	}
	
	
	// 게시판 리스트 구현 /board/boardList 작업자 : 이준호
	@PostMapping("/board/boardList")
	public String getBoardList() {
		
		return "board/boardList";
	}
	
	@GetMapping("/board/boardList")
	public String boardList(Model model,
	                        @RequestParam(value = "category", defaultValue = "ALL") String boardCategory,
	                        HttpServletRequest request) {
	    Map<String, Object> map = new HashMap<>();
	    
	    // 게시판 목록 조회
	    List<Map<String, Object>> boardList = boardService.getBoardList(boardCategory, map);
	    model.addAttribute("boardList", boardList);
	    model.addAttribute("boardCategory", boardCategory);

	    // AJAX 요청인지 확인
	    if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
	        // AJAX 요청일 경우, boardListFragment.jsp 파일을 반환
	        return "board/boardListFragment";  // boardListFragment.jsp 파일을 반환
	    }

	    // 일반 요청일 경우, 전체 페이지 반환
	    return "board/boardList";  // 전체 페이지 뷰 반환
	}
	
	//	게시글 댓글 통합 삭제 /board/removeBoard 작업자 : 이준호
	@GetMapping("/board/removeBoard")
	public String removeBoard(@RequestParam Integer boardNo) {
		
		boardService.deleteBoardWithComment(boardNo);
		return "redirect:/board/boardList";
	}
	
	
}
