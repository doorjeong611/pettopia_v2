package com.example.pettopia.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Board;

@Mapper
public interface BoardMapper {

//	게시글 작성 /board/addBoard 작업자 : 이준호	
	Integer insertBoard (Board board);
	
//	게시판 리스트 /board/getBoardList 작업자 : 이준호	
	List<Map<String, Object>> selectBoardList (String boardCategory, Map<String, Object> boardMap);

//	게시글 삭제 쿼리 /board/removeBoard 작업자 : 이준호 
	Integer deleteBoard (int boardNo);
	
// 	게시글 조회수 증가 /board/updateBoard 작업자 : 이준호
	int updateBoard(Board board);
}
