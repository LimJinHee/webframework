package kr.ac.hansung.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.hansung.model.Subject;
import kr.ac.hansung.service.SubjectService;

@Controller
public class Subjectcontroller {
	
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping("/subjects")
	public String showSubjects(Model model) {
		
		List<Subject> subjects = subjectService.getCurrent();
		model.addAttribute("subjects", subjects);
		
		return "subjects";
	}
	
	
	@RequestMapping("/helloSpringMVC/show")
	public String show(Model model, HttpServletRequest request,HttpServletResponse response) {
		
		String year = request.getParameter("year");
		String semester = request.getParameter("semester");
		
		List<Subject> shows = subjectService.getCurrent();
		model.addAttribute("shows", shows);
		model.addAttribute("year", year);
		model.addAttribute("semester", semester);
		
		return "shows";
	}
	
}
