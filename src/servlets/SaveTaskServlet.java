package servlets;

import db.DBManager;
import db.Tasks;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/save-task")
public class SaveTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        long id = Long.parseLong(request.getParameter("task_id"));

        String name = request.getParameter("task_name");
        String description = request.getParameter("task_description");
        String deadline = request.getParameter("task_deadline");
        boolean status = Boolean.parseBoolean(request.getParameter("task_status"));

        Tasks task = DBManager.getTask(id);
        if(task != null){
            task.setName(name);
            task.setDescription(description);
            task.setDeadlineDate(deadline);
            task.setStatus(status);

            DBManager.updateTask(task);
            response.sendRedirect("/details?task_id=" + id);
        }else {
            response.sendRedirect("/");
        }
    }
}
