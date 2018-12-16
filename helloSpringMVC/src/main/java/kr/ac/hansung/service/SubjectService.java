package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.SubjectDAO;
import kr.ac.hansung.model.Subject;

@Service
public class SubjectService {

	@Autowired
	private SubjectDAO subjectDAO;

	public List<Subject> getCurrent() {
		return subjectDAO.getSubject();
	}
	
}
