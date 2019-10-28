<%@ page import="app.models.Point" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>Lab2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <%@ include file="incl/header.jsp" %>
    <tr>
        <td>
            <img src="${pageContext.request.contextPath}/img/plot.png" alt="график">
        </td>
    </tr>
    <tr>
        <td>
            <table class="answer">
                <% try {
                    ArrayList<Point> data = (ArrayList<Point>) request.getSession().getAttribute("data");
                    if (!data.isEmpty()) { %>
                <tr>
                    <td>X</td>
                    <td class="word-break">Y</td>
                    <td>R</td>
                    <td>Результат</td>
                </tr>
                <% for (Point point : data) {%>
                <tr>
                    <td><%=point.getX()%>
                    </td>
                    <td><%=point.getY()%>
                    </td>
                    <td><%=point.getR()%>
                    </td>
                    <td><%=point.getResult()%>
                    </td>
                </tr>
                <% }
                }
                } catch (Throwable e) {e.printStackTrace();} %>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <form method="GET" action="${pageContext.request.contextPath}/app">
                <button type="submit">Вернуться на стартовую страницу</button>
            </form>
        </td>
    </tr>
</table>
</body>
</html>
