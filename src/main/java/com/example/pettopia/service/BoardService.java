package com.example.pettopia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.pettopia.mapper.BoardMapper;
import com.example.pettopia.mapper.CommentMapper;

@Transactional
@Service
public class BoardService {
	@Autowired BoardMapper boardMapper;
	@Autowired CommentMapper commentMapper;
	
//	게시글 댓글 통합 삭제 /board/removeBoard 작업자 : 이준호 
	public void deleteBoardWithComment(int boardNo) {
		// 댓글 삭제
		commentMapper.deleteComment(boardNo);
		// 게시글 삭제 
		boardMapper.deleteBoard(boardNo);
	}
	
}
