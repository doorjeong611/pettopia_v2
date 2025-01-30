package com.example.pettopia.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Board;
import com.example.pettopia.vo.BoardFile;
import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.RoomImg;

@Mapper
public interface BoardMapper {
// 게시글 수정
	int updateBoard(Board board);
	
// 게시글 이미지 수정
	int updateBoardFile(BoardFile boardFile);
	
// 게시판 파일 셀렉트	
	List<BoardFile> selectBoardFile(int boardNo);
	
// 게시판 이미지 내용 추가
	int insertBoardFile(BoardFile boardFile);
	
// 게시판 내용 및 이미지 조회
	List<Map<String, Object>> selectBoardWithImages();
	
// 게시판 카운트 쿼리 /board/boardList 작업자 : 이준호
	Integer selectBoardCount(Map<String, Object> lastMap);
	
// 게시글 카테고리 셀렉트 /board/boardList 작업자 : 이준호
	List<Map<String, Object>> selectHeaderListByBoard(String boardCategory);
	
// 게시글 검색 /board/boardList 작업자 : 이준호
	List<Map<String, Object>> searchBoardContent(String searchBoard);
	
// 작성글 셀렉트 /board/boardOne 작업자 : 이준호
	Map<String, Object> selectBoardByBoardOne(Integer boardNo);
	
// 공지사항 리스트 : 부서 목록 작업자 : 이준호
	List<Division> selectDivisionList();
	
//	게시글 작성 /board/addBoard 작업자 : 이준호	
	Integer insertBoard (Board board);
	
//	게시판 리스트 /board/getBoardList 작업자 : 이준호	
	List<Map<String, Object>> selectBoardList (Map<String, Object> combinedMap);

//	게시글 삭제 쿼리 /board/removeBoard 작업자 : 이준호 
	Integer deleteBoard (int boardNo);
	int deleteBoardFile (int boardNo);
// 	게시글 조회수 증가 /board/updateBoard 작업자 : 이준호
	int updateBoardView(Board board);
}
