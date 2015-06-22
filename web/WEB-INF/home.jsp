<%-- 
    Document   : user_page
    Created on : 18 juin 2015, 18:15:11
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
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <script src="script.js"></script>
    </head>
    <body>
        <div id ="container">
            <div id="header">
                <div id="title">
                    <h1>Timetable Generator</h1>
                </div>
                <div id="user_status">
                    <c:out value="${currentLecturer.firstName} ${currentLecturer.lastName}"/>
                    <a href="LogoutServlet">LogOut</a>
                </div>

                <div id="menu">
                    <ul>
                        <li><a href="index">Home</a></li>
                        <li><a href="HomeServlet">My Personal Space</a></li>
                    </ul>
                </div>
            </div>

            <div id="body">
                <div class="floatleft" >
                    <p>Select a lecturer</p>
                    <select name="lecturerName">
                        <c:forEach items="${lecturers}" var="lecturer">
                            <option value=""><c:out value="${lecturer.firstName}" /> <c:out value="${lecturer.lastName}" /></option>
                        </c:forEach>                
                    </select>
                    <div style="clear: both;"></div>
                    <a href="#" target="_parent"><button>Free List</button></a>
                    <a href="#" target="_parent"><button>Indivdual List</button></a>
                </div>

                <div class="floatright">
                    <ul class="tabs">
                        <li><a href="#tab-1">Individual List</a></li>
                        <li><a href="#tab-2">Free List</a></li>

                        <c:if test="${currentLecturer.position != '0'}">
                            <li><a href="#tab-2">Blocked List</a></li>
                            </c:if>

                        <li><a href="#tab-2">My Details</a></li>
                    </ul>
                    <div style="clear: both;"></div>
                    <div class="tab">
                        <div id="individual_list" class="tab-content">
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

                        <div id="free_list" class="tab-content">
                            <h2>Free List</h2>
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

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        </div>
                                    </tr>

                                    <tr>
                                        <th>09:00 - 11:00</td>

                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        </div>
                                    </tr>

                                    <tr>
                                        <th>11:00 - 01:00</td>

                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        </div>
                                    </tr>

                                    <tr>
                                        <th>01:00 - 03:00</td>

                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        </div>
                                    </tr>

                                    <tr>
                                        <th>03:00 - 05:00</td>

                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        </div>
                                    </tr>

                                    <tr>
                                        <th>05:00 - 07:00</td>

                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        </div>
                                    </tr>

                                </table>
                            </div>
                        </div>

                        <c:if test="${currentLecturer.position != '0'}">
                            <div id="blocked_list" class="tab-content">
                                <h2>Blocked List</h2>
                                <div>
                                    <form method="get" action='BlocklistServlet' name="authenticate">
                                        Day: <select name="dayName">
                                            <c:forEach items="${days}" var="day">
                                                <option value="${day.dayName}"><c:out value="${day.dayName}" /></option>
                                            </c:forEach>               
                                        </select>


                                        Period: <select name="myPeriod">
                                            <c:forEach items="${periods}" var="p">
                                                <option value="${p.periodId}"><c:out value="${p.periodId}" /></option>
                                            </c:forEach>                
                                        </select>

                                        <p class="submit"><input type="submit" name="commit" value="Get Blocked List"></p>

                                    </form>
                                </div>
                            </div>
                        </c:if>


                        <div id="my_details" class="tab-content">
                            <h2>My Details</h2>
                            <div>
                                <form method="POST" action='HomeServlet' name="frmAddLecturer">
                                    User ID : <input type="text" readonly="readonly" name="userid"
                                                     value="<c:out value="${currentLecturer.lecturerId}" />" /> <br />

                                    First Name : <input type="text" name="firstName"
                                                        value="<c:out value="${currentLecturer.firstName}" />" /> <br /> 

                                    Last Name : <input type="text" name="lastName"
                                                       value="<c:out value="${currentLecturer.lastName}" />" /> <br /> 

                                    Email : <input type="text" name="email"
                                                   value="<c:out value="${currentLecturer.email}" />" /> <br />

                                    Phone Number : <input type="text" name="phoneNumber"
                                                          accept=""value="<c:out value="${currentLecturer.phoneNumber}" />" /> <br />

                                    Position : <input type="text" name="position"
                                                      value="<c:out value="${currentLecturer.position}" />" /> <br />

                                    Faculty(Dean) : <input type="text" name="faculty"
                                                           value="<c:out value="${currentLecturer.faculty.facultyName}" />" /> <br />

                                    Department(HOD) : <input type="text" name="department"
                                                             value="<c:out value="${currentLecturer.department.dptName}" />" /> <br />

                                    Course Taught: <select name="course_taught">
                                        <c:forEach items="${currentLecturer.listCourse}" var="course">
                                            <option value=""><c:out value="${course.courseName}" /></option>
                                        </c:forEach>                
                                    </select>

                                </form>
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
