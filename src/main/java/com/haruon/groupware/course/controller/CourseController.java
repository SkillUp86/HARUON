package com.haruon.groupware.course.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.course.dto.CourseDto;
import com.haruon.groupware.course.service.CourseService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CourseController {
	@Autowired CourseService courseService;

	
	// 교육 추가
	@GetMapping("/franchises/courses/insert")
	public String insertCourse(Model model) {
		return "course/insert";
	}
	
	@PostMapping("/franchises/courses/insert")
	public String insertCourse(HttpSession session, CourseDto courseDto) {
		log.debug("EduNo =====> " + courseDto.getEduNo());
		
		// 파일업로드
		courseDto.getEducationFile();
		
		// 파일 저장위치
		String path = session.getServletContext().getRealPath("/uploadCourse/");
		log.debug("path =====> " + path);
		
		courseService.insertCourse(courseDto, path);
		
		
		return "redirect:/franchises/courses";
	}
	
	// 교육 조회
	@GetMapping("/franchises/courses")
	public String courses(Model model) {
		List<CourseDto> courseList = courseService.getCourseList();
		model.addAttribute("courseList", courseList);
		return "course/courses";
	}
 
}
