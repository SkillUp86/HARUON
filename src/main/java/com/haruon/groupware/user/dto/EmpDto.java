package com.haruon.groupware.user.dto;

import lombok.Data;

@Data
public class EmpDto {
	private Integer empNo;
	private String ename;
	private String empPw;
	private String postCode;
	private String email;
	private String address;
	private Integer depNo;
	private String phone;
	private String gender;
	private String birth;
	private String location;
}
