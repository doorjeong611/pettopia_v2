package com.example.pettopia.board;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.pettopia.boardcomment.CommentMapper;
import com.example.pettopia.util.Page;
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
// 게시글 셀렉트 쿼리 /board/boardList 작업자 : 이준호
	public List<Map<String, Object>> getSelectHeaderListByBoard(String boardCategory,String searchBoard){
		return boardMapper.selectHeaderListByBoard(boardCategory);
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
	
	public Map<String, Object> getListByBoardOne(Integer boardNo){
		boardMapper.selectBoardByBoardOne(boardNo);
		
		return boardMapper.selectBoardByBoardOne(boardNo);
	}
	
// 라스트 페이지 구하기

public Integer getLastPage(Integer rowPerPage, String boardCategory,String searchBoard) {
	 Map<String, Object> lastMap = new HashMap<>();
	 lastMap.put("boardCategory", boardCategory);
	 lastMap.put("searchBoard", searchBoard);
	    
    int count = boardMapper.selectBoardCount(lastMap); 

    // 마지막 페이지 계산
    int lastPage = count / rowPerPage;
    if (count % rowPerPage != 0) {
        lastPage++;
    }
    
    return lastPage;
}
public Map<String, Object> getBoardList(Integer currentPage, Integer rowPerPage, String boardCategory, Map<String, Object> boardMap, String searchBoard) {
    // 시작 행 계산
    Integer beginRow = (currentPage - 1) * rowPerPage;
    
    // 한 페이지 페이징 10개
    Integer numPerPage = 10; // 페이지 당 최대 페이지 번호 갯수
    
    // 전체 페이지 개수 계산
    Integer lastPage = this.getLastPage(rowPerPage,boardCategory,searchBoard);
    
    // 페이징 첫 번째 페이지 넘버
    Integer startPagingNum = ((currentPage - 1) / numPerPage) * numPerPage + 1;
    
    // 페이징 마지막 페이지 넘버
    Integer endPagingNum = Math.min(startPagingNum + numPerPage - 1, lastPage);
   
    
    // 결과 맵 생성
    Map<String, Object> resultMap = new HashMap<>();
    resultMap.put("startPagingNum", startPagingNum);
    resultMap.put("endPagingNum", endPagingNum);
    resultMap.put("lastPage", lastPage);
    
    
    // 게시글 목록 데이터 가져오기
    Map<String, Object> paramMap = new HashMap<>();
    paramMap.put("resultMap", resultMap);
    paramMap.put("beginRow", beginRow);
    paramMap.put("rowPerPage", rowPerPage);
    paramMap.put("boardCategory", boardCategory);
    paramMap.put("boardMap", boardMap);
    paramMap.put("searchBoard", searchBoard);
    
    // 게시판 목록을 가져오는 DB 조회
    List<Map<String, Object>> boardList = boardMapper.selectBoardList(paramMap);
    
    // 게시판 목록과 페이징 정보를 포함한 결과 반환
    resultMap.put("boardList", boardList);
    return resultMap;
}


	
// 게시글 조회수 증가
	
	public int addBoardView(Board board) {
		
		return boardMapper.updateBoard(board);
	}
	
}
