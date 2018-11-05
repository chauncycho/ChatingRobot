package jumper;

import util.MyTimeChange;
import util.WriteLog;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

public class ChatJumper extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        写日志
        String path = req.getServletContext().getRealPath("/");
        String userid = req.getSession().getId();
        String time = MyTimeChange.changeTime(new Date());
        WriteLog.WriteLoginLog(path,userid,time);

        req.getRequestDispatcher("/WEB-INF/views/chat.jsp").forward(req,resp);
    }
}
