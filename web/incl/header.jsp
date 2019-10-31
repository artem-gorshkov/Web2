<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tr>
    <td>
        <div class="Header bold">
            <h1>Лабораторная работа №2 по <span class="Pip"> Веб-программированию</span></h1>
            <h2>Вариант №211006</h2>
            <h3>Выполнил: Горшков Артем Владимирович</h3>
            <h4>Группа: P3211</h4>
        </div>
    </td>
</tr>
<tr>
    <td>
        <canvas id="canvas" width="512" height="512" style=" margin: 1% 0;
                background: url('${pageContext.request.contextPath}/img/Plot.png') no-repeat; background-size: 100%">
        </canvas>
        <script type="text/javascript">
            const data = [];
                <c:forEach var="point" items="${sessionScope.data}">
            data.push({${point.getX()}, ${point.getY()}, ${point.getR()}});
                </c:forEach>
            const canvas = document.getElementById("canvas");
            const width = canvas.getAttribute("width");
            const height = canvas.getAttribute("height");
            const ctx = canvas.getContext("2d");
            canvas_arrow(ctx, 0, height / 2, width, height / 2);
            canvas_arrow(ctx, width / 2, height, width / 2, 0);

            function canvas_arrow(context, fromx, fromy, tox, toy) {
                var headlen = 10; // length of head in pixels
                var dx = tox - fromx;
                var dy = toy - fromy;
                var angle = Math.atan2(dy, dx);
                context.moveTo(fromx, fromy);
                context.lineTo(tox, toy);
                context.lineTo(tox - headlen * Math.cos(angle - Math.PI / 6), toy - headlen * Math.sin(angle - Math.PI / 6));
                context.moveTo(tox, toy);
                context.lineTo(tox - headlen * Math.cos(angle + Math.PI / 6), toy - headlen * Math.sin(angle + Math.PI / 6));
            }
        </script>
        <!-- to do interactive canvas-->
        <!-- jstl! -->
    </td>
</tr>