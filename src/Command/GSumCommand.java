package Command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Dao;
import Dto.SumDto;

public class GSumCommand implements GCommand{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		Dao dao = new Dao();
		List<SumDto> dtos = dao.list3();

		request.setAttribute("sum", dtos);
	}
}
