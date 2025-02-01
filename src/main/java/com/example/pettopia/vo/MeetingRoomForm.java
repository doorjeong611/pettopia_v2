package com.example.pettopia.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MeetingRoomForm {
	
	private String roomName;
	private Integer roomCapacity;
	private String roomInfo;
	private String roomLocation;
    private MultipartFile roomImg; 
	
	
	

}
