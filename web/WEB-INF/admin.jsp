<%-- 
    Document   : admin
    Created on : 21 juin 2015, 12:17:23
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
                    <c:out value="Login as Admin: "/>
                    <c:out value="${currrentLecturer.firstName} ${currrentLecturer.lastName}"/>
                    <a href="LogoutServlet">Logout</a>
                </div>

                <div id="menu">
                    <ul>
                        <li><a href="IndexServlet">Public Page</a></li>
                        <li><a href="AdminServlet">My Profile</a></li>
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
                        <li><a href="#tab-1">Classroom</a></li>
                        <li><a href="#tab-1">Course</a></li>
                        <li><a href="#tab-1">Day</a></li>
                        <li><a href="#tab-1">Department</a></li>
                        <li><a href="#tab-1">Faculty</a></li>
                        <li><a href="#tab-1">Lecturer</a></li>
                        <li><a href="#tab-1">Level</a></li>
                        <li><a href="#tab-1">Period</a></li>
                        <li><a href="#tab-1">Timetable</a></li>
                    </div>
                    <div class="tab">
                        <div id="classroom" class="tab-content">
                            <h2>Classroom</h2>
                            <div>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>User Id</th>
                                            <th>First Name</th>                                                                         
                                            <th colspan=2>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${classrooms}" var="classroom">
                                            <tr>
                                                <td><c:out value="${classroom.classroomId}" /></td>
                                                <td><c:out value="${classroom.classroomName}" /></td>
                                                <td><a href="ClassroomServlet?action=edit&classroomId=<c:out value="${classroom.classroomId}"/>">Update</a></td>
                                                <td><a href="ClassroomServlet?action=delete&classroomId=<c:out value="${classroom.classroomId}"/>">Delete</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="course" class="tab-content">
                            <h2>Course</h2>
                            <div>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>Course Code</th>
                                            <th>Course Name</th>
                                            <th>Level</th>
                                            <th>Lecturer</th>
                                            <th>Department</th>
                                            <th colspan=2>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${courses}" var="course">
                                            <tr>
                                                <td><c:out value="${course.courseCode}" /></td>
                                                <td><c:out value="${course.courseName}" /></td>
                                                <td><c:out value="${course.level.levelName}" /></td>
                                                <td><c:out value="${course.lecturer.firstName} ${course.lecturer.lastName}" /></td>
                                                <td><c:out value="${course.department.dptName}" /></td>
                                                <td><a href="CourseServlet?action=edit&courseCode=<c:out value="${course.courseCode}"/>">Update</a></td>
                                                <td><a href="CourseServlet?action=delete&courseCode=<c:out value="${course.courseCode}"/>">Delete</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div id="day" class="tab-content">
                            <h2>Day</h2>
                            <div>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>Day Name</th>
                                            <th>Day Number</th>                                            
                                            <th colspan=2>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${days}" var="day">
                                            <tr> 
                                                <td><c:out value="${day.dayName}" /></td>
                                                <td><c:out value="${day.dayNumber}" /></td>                                                
                                                <td><a href="DayServlet?action=edit&dayName=<c:out value="${day.dayName}"/>">Update</a></td>
                                                <td><a href="DayServlet?action=delete&dayName=<c:out value="${day.dayName}"/>">Delete</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div id="department" class="tab-content">
                            <h2>Department</h2>
                            <div>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Faculty</th>
                                            <th>HOD</th>
                                            <th colspan=2>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${departments}" var="department">
                                            <tr>
                                                <td><c:out value="${department.dptId}" /></td>
                                                <td><c:out value="${department.dptName}" /></td>
                                                <td><c:out value="${department.faculty.facultyName}" /></td> 
                                                <td><c:out value="${department.hod.firstName} ${department.hod.lastName}" /></td> 
                                                <td><a href="DepartmentServlet?action=edit&dptId=<c:out value="${department.dptId}"/>">Update</a></td>
                                                <td><a href="DepartmentServlet?action=delete&dptId=<c:out value="${department.dptId}"/>">Delete</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div id="faculty" class="tab-content">
                            <h2>Faculty</h2>
                            <div>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Dean</th>                                            
                                            <th colspan=2>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${faculties}" var="faculty">
                                            <tr>
                                                <td><c:out value="${faculty.facultyId}" /></td>
                                                <td><c:out value="${faculty.facultyName}" /></td>                                                 
                                                <td><c:out value="${faculty.dean.firstName} ${faculty.dean.lastName}" /></td> 
                                                <td><a href="FacultyServlet?action=edit&facultyId=<c:out value="${faculty.facultyId}"/>">Update</a></td>
                                                <td><a href="FacultyServlet?action=delete&facultyId=<c:out value="${faculty.facultyId}"/>">Delete</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div id="lecturer" class="tab-content">
                            <h2>Lecturer</h2>
                            <div>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Email</th>
                                            <th>Phone Number</th>                                            
                                            <th>Faculty</th>
                                            <th>Department</th>                                                                                       
                                            <th colspan=2>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${lecturers}" var="lecturer">
                                            <tr>
                                                <td><c:out value="${lecturer.lecturerId}" /></td>
                                                <td><c:out value="${lecturer.firstName}" /></td>
                                                <td><c:out value="${lecturer.lastName}" /></td>
                                                <td><c:out value="${lecturer.email}" /></td>
                                                <td><c:out value="${lecturer.phoneNumber}" /></td>
                                                <td><c:out value="${lecturer.faculty.facultyName}" /></td>                                                 
                                                <td><c:out value="${lecturer.department.dptName}" /></td> 
                                                <td><a href="LecturerServlet?action=edit&lecturerId=<c:out value="${lecturer.lecturerId}"/>">Update</a></td>
                                                <td><a href="LecturerServlet?action=delete&lecturerId=<c:out value="${lecturer.lecturerId}"/>">Delete</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div id="level" class="tab-content">
                            <h2>Level</h2>
                            <div>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>                                            
                                            <th colspan=2>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${levels}" var="level">
                                            <tr> 
                                                <td><c:out value="${level.levelId}" /></td>
                                                <td><c:out value="${level.levelName}" /></td>                                                
                                                <td><a href="LevelServlet?action=edit&levelId=<c:out value="${level.levelId}"/>">Update</a></td>
                                                <td><a href="LevelServlet?action=delete&levelId=<c:out value="${level.levelId}"/>">Delete</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div id="period" class="tab-content">
                            <h2>Period</h2>
                            <div>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Start Time</th>
                                            <th>End Time</th>
                                            <th colspan=2>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${periods}" var="period">
                                            <tr>  
                                                <td><c:out value="${period.periodId}" /></td>
                                                <td><c:out value="${period.startTime}" /></td>
                                                <td><c:out value="${period.endTime}" /></td>                                                
                                                <td><a href="PeriodServlet?action=edit&periodId=<c:out value="${period.periodId}"/>">Update</a></td>
                                                <td><a href="PeriodServlet?action=delete&periodId=<c:out value="${period.periodId}"/>">Delete</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="timetable" class="tab-content">
                            <h2>Timetable</h2>
                            <div>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Course Code</th>
                                            <th>Course Name</th>
                                            <th>Start Time</th>
                                            <th>End Time</th>
                                            <th>Classroom</th>
                                            <th>Day</th>
                                            <th colspan=2>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${timetables}" var="timetable">
                                            <tr>
                                                <td><c:out value="${timetable.id}" /></td>
                                                <td><c:out value="${timetable.course.courseCode}" /></td>
                                                <td><c:out value="${timetable.course.courseName}" /></td>
                                                <td><c:out value="${timetable.period.startTime}" /></td>
                                                <td><c:out value="${timetable.period.endTime}" /></td>
                                                <td><c:out value="${timetable.classroom.classroomName}" /></td>
                                                <td><c:out value="${timetable.day.dayName}" /></td>
                                                <td><a href="TimetableServlet?action=edit&timetableId=<c:out value="${timetable.id}"/>">Update</a></td>
                                                <td><a href="TimetableServlet?action=delete&timetableId=<c:out value="${timetable.id}"/>">Delete</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
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
