package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Dto.Dto;
import Dto.StudentDto;
import Dto.SumDto;

public class Dao {
	private DataSource dataSource = null;

	public Dao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public List<Dto> list(){
		ArrayList<Dto> dtos = new ArrayList<>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		try {
			String query= "select teacher_code, " +
					"teacher_name, " +
		            "class_name, " +
					"TO_CHAR(CLASS_PRICE, 'L999,999') AS CLASS_PRICE, " +
		            "SUBSTR(teacher_regist_date, 1, 4)||'년'||SUBSTR(teacher_regist_date, 5, 2)||'월'||SUBSTR(teacher_regist_date, 7, 2)||'일' AS teacher_regist_date " +
		            "FROM teacher_board";
		           
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);
			rs = preparedStatement.executeQuery();

			while(rs.next()) {
				String teacher_code = rs.getString("teacher_code");
				String teacher_name = rs.getString("teacher_name");
				String class_name = rs.getString("class_name");
				String class_price = rs.getString("class_price");
				String teacher_regist_date = rs.getString("teacher_regist_date");
				
				Dto dto = new Dto(teacher_code, teacher_name, class_name,
								  class_price, teacher_regist_date);

				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {

				if(rs != null) rs.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}	
		return dtos;
	}
	
	public List<StudentDto> list2(){
		ArrayList<StudentDto> dtos = new ArrayList<>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		try {
			String query= "select SUBSTR(regist_month, 1, 4)||'년'||SUBSTR(regist_month, 5, 2)||'월' as regist_month, c.c_no, " + 
					"m.c_name, " + 
					"case c.teacher_code when '100' then '초급반' when '200' then '중급반' when '300' then '고급반' when '400' then '심화반' end as teacher_code, " + 
					"c.class_area, TO_CHAR(c.tuition, 'L999,999') as tuition, m.grade from tbl_class c, tbl_member m where c.c_no = m.c_no ";
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);
			rs = preparedStatement.executeQuery();

			while(rs.next()) {
				String regist_month = rs.getString("regist_month");
				int c_no = rs.getInt("c_no");
				String c_name = rs.getString("c_name");
				String teacher_code = rs.getString("teacher_code");
				String class_area = rs.getString("class_area");
				String tuition = rs.getString("tuition");
				String grade = rs.getString("grade");
				
				
				StudentDto dto = new StudentDto(regist_month, c_no, c_name,
												teacher_code, class_area, tuition, grade);

				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {

				if(rs != null) rs.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}	
		return dtos;
	}
	
	public void regist(String regist_month, String c_no,
					   String class_area, String class_name, String tuition){
		System.out.println("regist() ..");

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		System.out.println(class_name);
		//이때 ?,?,? 물음표는 아래에서 setString메소드로 넣어줄 값을 표현하는 것	

		try {
			/*
	           파라미터로 받는 값이 bname, btitle, bcontent 3개므로 3개만 ?로 넣고 나머지는 0으로
	           설정했다. 글 작성시 조회수(bhit)는 0이고, 원본 글로 취급하므로 bstep, bindent는
	           지수를 넣어줄 필요가 없기 때문이다.
			 */
			String query = "insert into tbl_class "
					+ "(regist_month, c_no, class_area, tuition, teacher_code)"
					+ "values (?,?,?,?,?)";

			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);

			preparedStatement.setString(1, regist_month);
			preparedStatement.setString(2, c_no);
			preparedStatement.setString(3, class_area);
			preparedStatement.setString(4, tuition);
			preparedStatement.setString(5, class_name);

			int rn = preparedStatement.executeUpdate();
			System.out.println("업데이트 갯수 :"+rn);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {			

				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	public List<SumDto> list3(){
		ArrayList<SumDto> dtos = new ArrayList<>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		try {
			String query= "SELECT T.TEACHER_CODE, CLASS_NAME, TEACHER_NAME, TUITION FROM TEACHER_BOARD T,"
						+ "(SELECT TEACHER_CODE, SUM(TUITION) AS TUITION FROM TBL_CLASS GROUP BY TEACHER_CODE) "
						+ "C WHERE T.TEACHER_CODE = C.TEACHER_CODE";
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);
			rs = preparedStatement.executeQuery();

			while(rs.next()) {
				String teacher_code = rs.getString("teacher_code");
				String class_name = rs.getString("class_name");
				String teacher_name = rs.getString("teacher_name");
				String tuition = rs.getString("tuition");
				
				
				SumDto dto = new SumDto(teacher_code, class_name, teacher_name, tuition);

				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {

				if(rs != null) rs.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}	
		return dtos;
	}
}
