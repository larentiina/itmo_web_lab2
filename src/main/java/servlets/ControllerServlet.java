package servlets;

import models.PointsCollection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        }else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameter");
        }
    }
}
