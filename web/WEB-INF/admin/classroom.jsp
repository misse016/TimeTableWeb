<%-- 
    Document   : classroom
    Created on : 21 juin 2015, 23:32:52
    Author     : MIS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Classroom Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="POST" action='ClassroomServlet' name="frmAddUser">
        Classroom ID : <input type="text" readonly="readonly" name="userid"
            value="<c:out value="${classroom.classroomId}" />" /> <br /> 
        
        Classroom Name : <input
            type="text" name="firstName"
            value="<c:out value="${classroom.classroomName}" />" /> <br />
        
        
         <input type="submit" value="Submit" />
        </form>
    </body>
</html>
