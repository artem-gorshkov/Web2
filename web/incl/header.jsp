<script src="${pageContext.request.contextPath}/javascript/jquery-3.4.1.min.js"></script>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="DataBean" scope="session" class="utils.DataBean" />
<tr>
    <td>
        <div class="Header bold">
            <h1>Лабораторная работа №2 по <span class="Pip"> Веб-программированию</span></h1>
            <h2>Вариант №87586</h2>
            <h3>Выполнил: Горшков Артем Владимирович</h3>
            <h4>Группа: P3211</h4>
        </div>
    </td>
</tr>
<tr>
    <td>
        <canvas id="canvas" width="500" height="500" style=" margin: 1% 0;">
        </canvas>
        <script type="text/javascript">
            const blue = "#45688E";
            const red = "red";
            const data = [];
            let x, y;
            <c:forEach var="point" items="${DataBean.data}"> // add history
            x = Number("${point.getX()}");
            y = Number("${point.getY()}");
            if (isFinite(x) && isFinite(y)) {
                data.push({"x": x, "y": y});
            }
            </c:forEach>
            const canvas = document.getElementById("canvas");
            const width = canvas.getAttribute("width");
            const height = canvas.getAttribute("height");
            let rad = height / 40;
            let rad2 = height / 80;
            const ctx = canvas.getContext("2d");
            paintPlot(); // draw Axes with marks

            function addDots(R, data) {
                Array.prototype.forEach.call(data, function (point) {
                    setColor(point, R);
                    let x = width / 2 + point['x'] * Math.round(width / 3) / Number(R);
                    let y = height / 2 - point['y'] * Math.round(height / 3) / Number(R);
                    ctx.beginPath();
                    ctx.arc(x, y, 3, 0, 2 * Math.PI);
                    ctx.fill();
                });
            }

            function setColor(point, r) {
                const x = point['x'];
                const y = point['y'];
                if (x < 0) {
                    if (y >= 0) {
                        if (Math.pow(x, 2) + Math.pow(y, 2) <= Math.pow(r, 2)) {
                            ctx.fillStyle = red;
                        } else {
                            ctx.fillStyle = blue;
                        }
                    } else {
                        if (x < r  && y < r) {
                            ctx.fillStyle = red;
                        } else {
                            ctx.fillStyle = blue;
                        }
                    }
                } else {
                    if (y > 0) {
                        ctx.fillStyle = blue;
                    } else {
                        if (r > 2*x - y) {
                            ctx.fillStyle = red;
                        } else {
                            ctx.fillStyle = blue;
                        }
                    }
                }
            }

            function paintPlot() {
                ctx.fillStyle = "white";
                ctx.fillRect(0, 0, Number(width), Number(height)); //do white canvas

                ctx.fillStyle = blue;
                ctx.fillRect(1 / 6 * width, height / 2, 2 / 6 * width, 2 / 6 * height);

                ctx.beginPath();
                ctx.arc(height / 2, width / 2, 2 / 6 * height, Math.PI, 3/2 *Math.PI);
                ctx.moveTo(width / 2, height / 2);
                ctx.lineTo(width / 2, 1 / 6 * height);
                ctx.lineTo( 1/6 * width, height / 2);
                ctx.lineTo(width / 2, height / 2);
                ctx.fill();

                ctx.beginPath();
                ctx.moveTo(width / 2, height / 2);
                ctx.lineTo(4 / 6 * width, height / 2);
                ctx.lineTo(width / 2, 5 / 6 * height);
                ctx.lineTo(width / 2, height / 2);
                ctx.fill();

                ctx.beginPath();
                canvas_arrow(ctx, width / 2, height - rad, width / 2, rad);
                canvas_arrow(ctx, rad, height / 2, width - rad, height / 2);
                ctx.strokeText("X", Number(width) - rad, height / 2 - rad / 2);
                ctx.strokeText("Y", width / 2 + rad / 2, rad);
                addMark("-R", width / 2, 5 / 6 * height);
                addMark("-R/2", width / 2, 4 / 6 * height);
                addMark("R/2", width / 2, 2 / 6 * height);
                addMark("R", width / 2, 1 / 6 * height);
                addMark("R/2", 4 / 6 * width, height / 2);
                addMark("R", 5 / 6 * width, height / 2);
                addMark("-R/2", 2 / 6 * width, height / 2);
                addMark("-R", 1 / 6 * width, height / 2);
                ctx.stroke();

                function addMark(label, x, y) {
                    if (x === width / 2) {
                        ctx.moveTo(x - rad2, y);
                        ctx.lineTo(x + rad2, y);
                        ctx.strokeText(label, x + rad, y);
                    }
                    if (y === height / 2) {
                        ctx.moveTo(x, y - rad2);
                        ctx.lineTo(x, y + rad2);
                        ctx.strokeText(label, x, y - rad);
                    }
                }

                function canvas_arrow(context, fromx, fromy, tox, toy) {
                    let headlen = 10; // length of head in pixels
                    let dx = tox - fromx;
                    let dy = toy - fromy;
                    let angle = Math.atan2(dy, dx);
                    context.moveTo(fromx, fromy);
                    context.lineTo(tox, toy);
                    context.lineTo(tox - headlen * Math.cos(angle - Math.PI / 6), toy - headlen * Math.sin(angle - Math.PI / 6));
                    context.moveTo(tox, toy);
                    context.lineTo(tox - headlen * Math.cos(angle + Math.PI / 6), toy - headlen * Math.sin(angle + Math.PI / 6));
                }
            }
        </script>
    </td>
</tr>