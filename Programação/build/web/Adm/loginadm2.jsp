<%-- 
    Document   : loginadm
    Created on : 14/10/2022, 02:30:43
    Author     : Vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Logar Adminstrador</h1>
        <br><br>

        <form action="${pageContext.request.contextPath}/LogarAdm" method="post">
            <input type="email" class="form-control rounded-3" placeholder="name@example.com" name="loginAdm">
            <label for="floatingInput">E-mail</label>

            <br><br>
            <input type="password" class="form-control rounded-3" placeholder="Password" name="senhaAdm">
            <label for="floatingPassword">Senha</label>
            <input type="hidden" name="acao" value="login">

            <br><br>
            <button type="submit">Logar</button>
            <br><br>
            ${mensagem}

        </form>
    </body>
</html>
