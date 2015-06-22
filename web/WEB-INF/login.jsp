<%-- 
    Document   : login
    Created on : 19 juin 2015, 02:20:35
    Author     : MIS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="login">
            <h1>Login to Web App</h1>
            <form method="post" action='LoginServlet' name="authenticate">
                <p><input type="text" name="username" value="" placeholder="Username"></p>
                <p><input type="password" name="password" value="" placeholder="Password"></p>
                <p><c:out value="${error}" /></p>
                <p class="remember_me">
                    <label>
                        <input type="checkbox" name="remember_me" id="remember_me">
                        Remember me on this computer
                    </label>
                </p>
                <p class="submit"><input type="submit" name="commit" value="Connexion"></p>
            </form>
        </div>
    </body>
</html>
