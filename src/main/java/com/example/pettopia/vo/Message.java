package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Message {
	private Integer messageNo; // PK
	private String senderEmpNo; // FK
	private String recipientEmpNo; // FK
	private String messageTitle;
	private String messageContent;
	private String messageState;
	private String messageBin;
	private String createDatetime;
	private String updateDatetime;
}
