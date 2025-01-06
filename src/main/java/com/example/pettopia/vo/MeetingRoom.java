package com.example.pettopia.vo;

import lombok.Data;

@Data
public class MeetingRoom {
	private Integer roomNo;
	private String roomName;
	private String roomInfo;
	private Integer roomCapacity;
	private String roomLocation;
	private String createDatetime;
	private String updateDatetime;
}
