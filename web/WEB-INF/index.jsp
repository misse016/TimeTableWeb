<%-- 
    Document   : index
    Created on : 18 juin 2015, 21:53:39
    Author     : MIS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <link rel="stylesheet" type="text/css" href="mystyle.css">
    </head>
    <body>
        <div id="container">
            <div id="header">
                <div id="title">
                    <h1>Timetable Generator</h1>
                </div>
                <div id="user_status">
                    <c:out value="${currentLecturer.firstName} ${currentLecturer.lastName}"/>                   
                    <a href="HomeServlet">LogIn(Admin)</a>
                    <a href="AdminServlet">LogIn(Other User)</a>  
                </div>

                <div id="menu">
                    <ul>
                        <li><a href="IndexServlet">Public Page</a></li>

                        <li><a href="HomeServlet">My Profile(Admin)</a></li>
                        <li><a href="AdminServlet">My Profile(Others User)</a></li>

                    </ul>
                </div>
            </div>

            <div id="body">
                <div class="floatleft">
                    <h2>Float Left</h2>
                    <p>Your are consider a public user (Student)</p>
                    <p>This page shows a limited number of information</p>
                </div>
                <div class="floatright">
                    <div class="tabs">
                        <li><a href="#tab-1">Individual List</a></li>
                    </div>
                    <div class="tab">
                        <div id="timetable" class="tab-content">
                            <h2>Individual List</h2>
                            <div>
                                <table border=1 >
                                    <div id="head_nav">
                                        <tr>
                                            <th>Time</th>
                                            <th>Monday</th>
                                            <th>Tuesday</th>
                                            <th>Wednesday</th>
                                            <th>Thrusday</th>
                                            <th>Friday</th>
                                            <th>Saturday</th>
                                        </tr>
                                    </div>  

                                    <tr>
                                        <th>07:00 - 09:00</th>


                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Monday' && list.period.periodId == '1'}">
                                                    <c:out value="${list.course.courseName}"/><p>                                                
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Tuesday' && list.period.periodId == '1'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Wednesday' && list.period.periodId == '1'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Thursday' && list.period.periodId == '1'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Friday' && list.period.periodId == '1'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Saturday' && list.period.periodId == '1'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        </div>
                                    </tr>

                                    <tr>
                                        <th>09:00 - 11:00</td>

                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Monday' && list.period.periodId == '2'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Tuesday' && list.period.periodId == '2'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Wednesday' && list.period.periodId == '2'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Thursday' && list.period.periodId == '2'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Friday' && list.period.periodId == '2'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Saturday' && list.period.periodId == '2'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        </div>
                                    </tr>

                                    <tr>
                                        <th>11:00 - 01:00</td>

                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Monday' && list.period.periodId == '3'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Tuesday' && list.period.periodId == '3'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Wednesday' && list.period.periodId == '3'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Thursday' && list.period.periodId == '3'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Friday' && list.period.periodId == '3'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Saturday' && list.period.periodId == '3'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>

                                        </div>
                                    </tr>

                                    <tr>
                                        <th>01:00 - 03:00</td>

                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Monday' && list.period.periodId == '4'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Tuesday' && list.period.periodId == '4'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Wednesday' && list.period.periodId == '4'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Thursday' && list.period.periodId == '4'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Friday' && list.period.periodId == '4'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Saturday' && list.period.periodId == '4'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>

                                        </div>
                                    </tr>

                                    <tr>
                                        <th>03:00 - 05:00</td>

                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Monday' && list.period.periodId == '5'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Tuesday' && list.period.periodId == '5'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Wednesday' && list.period.periodId == '5'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Thursday' && list.period.periodId == '5'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Friday' && list.period.periodId == '5'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Saturday' && list.period.periodId == '5'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        </div>
                                    </tr>

                                    <tr>
                                        <th>05:00 - 07:00</td>

                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Monday' && list.period.periodId == '6'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Tuesday' && list.period.periodId == '6'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Wednesday' && list.period.periodId == '6'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Thursday' && list.period.periodId == '6'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Friday' && list.period.periodId == '6'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${individualList}" var="list">                                         
                                                <c:if test="${list.day.dayName == 'Saturday' && list.period.periodId == '6'}">
                                                    <c:out value="${list.course.courseName}"/><p>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        </div>
                                    </tr>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="footer">
                <p>Copyright 2015</p>
            </div>
        </div>
    </body>
</html>
