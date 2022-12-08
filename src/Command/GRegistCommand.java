package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Dao;

public class GRegistCommand implements GCommand{
	//자손이 구현하므로 interface의 메소드를 override한다.
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) {

			String regist_month = request.getParameter("regist_month");
			String c_no = request.getParameter("c_no");
			String class_area = request.getParameter("class_area");
			String class_name = request.getParameter("class_name");
			String tuition = request.getParameter("tuition");

			Dao dao = new Dao();
			//테이블에 있는 모든 데이터를 끌고 온다는 뜻
			dao.regist(regist_month, c_no, 
					   class_area, class_name, tuition);

		}
	}
