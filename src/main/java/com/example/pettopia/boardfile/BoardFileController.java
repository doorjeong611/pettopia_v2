package com.example.pettopia.boardfile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Random;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@ResponseBody
public class BoardFileController {
	
	 @RequestMapping("/boardFile")
	 public void fileUpload(MultipartHttpServletRequest multiRequest, HttpServletRequest request, HttpServletResponse response) {
	     try {
	         // 서버의 실제 경로를 가져옴
	         final String realSavePath = request.getServletContext().getRealPath("/boardFile");

	         // 폴더가 없을 경우 생성
	         File saveFolder = new File(realSavePath);
	         if (!saveFolder.exists()) {
	             saveFolder.mkdirs();
	         }

	         // 파일 업로드 처리
	         final Map<String, MultipartFile> files = multiRequest.getFileMap();
	         MultipartFile fileload = files.get("upload");

	         // 파일 이름 취득
	         String fileName = fileload.getOriginalFilename();

	         // 파일 확장자 추출
	         int index = fileName.lastIndexOf(".");
	         String ext = fileName.substring(index + 1);

	         // 랜덤한 이름 생성 (timestamp + 랜덤값)
	         Random ran = new Random(System.currentTimeMillis());
	         fileName = System.currentTimeMillis() + "_" + (int) (ran.nextDouble() * 10000) + "." + ext;

	         // 폴더 경로 설정
	         String newfilename = realSavePath + File.separator + fileName;

	         // 파일 저장
	         fileload.transferTo(new File(newfilename));

	         // JSON 응답 생성
	         JSONObject outData = new JSONObject();
	         outData.put("uploaded", true);
	         outData.put("url", request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/common/fms/getImageForContents.do?fileNm=" + fileName);

	         // JSON 응답 전송
	         response.setContentType("application/json");
	         response.setCharacterEncoding("UTF-8");
	         response.getWriter().print(outData.toString());

	     } catch (IOException e) {
	         e.printStackTrace();
	         System.out.println("파일 업로드 중 오류 발생");
	     }
	 }
	
}
