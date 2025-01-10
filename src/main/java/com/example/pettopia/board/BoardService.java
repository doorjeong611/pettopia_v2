package com.example.pettopia.board;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.pettopia.boardcomment.CommentMapper;
import com.example.pettopia.vo.Board;

@Transactional
@Service
public class BoardService {
	@Autowired BoardMapper boardMapper;
	@Autowired CommentMapper commentMapper;
	
// 카테고리 테스트
	
	
//	게시글 댓글 통합 삭제 /board/removeBoard 작업자 : 이준호 
	public void deleteBoardWithComment(int boardNo) {
		// 댓글 삭제
		commentMapper.deleteComment(boardNo);
		// 게시글 삭제 
		boardMapper.deleteBoard(boardNo);
	}
	
	public List<Map<String, Object>> getBoardList(String boardCategory, Map<String, Object> boardMap){
		
		
		return boardMapper.selectBoardList(boardCategory,boardMap);
	}
	
// 게시글 조회수 증가
	
	public int addBoardView(Board board) {
		
		return boardMapper.updateBoard(board);
	}
	
}
