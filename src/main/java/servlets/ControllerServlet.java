package servlets;

import models.PointsCollection;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "servlets.ControllerServlet", value = "/controller")
public class ControllerServlet extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ServletContext context = getServletContext();
        context.setAttribute("PointsCollection",new PointsCollection());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("action").equals("clear") ) {
            getServletContext().setAttribute("PointsCollection",new PointsCollection());
        }else if (req.getParameter("x") !=null && req.getParameter("y") !=null && req.getParameter("r") !=null) {
            req.getRequestDispatcher("/check").forward(req, resp);
        }
    }
}
