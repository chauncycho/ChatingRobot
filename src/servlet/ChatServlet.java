package servlet;

import util.Chat;
import util.MyTimeChange;
import util.WriteLog;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class ChatServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String info = req.getParameter("info");
        String key = req.getParameter("key");
        String robotName = req.getParameter("robot");
        String userid = req.getSession().getId();
        String reply = Chat.sendMessage(key,info,userid);
        String date = MyTimeChange.changeTime(new Date());
        String path = req.getServletContext().getRealPath("/");

//        写日志
        WriteLog.WriteLogForUser(path,userid,"我",info,date);

        PrintWriter out = null;
        out = resp.getWriter();
        if(out != null){
            out.print(reply);
            out.close();

//            写日志
            WriteLog.WriteLogForUser(path,userid,robotName,reply,MyTimeChange.changeTime(new Date()));
        }
    }
}
