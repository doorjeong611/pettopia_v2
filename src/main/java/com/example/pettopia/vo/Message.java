package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Message {
	private Integer messageNo;
	private Integer senderEmpNo;
	private Integer recipientEmpNo;
	private String messageTitle;
	private String messageContent;
	private String messageState;
	private String messageBin;
	private String createDate;
	private String stateUpdateDate;
}
