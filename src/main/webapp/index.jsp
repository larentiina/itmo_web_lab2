<%@ page import="models.PointData" %>
<%@ page import="models.PointsCollection" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Task</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/general.css">
    <link rel="stylesheet" href="styles/form.css">
    <link rel="stylesheet" href="styles/graph.css">
    <link rel="stylesheet" href="styles/result_table.css">

</head>
<body>
<table id="main_table">
    <thead>
    <tr>
        <th colspan="4" id="title">Кузенина Валерия Николаевна, группа: P3232, Вариант: 1121212</th>

    </tr>
    </thead>
    <tr>
        <td colspan="4" class="empty"></td>
    </tr>
    <tr>
        <td rowspan="3" id="left_border"></td>
        <td class = "active" id="td_graph" ><svg xmlns="http://www.w3.org/2000/svg" id="svg" height="300">
            <line x1="0" y1="150" x2="300" y2="150" stroke="#000720"></line>
            <line x1="150" y1="0" x2="150" y2="300" stroke="#000720"></line>
            <line x1="270" y1="148" x2="270" y2="152" stroke="#000720"></line>
            <text x="265" y="140">3</text>
            <line x1="210" y1="148" x2="210" y2="152" stroke="#000720"></line>
            <text x="200" y="140">1.5</text>
            <line x1="90" y1="148" x2="90" y2="152" stroke="#000720"></line>
            <text x="75" y="140">-1.5</text>
            <line x1="30" y1="148" x2="30" y2="152" stroke="#000720"></line>
            <text x="20" y="140">-3</text>
            <line x1="148" y1="30" x2="152" y2="30" stroke="#000720"></line>
            <text x="156" y="35">3</text>
            <line x1="148" y1="90" x2="152" y2="90" stroke="#000720"></line>
            <text x="156" y="95">1.5</text>
            <line x1="148" y1="210" x2="152" y2="210" stroke="#000720"></line>
            <text x="156" y="215">-1.5</text>
            <line x1="148" y1="270" x2="152" y2="270" stroke="#000720"></line>
            <text x="156" y="275">-3</text>
            <polygon points="300,150 295,155 295, 145" fill="#000720" stroke="#000720"></polygon>
            <polygon points="150,0 145,5 155,5" fill="#000720" stroke="#000720"></polygon>

     <rect x="150" y="150" width="60" height="120" fill-opacity="0.4" stroke="navy" fill="blue"></rect>
            <polygon points="150,150 270,150 150,30" fill-opacity="0.4" stroke="navy" fill="blue"></polygon>
            <path d="M 150 150 L 30 150 A 120 120 0 0 1 150 30 L Z" fill-opacity="0.4" stroke="navy" fill="blue"></path>

        </svg>
            <script src="js/graph.js"></script>
            <% PointsCollection collection = (PointsCollection) application.getAttribute("PointsCollection");
                double x,y;%>
            <% if(collection != null) { %>
            <% for(PointData point: collection.getCollection()){
                    x = point.getCoordinates().getX();
                    y=  point.getCoordinates().getY(); %>
            <script>createPoint(40*<%=x%>+150,(40*<%=y%>-150)*(-1))</script>
            <%}%>
            <%}%>
        </td>
        <td rowspan="3" id="td_result_table" width="650">
            <table id="result_table" width="650">
                <tr>
                    <th id="th_x">X</th>
                    <th id="th_y">Y</th>
                    <th id="th_r">R</th>
                    <th id="hit">Попал/Промазал</th>
                    <th id="time">Текущее время</th>
                    <th id="scriptWork">Время работы скрипта</th>
                </tr>
                <% %>
                <% if(collection != null) { %>
                <% for(PointData point: collection.getCollection()){ %>
                    <tr>
                        <td><%=
                            point.getCoordinates().getX() %>
                       </td>
                        <td><%=
                            point.getCoordinates().getY()%>
                        </td>
                        <td><%=
                            point.getCoordinates().getR()
                        %></td>
                        <td><%=
                            point.getIsHit()
                        %></td>
                        <td><%=
                            point.getCurrentDate()
                        %></td>
                        <td><%=
                           point.getScriptRunningTime()
                        %></td>
                    </tr>
                <% }
                }%>
            </table>
        </td>
        <td rowspan="3" id="right_border"></td>
    </tr>

    <tr>
        <td>
            <form name="point_coordinates" id="point_coordinates" method="GET" action="#">
                <fieldset>
                    <p><label>Изменение X:
                    <input type="text" placeholder="[-3;5]" id="X" required></label></p>
                    <p><label >Изменение Y:</label> </p>
                        <p>
                        <% for( int i=-5; i<=3; i++){ %>
                        <input class="Y" type="button" value="<%=i%>" onclick="chooseButton(this,'Y')">
                        <%}%>

                    </p>
                    <p><label >Изменение R: </label>
                        <input class="R" type="button" value=1 onclick="chooseButton(this,'R')">
                        <input class="R" type="button" value=1.5 onclick="chooseButton(this,'R')">
                        <input class="R" type="button" value=2 onclick="chooseButton(this,'R')">
                        <input class="R" type="button" value=2.5 onclick="chooseButton(this,'R')">
                        <input class="R" type="button" value=3 onclick="chooseButton(this,'R')">
                    </p>
                    <p>
                    <button class="buttons" type="submit">Отправить</button>
                    <button class="buttons" type="reset" id="clear_button">Очистить таблицу</button>
                    </p>
                </fieldset>
            </form>
            <script src="js/main.js"></script>

            <script src="js/result_table.js"></script>
            <script src="js/form.js"></script>
        </td>
    </tr>
</table>
</body>
</html>
