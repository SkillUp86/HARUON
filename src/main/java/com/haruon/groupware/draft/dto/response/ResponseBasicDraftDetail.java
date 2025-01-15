package com.haruon.groupware.draft.dto.response;

import lombok.Data;

@Data
public class ResponseBasicDraftDetail {
	private Integer draNo;
	private Integer appNo;
	private String draftType;
	private String drafterNo;
	private String drafterName;
	private String location;
	private Integer depNo;
	private String deptName;
	private String midApp; // 양식타입
	private String midAppName;
	private String finApp;
	private String finalAppName;
	private String referEmpNo; // 결재상태
	private String referName;
	private String title;
	private String content;
	private String createDate;
	private String midDate;
	private String finalDate;
	private String approvalState;
}