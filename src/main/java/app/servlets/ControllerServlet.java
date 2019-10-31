package app.servlets;


import app.models.Point;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("data") == null) {
            req.getSession().setAttribute("data", new ArrayList<Point>());
        }
        req.setAttribute("data", req.getSession().getAttribute("data"));
        String x = req.getParameter("X");
        String y = req.getParameter("Y");
        String r = req.getParameter("R");
        RequestDispatcher dispatcher = req.getRequestDispatcher("header.jsp");
        dispatcher.forward(req, resp);
//        if (x == null && y == null && r == null) {
//            RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
//            dispatcher.forward(req, resp);
//        }
//        else {
//            RequestDispatcher dispatcher = req.getRequestDispatcher("areaCheck");
//            dispatcher.forward(req, resp);
//        }
    }
}
