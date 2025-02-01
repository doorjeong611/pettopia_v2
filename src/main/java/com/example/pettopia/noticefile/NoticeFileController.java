package com.example.pettopia.noticefile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NoticeFileController {
	@Autowired NoticeFileService noticeFileService;
	
	// documentOne → removeDocumentFile 파일 삭제
	@GetMapping("/notice/removeNoticeFile")
	public String removeDocumentFile(HttpSession session, @RequestParam Integer noticeFileNo, @RequestParam Integer noticeNo, @RequestParam String noticeType) {
		String path = session.getServletContext().getRealPath("/noticeFile/");
		noticeFileService.removeNoticeFile(noticeFileNo, path);
		return "redirect:/document/documentOne?docNo=" + noticeNo + "&noticeType=" + noticeType;
	}

	
	
	
}
