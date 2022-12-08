package Dto;

public class StudentDto {
	private String regist_month;
	private int c_no;
	private String c_name;
	private String teacher_code;
	private String class_area;
	private String tuition;
	private String grade;
	
	public StudentDto() {}

	public StudentDto(String regist_month, int c_no, String c_name, String teacher_code, 
					  String class_area, String tuition, String grade) {
		
		this.regist_month = regist_month;
		this.c_no = c_no;
		this.c_name = c_name;
		this.teacher_code = teacher_code;
		this.class_area = class_area;
		this.tuition = tuition;
		this.grade = grade;
	}

	public String getRegist_month() {
		return regist_month;
	}

	public void setRegist_month(String regist_month) {
		this.regist_month = regist_month;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getTeacher_code() {
		return teacher_code;
	}

	public void setTeacher_code(String teacher_code) {
		this.teacher_code = teacher_code;
	}

	public String getClass_area() {
		return class_area;
	}

	public void setClass_area(String class_area) {
		this.class_area = class_area;
	}

	public String getTuition() {
		return tuition;
	}

	public void setTuition(String tuition) {
		this.tuition = tuition;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
}
