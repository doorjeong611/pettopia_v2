package com.example.pettopia.board;


import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.boardcomment.CommentMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Board;
import com.example.pettopia.vo.BoardComment;
import com.example.pettopia.vo.BoardFile;
import com.example.pettopia.vo.Division;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Service
@Slf4j
public class BoardService {
	@Autowired BoardMapper boardMapper;
	@Autowired CommentMapper commentMapper;
	
	
	   // 댓글 작성
    public int addComment(BoardComment boardComment) {
        return boardMapper.insertComment(boardComment);
    }
        

    // 대댓글 작성
    public int addCommentDepth(BoardComment boardComment) {
	    
        return boardMapper.insertCommentDepth(boardComment);
    }


	// 댓글 셀렉트
	List<Map<String,Object>> getSelectBoardComment(Integer boardNo){
		return boardMapper.selectBoardComment(boardNo);
	};
	public void modifyBoardFile(Board board, MultipartFile boardImg, String boardImagePath) throws Exception {
	    // 게시글 업데이트
	    int updateBoard = boardMapper.updateBoard(board);
	    if (updateBoard == 0) {
	        throw new RuntimeException("게시글 수정 실패");
	    }
	    log.debug("게시글 수정 완료 : ", board);

	    // 이미지 파일이 첨부된 경우 처리
	    if (boardImg != null && !boardImg.isEmpty()) {
	        // 새로운 이미지 파일을 등록하는 로직
	        BoardFile boardImage = new BoardFile();
	        boardImage.setBoardNo(board.getBoardNo());
	        boardImage.setOriginFileName(boardImg.getOriginalFilename());

	        // 파일 이름을 UUID로 생성하여 중복을 방지
	        String fileName = UUID.randomUUID() + "." + getFileExtension(boardImg.getOriginalFilename());
	        boardImage.setFileName(fileName);
	        boardImage.setFileExt(getFileExtension(boardImg.getOriginalFilename()));
	        boardImage.setFileType(boardImg.getContentType());

	        // 게시글에 이미지가 이미 있으면 기존 이미지를 삭제 후 새 이미지 추가 (업데이트)
	        int updateBoardImg = boardMapper.updateBoardFile(boardImage);
	        if (updateBoardImg == 0) {
	            // 기존에 이미지가 없으면 새 이미지를 추가하는 로직으로 처리
	            int insertBoardImg = boardMapper.insertBoardFile(boardImage);
	            if (insertBoardImg == 0) {
	                throw new RuntimeException("이미지 추가 실패");
	            }
	            log.debug("새 이미지 추가 완료 : ", boardImage);
	        } else {
	            log.debug("기존 이미지 수정 완료 : ", boardImage);
	        }

	        // 서버에 이미지 파일을 저장
	        File saveBoardFile = new File(boardImagePath, fileName);
	        boardImg.transferTo(saveBoardFile);
	    } else {
	        // 이미지가 첨부되지 않은 경우 기존 이미지를 유지하려면 특별한 로직을 추가할 수 있습니다.
	        log.debug("이미지 파일이 첨부되지 않았습니다. 기존 이미지를 유지합니다.");
	    }
	}

	
	// 게시판 이미지 추가
	public int addBoardFile (BoardFile boardFile) {
		return boardMapper.insertBoardFile(boardFile);
	}
	// 게시판 정보 추가
	public int addBoardOne(Board board, MultipartFile boardImg, String boardImagePath) throws Exception {

	    // 게시글 등록
	    int boardRow = boardMapper.insertBoard(board);

	    // 게시글 등록 성공 후, 파일이 존재하는 경우에만 파일 관련 작업 수행
	    if (boardRow == 1 && boardImg != null && !boardImg.isEmpty()) {  // 빈 파일도 체크 추가

	        // BoardFile 객체 생성
	        BoardFile boardImage = new BoardFile();
	        boardImage.setBoardNo(board.getBoardNo());  // boardNo 받아옴
	        boardImage.setOriginFileName(boardImg.getOriginalFilename());  // 원본 파일명 설정

	        // 고유 파일명 생성 (UUID 사용)
	        String boardFileName = UUID.randomUUID().toString() + "." + getFileExtension(boardImg.getOriginalFilename());
	        boardImage.setFileName(boardFileName);  // 고유 파일명 설정
	        boardImage.setFileExt(getFileExtension(boardImg.getOriginalFilename()));  // 파일 확장자 설정
	        boardImage.setFileType(boardImg.getContentType());  // 파일 타입 설정

	        // 파일 등록을 위한 메소드 호출
	        int imgBoardFileResult = addBoardFile(boardImage);
	        if (imgBoardFileResult == 0) {
	            throw new RuntimeException("이미지 등록 실패");
	        }

	        // 파일 저장 경로 설정
	        File saveBoardFile = new File(boardImagePath, boardFileName);

	        // 실제 파일 저장
	        boardImg.transferTo(saveBoardFile);  // 파일을 서버 지정 위치에 저장

	        log.debug(TeamColor.LJH + "FileName ========> " + boardImage.getFileName() + TeamColor.RESET);
	        log.debug(TeamColor.LJH + "Path ========> " + saveBoardFile.getAbsolutePath() + TeamColor.RESET);
	    }

	    // 등록된 게시글 번호 반환
	    return board.getBoardNo();
	}

	
// 게시판 이미지 정보 추가
	
	
	// 파일 확장자 추출 메서드
    private String getFileExtension(String boardfileName) {
        int dotIndex = boardfileName.lastIndexOf('.');
        if (dotIndex == -1) {
            return ""; // 확장자가 없는 경우
        }
        return boardfileName.substring(dotIndex + 1);
    }
    
	
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
	
	
// 게시판 파일 셀렉트
	public List<BoardFile> boardFileService(int boardNo) {
        return boardMapper.selectBoardFile(boardNo);
    }
	

//  게시글 댓글 삭제 /board/removeComment 작업자 : 이준호
	public void deleteComment(int commentNo) {
		commentMapper.deleteComment(commentNo);
	}
// 게시글 파일 삭제	
	public void deleteFile(int boardNo) {
		boardMapper.deleteBoardFile(boardNo);	
	}
	
//	게시글 댓글 통합 삭제 /board/removeBoard 작업자 : 이준호 
	public void deleteBoardWithComment(int boardNo) {
		boardMapper.deleteBoardFile(boardNo);
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
		
		return boardMapper.updateBoardView(board);
	}
	
}
