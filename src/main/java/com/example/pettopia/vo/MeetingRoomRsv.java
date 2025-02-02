package com.example.pettopia.vo;

import lombok.Data;

@Data
public class MeetingRoomRsv {
	private Integer rsvNo; // PK
	private Integer roomNo; // FK
	private String empNo; // FK
	private String rsvDate;
	private String conferenceTitle;
	private String conferenceDesc;
	private Integer conferenceUsers;
	private String timePeriod;
	private String createDatetime;
	private String updateDatetime;
}
