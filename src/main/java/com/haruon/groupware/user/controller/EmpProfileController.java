package com.haruon.groupware.user.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.user.service.EmpProfileService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class EmpProfileController {
	
private final EmpProfileService empProfileService;
	
	public EmpProfileController(EmpProfileService empProfileService) {
		this.empProfileService = empProfileService;
	}
	
	@PostMapping("/upload/profile")
	public String postMethodName(@RequestParam MultipartFile file, HttpSession session, Authentication authentication) {
		log.debug("file = {}",file.getOriginalFilename());
		String path = session.getServletContext().getRealPath("/uploadProfile/");
		CustomUserDetails details = (CustomUserDetails)authentication.getPrincipal();
		int empNo = details.getEmpNo();
		log.debug("empNo = {}",empNo);
		empProfileService.profileUpload(file, empNo, path);
		
		return "redirect:/myInfo";
	}
	
}