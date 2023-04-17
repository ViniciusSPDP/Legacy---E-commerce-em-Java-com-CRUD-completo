<%-- 
    Document   : logininfluenciador
    Created on : 6 de out de 2022, 11:41:02
    Author     : Aluno
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
        <h1>Logar Influenciador</h1>
        <br><br>

        <form action="${pageContext.request.contextPath}/LogarInfluenciador" method="post">
            <input type="email" class="form-control rounded-3" placeholder="name@example.com" name="emailInfluenciador">
            <label for="floatingInput">E-mail</label>

            <br><br>
            <input type="password" class="form-control rounded-3" placeholder="Password" name="senhaInfluenciador">
            <label for="floatingPassword">Senha</label>
            <input type="hidden" name="acao" value="login">


            <br><br>
            <button href="Influenciador/homeinfluenciador.jsp" type="submit">Logar</button>
            <br><br>
            ${mensagem}

        </form>
    </body>
</html>
