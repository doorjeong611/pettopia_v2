package com.example.pettopia.board;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.pettopia.boardcomment.CommentMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Board;
import com.example.pettopia.vo.Division;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Service
@Slf4j
public class BoardService {
	@Autowired BoardMapper boardMapper;
	@Autowired CommentMapper commentMapper;
	
// 부서 번호 카테고리 작업자 : 이준호
	public List<Division> getDivisionList(){
			
			// log.debug(TeamColor.KMJ+"[NoticeService - getDivisionList]");
			
			List<Division> divisionList = boardMapper.selectDivisionList();
			// log.debug(TeamColor.KMJ+ "divisionList : " + divisionList.toString() + TeamColor.RESET);
			
			return divisionList;
					
		}

// 게시글 작성
	public Integer insertBoard(Board board) {
		return boardMapper.insertBoard(board);
	}
	
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
