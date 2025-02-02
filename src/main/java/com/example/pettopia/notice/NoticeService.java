package com.example.pettopia.notice;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.noticefile.NoticeFileMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Notice;
import com.example.pettopia.vo.NoticeFile;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeService {
	
	@Autowired NoticeMapper noticeMapper;
	@Autowired NoticeFileMapper noticeFileMapper;
	
	// 오자윤 : /notice/getNoticeList 공지사항 카운팅(페이징)	
	public int getNoticeCount(Map<String, Object> params) {
		return noticeMapper.getNoticeCount(params);
	}
	
	// 오자윤 : /notice/modifyNoticeOne 공지사항 수정
	public void updateNotice(Notice notice, NoticeFile noticeFile, String path, List<Integer> noticeFileNoListToDelete) {
		
		// 공지사항 수정
		noticeMapper.updateNoticeContent(notice);
		
		// 파일이 새로 추가되는 경우
	    if (noticeFile.getNoticeFile() != null) {
	        List<MultipartFile> noticeFileList = noticeFile.getNoticeFile();
	        for (MultipartFile mf : noticeFileList) {
	            int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
	            String orginName = mf.getOriginalFilename().substring(0, dotIdx);
	            String fileName = UUID.randomUUID().toString().replace("-", "").substring(0, 16);
	            String ext = mf.getOriginalFilename().substring(dotIdx + 1);
	            
	            noticeFile.setNoticeNo(notice.getNoticeNo());
	            noticeFile.setOriginFileName(orginName);
	            noticeFile.setFileName(fileName);
	            noticeFile.setFileExt(ext);
	            noticeFile.setFileType(mf.getContentType());
	            
	            int addNoticeFileRow = noticeFileMapper.insertNoticeFile(noticeFile);
	            if (addNoticeFileRow == 1) {
	                // 물리적 파일 저장
	                try {
	                    mf.transferTo(new File(path + fileName + "." + ext));
	                } catch (Exception e) {
	                    e.printStackTrace();
	                    throw new RuntimeException();
	                }
	            }
	        }
	    }

	    // 기존 파일 삭제
	    if (noticeFileNoListToDelete != null && !noticeFileNoListToDelete.isEmpty()) {
	        // 삭제할 파일 정보 가져오기
	        List<NoticeFile> existingFiles = noticeFileMapper.selectNoticeFiles(noticeFileNoListToDelete);
	        for (NoticeFile existingFile : existingFiles) {
	            if (existingFile != null) {
	                String fullname = path + existingFile.getFileName() + "." + existingFile.getFileExt();
	                File file = new File(fullname);
	                if (file.exists()) {
	                    boolean deleted = file.delete();
	                    if (!deleted) {
	                        log.warn("파일 삭제 실패: " + fullname);
	                    }
	                }
	            } else {
	                log.warn("파일 정보가 존재하지 않습니다.");
	            }
	        }

	        // 데이터베이스에서 파일 삭제
	        for (Integer fileNo : noticeFileNoListToDelete) {
	            noticeFileMapper.deleteNoticeFile(fileNo);
	        }
	    }
	}

	
	
	// 오자윤 : /notice/noticeOne 공지사항 삭제
	public void removeNotice(Integer noticeNo, String path) {
		
		List<Integer> noticeFileNoList = noticeFileMapper.selectNoticeFileNoList(noticeNo);
		
		// 파일 번호가 존재할 경우
	    if (noticeFileNoList != null && !noticeFileNoList.isEmpty()) {
	    	 // 기존 파일 정보를 한 번에 가져오기
	        List<NoticeFile> noticeFiles = noticeFileMapper.selectNoticeFiles(noticeFileNoList);
	        
	        for (NoticeFile noticeFile : noticeFiles) {
	        	if (noticeFile != null) {
	                int deleteNoticeFile = noticeFileMapper.deleteNoticeFile(noticeFile.getNoticeFileNo()); // 각 파일 삭제
	                
			        if(deleteNoticeFile == 1) {
		    			String fullname = path + noticeFile.getFileName() + "." + noticeFile.getFileExt();
		    			File file = new File(fullname);
		    			file.delete();
			        }
			    }
			}
	    }
		noticeMapper.deleteNotice(noticeNo);
	}
	
	// 오자윤 : /notice/addNotice 공지사항 추가
	public Integer addNotice(Notice notice, NoticeFile noticeFile, String path) {
		int addNotice = noticeMapper.insertNotice(notice);
		
		Integer noticeNo = notice.getNoticeNo(); // selectKey 값
		
		if(addNotice == 1 && noticeFile.getNoticeFile() != null) {
			// GoodsFile 입력
			List<MultipartFile> noticeFileList = noticeFile.getNoticeFile();
			for (MultipartFile mf : noticeFileList) {
				int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
				String orginName = mf.getOriginalFilename().substring(0, dotIdx);
				String fileName = UUID.randomUUID().toString().replace("-", "").substring(0, 16);
				String ext = mf.getOriginalFilename().substring(dotIdx + 1);
				
				noticeFile.setNoticeNo(noticeNo);
				noticeFile.setOriginFileName(orginName);
				noticeFile.setFileName(fileName);
				noticeFile.setFileExt(ext);
				noticeFile.setFileType(mf.getContentType());
				
				int addNoticeFileRow = noticeFileMapper.insertNoticeFile(noticeFile);
				if(addNoticeFileRow == 1) {
					// 물리적 파일 저장
					try {
						mf.transferTo(new File(path + fileName + "." + ext));
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException();
					}
				}
			}
		}
		return 1;
	}
	
	
	// 공지사항 리스트 : 부서 목록
	public List<Division> getDivisionList(){
		
		log.debug(TeamColor.KMJ+"[NoticeService - getDivisionList]");
		
		List<Division> divisionList = noticeMapper.selectDivisionList();
		log.debug(TeamColor.KMJ+ "divisionList : " + divisionList.toString() + TeamColor.RESET);
		
		return divisionList;
				
	}
	
	
	// 공지사항 리스트 : 게시글 목록
	public List<Map<String, Object>> getNoticeList(Map<String, Object> paramMap){ // 카테고리, 검색어 추가하기
		
		log.debug(TeamColor.KMJ+"[NoticeService - getNoticeList]");
		log.debug(TeamColor.KMJ+ "paramMap : " + paramMap.toString() + TeamColor.RESET);		
		
		List<Map<String, Object>> noticeList = noticeMapper.selectNoticeList(paramMap);
		
		log.debug(TeamColor.KMJ+ "noticeList : " + noticeList.toString() + TeamColor.RESET);
		
		return noticeList;
		
	}
	
	
	// 공지사항 상세보기 : 조회수 증가
	public int addNoticeView(Notice notice) {
		
		log.debug(TeamColor.KMJ+"[NoticeService - addNoticeView]");
		log.debug(TeamColor.KMJ+ "NoticeNo : " + notice.getNoticeNo() + TeamColor.RESET);	
		
		return noticeMapper.updateNotice(notice);
		
	}
	
	// 공지사항 상세보기 : 해당 공지사항 조회
	public Map<String, Object> getNoticeOne(int noticeNo) {
		
		log.debug(TeamColor.KMJ+"[NoticeService - addNoticeView]");
		log.debug(TeamColor.KMJ+ "noticeNo : " + noticeNo + TeamColor.RESET);
		
		Map<String, Object> noticeOne = noticeMapper.selectNoticeOne(noticeNo);
		
		return noticeOne; 
		
		
	}
	
	
	

}
