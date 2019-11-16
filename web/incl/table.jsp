<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tr>
    <td>
        <table class="answer">
            <c:if test="${sessionScope.DataBean.data.size() != 0}">
                <tr>
                    <td>X</td>
                    <td class="word-break">Y</td>
                    <td>R</td>
                    <td>Результат</td>
                </tr>
            </c:if>
            <c:forEach var="point" items="${DataBean.data}">
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
