<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<jsp:useBean id="DataBean" scope="session" class="utils.HistoryBean" />--%>
<tr>
    <td>
        <table class="answer">
            <c:if test="${sessionScope.data.size() != 0}">
                <tr>
                    <td>X</td>
                    <td class="word-break">Y</td>
                    <td>R</td>
                    <td>Результат</td>
                </tr>
            </c:if>
            <c:forEach var="point" items="${sessionScope.data}">
                <%--            <c:forEach var="point" items="${DataBean.data}"> // add history--%>
                <tr>
                    <td><c:out value="${point.getX()}"/>
                    </td>
                    <td><c:out value="${point.getY()}"/>
                    </td>
                    <td><c:out value="${point.getR()}"/>
                    </td>
                    <td><c:out value="${point.getResult()}"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </td>
</tr>
