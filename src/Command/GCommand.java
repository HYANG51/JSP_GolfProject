package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface GCommand {
	 void execute(HttpServletRequest request, HttpServletResponse response);
}
