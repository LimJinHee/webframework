package kr.ac.hansung.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.model.Subject;

@Repository
public class SubjectDAO {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public int getRowCount() {
		String sqlStatement = "select count(*) from subject";
		return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
	}

	// querying and return single object
	public Subject getSubject(String year,String semester) {
		String sqlStatement = "select * from subject where year=? and semeter=? ";

		return jdbcTemplate.queryForObject(sqlStatement, new Object[] {year,semester}, new RowMapper<Subject>() {

			@Override
			public Subject mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				// year, semester, code, title, division, credit
				Subject subject = new Subject();
				
				subject.setYear(rs.getInt("year"));
				subject.setSemester(rs.getInt("semester"));
				subject.setCode(rs.getString("code"));
				subject.setTitle(rs.getString("title"));
				subject.setDivision(rs.getString("division"));
				subject.setCredit(rs.getInt("credit"));
				
				return subject;
			}
			
		});
	}
	

	// querying and return multiple object
	public List<Subject> getSubject() {
		String sqlStatement = "select * from subject";

		return jdbcTemplate.query(sqlStatement, new RowMapper<Subject>() {
			@Override
			public Subject mapRow(ResultSet rs, int rowNum) throws SQLException {
				Subject subject = new Subject();

				subject.setYear(rs.getInt("year"));
				subject.setSemester(rs.getInt("semester"));
				subject.setCode(rs.getString("code"));
				subject.setTitle(rs.getString("title"));
				subject.setDivision(rs.getString("division"));
				subject.setCredit(rs.getInt("credit"));

				return subject;
			}
		});
	}
	
		public boolean insert(Subject subject) {
		
		int year = subject.getYear();
		int semester = subject.getSemester();
		String code = subject.getCode();
		String title = subject.getTitle();
		String division = subject.getDivision();
		int credit = subject.getCredit();
		
		String sqlStatement = "insert into subject (year, semester, code, title, division, credit) values(?, ?, ?, ?, ?, ?)";
		
		return (jdbcTemplate.update(sqlStatement, new Object[] {year, semester, code, title, division, credit}) == 1);
	}
	
}
