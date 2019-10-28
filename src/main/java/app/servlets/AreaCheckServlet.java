package app.servlets;

import app.models.Point;
import utils.NV;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

public class AreaCheckServlet extends HttpServlet {
    public static final String wrongFormat = "Данные представлены не в числовом формате";
    public static final String inZone = "В зоне";


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String x = req.getParameter("X");
        String y = req.getParameter("Y");
        String r = req.getParameter("R");
        String unique = req.getParameter("unique"); //for check reload
        Point point;
        if (NV.isValidNumbers(x, y, r)) {
            point = new Point(x, y, r, inZone, unique);
        } else {
            point = new Point(x, y, r, wrongFormat, unique);
        }
        if (req.getSession().getAttribute("data") == null) {
            req.getSession().setAttribute("data", new ArrayList<Point>());
        }
        ArrayList<Point> data = (ArrayList<Point>) req.getSession().getAttribute("data");
        try {
            Point last = data.get(data.size() - 1);
            if (!last.equals(point)) //add if not reload page
                data.add(point);
        } catch (IndexOutOfBoundsException e) {
            data.add(point);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("resultPage.jsp");
        dispatcher.forward(req, resp);
    }
}
