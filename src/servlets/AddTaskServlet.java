package servlets;

import db.DBManager;
import db.Tasks;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/add-task")
public class AddTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("task_name");
        String description = request.getParameter("task_description");
        String deadline = request.getParameter("task_deadline");
        boolean status = Boolean.parseBoolean(request.getParameter("task_status"));

        Tasks newtask = new Tasks();
        newtask.setName(name);
        newtask.setDescription(description);
        newtask.setDeadlineDate(deadline);
        newtask.setStatus(status);

        DBManager.addTask(newtask);
        System.out.print(newtask.getDeadlineDate());
        response.sendRedirect("/");
    }
}