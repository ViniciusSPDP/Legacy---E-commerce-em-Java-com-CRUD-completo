<%-- 
    Document   : gerenciaradm
    Created on : 29 de set de 2022, 11:28:16
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
    <a href="${pageContext.request.contextPath}/DadosInstituicao">Cadastro das Instituicao</a>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h1>Cadastro do Administrador</h1>
    <form action="${pageContext.request.contextPath}/SalvarAdm" method="POST">
        <label for="idUsuario">Id ADM</label>
        <input type="hidden" name="idAdm" value="${adm.idAdm}">
        <br /><br />
        <label for="nomeUsuario">Nome Adm: </label>
        <input type="text" name="nomeAdm" value="${adm.nomeAdm}">
        <br /><br />
        <label for="nomeUsuario">Email: </label>
        <input type="text" name="loginAdm" value="${adm.loginAdm}">
        <br /><br />
        <label for="nomeUsuario">Senha: </label>
        <input type="text" name="senhaAdm" value="${adm.senhaAdm}">
        <br /><br />
        <input type="submit" value="Salvar">            
    </form>
    <br><br>
    ${mensagem}
    <br><br>

    <table>
        <caption> Lista ADM </caption>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Senha</th>
                <th>Alterar</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listaadm}" var="adm"> 
                <tr>
                    <td>${adm.idAdm}</td>
                    <td>${adm.nomeAdm}</td>
                    <td>${adm.loginAdm}</td>
                    <td>${adm.senhaAdm}</td>
                    <td><a href="${pageContext.request.contextPath}/CarregarAdm?idAdm=${adm.idAdm}">Alterar</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
