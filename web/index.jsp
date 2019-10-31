<%@ page import="java.util.UUID" %>
<%@ page import="app.models.Point" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ru">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>Lab2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <%@ include file="incl/header.jsp"%>
    <tr>
        <td>
            <form method="GET" action="${pageContext.request.contextPath}/app" onsubmit="return valid()">
                <input type="hidden" name="unique" value="<%= UUID.randomUUID().toString()%>">
                <table class="form">
                    <tr>
                        <td>
                            <p>Значение X:
                                <input type="radio" name="X" value="-2" id="X0">
                                <label for="X0">-2</label>
                                <input type="radio" name="X" value="-1.5" id="X1">
                                <label for="X1">-1.5</label>
                                <input type="radio" name="X" value="-1" id="X2">
                                <label for="X2">-1</label>
                                <input type="radio" name="X" value="-0.5" id="X3">
                                <label for="X3">-0.5</label>
                                <input type="radio" name="X" value="0" id="X4">
                                <label for="X4">0</label>
                                <input type="radio" name="X" value="0.5" id="X5">
                                <label for="X5">0.5</label>
                                <input type="radio" name="X" value="1" id="X6">
                                <label for="X6">1</label>
                                <input type="radio" name="X" value="1.5" id="X7">
                                <label for="X7">1.5</label>
                                <input type="radio" name="X" value="2" id="X8">
                                <label for="X8">2</label>
                            </p>
                        </td>
                    </tr>
                    <tr class="Blue">
                        <td>
                            <p>
                                <label for="textfieldY">Значение Y ∈ (-5;3):</label>
                                <input type="text" id="textfieldY" autocomplete="off" name="Y">
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                Значение R:
                                <input type="radio" name="R" value="1" id="R0">
                                <label for="R0">1</label>
                                <input type="radio" name="R" value="2" id="R1">
                                <label for="R1">2</label>
                                <input type="radio" name="R" value="3" id="R2">
                                <label for="R2">3</label>
                                <input type="radio" name="R" value="4" id="R3">
                                <label for="R3">4</label>
                                <input type="radio" name="R" value="5" id="R4">
                                <label for="R4">5</label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                <input type="submit" value="Отправить">
                            </p>
                            <div id="error"></div>
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td>
            <table class="answer">
                <% try {
                    if (!data.isEmpty()) { %>
                <tr>
                    <th>X</th>
                    <th class="word-break">Y</th>
                    <th>R</th>
                    <th>Результат</th>
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
        <td id="stand_deviation"></td>
    </tr>
</table>
<script src="${pageContext.request.contextPath}/javascript/validation.js"></script>
</body>
</html>