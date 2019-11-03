<script src="${pageContext.request.contextPath}/javascript/jquery-3.4.1.min.js"></script>
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
        <canvas id="canvas" width="512" height="512" style=" margin: 1% 0;">
        </canvas>
        <script type="text/javascript">
            const data = [];
            let x,y;
            <c:forEach var="point" items="${sessionScope.data}"> // add history
            x = ${point.getX()};
            y = ${point.getY()};
            data.push({"x":x, "y":y});
            </c:forEach>
            //test
            data.push({"x":-1, "y":1});
            data.push({"x":1, "y":-1});
            data.push({"x":2, "y":-3});
            console.log(data);
            const canvas = document.getElementById("canvas");
            const width = canvas.getAttribute("width");
            const height = canvas.getAttribute("height");
            let rad = height/40;
            let rad2 = height/80;
            const ctx = canvas.getContext("2d");
            paintPlot(); // draw Axes with marks
            const {top: canvTop, left: canvLeft} = getCoords(canvas);
            console.log(canvTop);
            console.log(canvLeft);
            const center = {
                "x": Number(canvLeft) + width/2,
                "y": Number(canvTop) + height/2
            };
            console.log(center);
            addDots(1, data);

            function addDots(R, data) {
                ctx.fillStyle = "red";
                Array.prototype.forEach.call(data, function (point) {
                    console.log(point);
                    let x = width/2 + point['x']/Number(R)*width/3;
                    let y = height/2 + point['y']/Number(R)*height/3;
                    console.log(x);
                    console.log(y);
                    ctx.fillRect(x-2, y-2, 5, 5);
                });
            }
            function addDot(R, x, y) {
                let x1 = width/2 + x/Number(R)*width/3;
                let y1 = height/2 + y/Number(R)*height/3;
                ctx.fillRect(x-2, y-2, 5, 5);
            }
            function getCoords(elem) {
                let box = elem.getBoundingClientRect();
                return {
                    top: box.top + pageYOffset,
                    left: box.left + pageXOffset
                };
            }
            function paintPlot() {
                ctx.fillStyle = "white";
                ctx.fillRect(0, 0, Number(width), Number(height)); //do white canvas
                ctx.beginPath();
                canvas_arrow(ctx, width / 2, height - rad, width / 2, rad);
                canvas_arrow(ctx, rad, height / 2, width - rad, height / 2);
                ctx.strokeText("X", Number(width) - rad, height / 2 - rad/2);
                ctx.strokeText("Y", width / 2 + rad/2, rad);
                addMark("-R", width / 2, 5/6 * height);
                addMark("-R/2", width / 2, 4/6 * height);
                addMark("R/2", width / 2, 2/6 * height);
                addMark("R", width / 2, 1/6 * height);
                addMark("R/2", 4/6 * width, height/2);
                addMark("R", 5/6 * width, height/2);
                addMark("-R/2", 2/6 * width, height/2);
                addMark("-R", 1/6 * width, height/2);
                ctx.stroke();
                function addMark(label, x, y) {
                    if(x === width / 2) {
                        ctx.moveTo(x - rad2 ,y);
                        ctx.lineTo(x + rad2 ,y);
                        ctx.strokeText(label, x + rad ,y);
                    }
                    if (y === height/2) {
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