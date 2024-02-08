package servlets;

import db.DBManager;
import db.Tasks;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(value = "/home")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        ArrayList<Tasks> tasks = DBManager.getAllTasks();
        request.setAttribute("tusks", tasks);//причисляю ключ
        request.getRequestDispatcher("/tasks.jsp").forward(request, response);//перенаправляю на сайт
    }
}
