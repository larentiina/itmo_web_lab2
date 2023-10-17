<%@ page import="models.PointsCollection" %>
<%@ page import="models.PointData" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="styles/general_result_page.css">
</head>
<body>

<header class="header">
    <span id="title">Кузенина Валерия Николаевна, группа: P3232, Вариант: 1121212</span>
</header>
<table id="result_table" >
    <tr>
        <th id="th_x">X</th>
        <th id="th_y">Y</th>
        <th id="th_r">R</th>
        <th id="hit">Попал/Промазал</th>
        <th id="time">Текущее время</th>
        <th id="scriptWork">Время работы скрипта</th>
    </tr>
<% PointsCollection collection = (PointsCollection) application.getAttribute("PointsCollection");%>
    <% PointData point = collection.getCollection().getLast();%>
        <tr>
            <td><%=point.getCoordinates().getX() %>
            </td>
            <td><%=point.getCoordinates().getY()%>
            </td>
            <td><%=point.getCoordinates().getR()
            %></td>
            <td><%=point.getIsHit()%></td>
            <td><%=point.getCurrentDate()
            %></td>
            <td><%=
            point.getScriptRunningTime()
            %></td>
    </tr>
</table>
<a href="http://localhost:8080/lab2web" id="return-link" class="button">Вернуться на главную страницу</a>

</body>
</html>
