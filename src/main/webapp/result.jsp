<%@ page import="models.PointsCollection" %>
<%@ page import="models.PointData" %><%--
  Created by IntelliJ IDEA.
  User: Валерия
  Date: 16.10.2023
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <td><%
            out.println(point.getCoordinates().getX());
        %></td>
        <td><%
            out.println(point.getCoordinates().getY());
        %></td>
        <td><%
            out.println(point.getCoordinates().getR());
        %></td>
        <td><%
            out.println(point.getIsHit());
        %></td>
        <td><%
            out.println(point.getCurrentDate());
        %></td>
        <td><%
            out.println(point.getScriptRunningTime());
        %></td>
    </tr>
</table>
<a href="http://localhost:8080/lab2web" id="return-link" class="button">Вернуться на главную страницу</a>

</body>
</html>
