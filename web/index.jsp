<%@ page import="java.util.UUID" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ru">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>Lab2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<table>
    <%@ include file="incl/header.jsp" %>
    <tr>
        <td>
            <div id="checkedR"><br><br></div>
        </td>
    </tr>
    <tr>
        <td>
            <form method="POST" action="${pageContext.request.contextPath}/controller" onsubmit="return valid()">
                <input type="hidden" name="X" id="CanvasX">
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
                                <input type="radio" class="R" name="R" value="1" id="R0">
                                <label for="R0">1</label>
                                <input type="radio" class="R" name="R" value="2" id="R1">
                                <label for="R1">2</label>
                                <input type="radio" class="R" name="R" value="3" id="R2">
                                <label for="R2">3</label>
                                <input type="radio" class="R" name="R" value="4" id="R3">
                                <label for="R3">4</label>
                                <input type="radio" class="R" name="R" value="5" id="R4">
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
                <input type="hidden" name="isFromCanvas" value="0">
                <input type="hidden" name="unique" value="<%= UUID.randomUUID().toString()%>">
            </form>
        </td>
    </tr>
    <%@ include file="incl/table.jsp" %>
</table>
<script src="${pageContext.request.contextPath}/javascript/validation.js"></script>
<script type="text/javascript">
    const errorText = "Невозможно определить координаты точки!<br>Укажите R!";
    let form = document.forms[0];

    window.onload = function () {
        form.reset(); //drop R on new page
    };

    Array.prototype.forEach.call(form.elements.R, function (elem) {
        //elem.oninput doesn't work on helios. Strange! 
        elem.onclick = function (event) {
            document.getElementById("checkedR").innerHTML = "<br><br>";
            paintPlot();
            addDots(event.currentTarget.value, data); //repaint dots with new radius
        }
    });

    canvas.onclick = function (event) {
        let R = null;

        Array.prototype.forEach.call(form.elements.R, function (elem) {
            if (elem.checked === true) {
                R = elem;
            }
        });
        if (R == null) {
            document.getElementById("checkedR").innerHTML = errorText; //click with not choosen R
        } else {
            const x = event.pageX - (canvas.getBoundingClientRect().left + pageXOffset);
            const y = event.pageY - (canvas.getBoundingClientRect().top + pageYOffset);


            const cordX = (x - width / 2) * Number(R.value) / Math.round(width / 3);
            const cordY = (height / 2 - y) * Number(R.value) / Math.round(height / 3);

            //draw point
            setColor({'x': cordX, 'y': cordY}, Number(R.value));
            ctx.beginPath();
            ctx.arc(x, y, 3, 0, 2 * Math.PI);
            ctx.fill();

            //send request
            form.elements.X.value = cordY;
            form.elements.Y.value = cordY;
            form.elements.isFromCanvas.value = 1;
            form.submit();
        }
    };
</script>
</body>
</html>