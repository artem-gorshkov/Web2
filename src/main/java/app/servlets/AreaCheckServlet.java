package app.servlets;

import app.models.Point;
import utils.NV;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

public class AreaCheckServlet extends HttpServlet {
    private static final String wrongFormat = "Данные представлены не в числовом формате";
    private static final String inZone = "В зоне";


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        final String x = req.getParameter("X");
        final String y = req.getParameter("Y");
        final String r = req.getParameter("R");
        final String unique = req.getParameter("unique"); //for check reload
        final String isFromCanvas = req.getParameter("isFromCanvas");
        Point point;

        if (true) {
            point = new Point(x, y, r, inZone, unique);
        } else {
            point = new Point(x, y, r, wrongFormat, unique);
        }

        ArrayDeque<Point> data = (ArrayDeque<Point>) req.getSession().getAttribute("data");
        try {
            Point last = data.getFirst();
            if (!last.equals(point)) //add if not reload page
                data.addFirst(point);
        } catch (NoSuchElementException e) {
            data.addFirst(point);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("resultPage.jsp");
        dispatcher.forward(req, resp);
    }
}
