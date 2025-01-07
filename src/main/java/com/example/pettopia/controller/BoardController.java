package com.example.pettopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.pettopia.service.BoardService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class BoardController {
	@Autowired BoardService boardService;
	// 게시판 리스트 구현 /board/boardList 작업자 : 이준호
	@GetMapping("/board/boardList")
	public String getBoardList() {
		
		return "board/boardList";
	}
	
	
//	게시글 댓글 통합 삭제 /board/removeBoard 작업자 : 이준호
	@GetMapping("/board/removeBoard")
	public String removeBoard(@RequestParam Integer boardNo) {
		
		boardService.deleteBoardWithComment(boardNo);
		return "redirect:/board/boardList";
	}
	
}
