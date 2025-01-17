package com.haruon.groupware.message.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.message.dto.MsgReaderDto;
import com.haruon.groupware.message.service.MsgService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MsgController {
	@Autowired MsgService msgService;
	
	// 받은 쪽지함
	@GetMapping("/mail")
	public String getMails(Authentication authentication, Model model) {
		// 로그인정보
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		Integer empNo = userDetails.getEmpNo();
		
		List<MsgReaderDto> msgReaderList = msgService.getMsgReaders(empNo);
		model.addAttribute("rl", msgReaderList);
		return "mail/mail2";
	}
}
