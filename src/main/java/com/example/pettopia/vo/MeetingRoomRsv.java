package com.example.pettopia.vo;

import lombok.Data;

@Data
public class MeetingRoomRsv {
	private Integer rsvNo;
	private Integer roomNo;
	private Integer empNo;
	private String rsvDate;
	private String conferenceTitle;
	private String conferenceDesc;
	private Integer conferenceUsers;
	private String startTime;
	private String endTime;
	private String createDatetime;
	private String updateDatetime;
}
