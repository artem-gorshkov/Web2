<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>Lab2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<link rel="icon" href="img/favicon.ico">
<table id="mainTable">
    <%@ include file="incl/header.jsp" %>
    <%@ include file="incl/table.jsp" %>
    <tr>
        <td>
            <form method="GET" action="${pageContext.request.contextPath}/app">
                <button type="submit">Вернуться на стартовую страницу</button>
            </form>
        </td>
    </tr>
</table>
<script type="text/javascript">
    addDots(${pageContext.request.getParameter("R")}, data);
</script>
</body>
</html>
