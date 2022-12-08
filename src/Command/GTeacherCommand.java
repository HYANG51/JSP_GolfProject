package Command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Dao;
import Dto.Dto;

public class GTeacherCommand implements GCommand{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		Dao dao = new Dao();
		List<Dto> dtos = dao.list();
		
		request.setAttribute("teacher", dtos);
	}
}
