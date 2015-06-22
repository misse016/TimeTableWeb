<%-- 
    Document   : BlockList
    Created on : 20 juin 2015, 15:49:36
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
    </head>
    <body>
        <h1>Block Listnnnnnnn Page</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Course Code</th>
                    <th>Course Name</th>
                    <th>Classroom</th>                                        
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${timetables}" var="blocklist">
                <tr>
                    <td><c:out value="${blocklist.course.courseCode}" /></td>
                <td><c:out value="${blocklist.course.courseName}" /></td>
                <td><c:out value="${blocklist.classroom.classroomName}" /></td>                    
                </tr>     
            </c:forEach>
        </tbody>
    </table>

    </body>
</html>
