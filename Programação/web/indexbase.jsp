<%-- 
    Document   : index
    Created on : 13/10/2022, 22:39:25
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
        <div>TODO write content</div>
        <br><br>
        <a href="ListarAdm">ADM</a>
        <br><br>
        <a href="ListarInfluenciador">Influenciador</a>
        <br><br>
        <a href="Influenciador/logininfluenciador.jsp">Login Influencidor</a>
        <br><br>
        <a href="Adm/loginadm.jsp">Login ADM</a>
        <br><br>
        <a href="Instituicao/logarinstituicao.jsp">Login Instituicao</a>
        <br><br>
        
        <br><br>
        <a>${mensagem}</a>
    </body>
</html>
