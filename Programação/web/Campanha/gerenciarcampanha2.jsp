<%-- 
    Document   : gerenciarcampanha
    Created on : 6 de out de 2022, 11:54:04
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> Realizar Campanha </h1>
        <form action="${pageContext.request.contextPath}/SalvarCampanha" method="POST">
            <input type="hidden" name="idCampanha" value="${campanha.idCampanha}">
            <label for="nomeCampanha">Nome Campanha: </label>
            <input type="text" name="nomeCampanha" value="${campanha.nomeCampanha}">
            <br /><br />
            <label for="descricaoCampanha"> Descrição Campanha: </label>
            <input type="text" name="descricaoCampanha" value="${campanha.descricaoCampanha}">
            <br/><br/>
            <input type="hidden" name="idInfluenciador" value="${id}">
           
            <br>

            <BR>
            <input type="submit" value="Salvar">            
        </form>
        <br><br>
        ${mensagem}
        <br><br>

        <table>
            <caption> Lista Campanha </caption>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>ID Influenciador</th>
                    <th>Nome Influenciador</th>
                    <th>Alterar</th>
                    <th>Instituições para Doação</th>
                    <th>Produtos da Campanha</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listacampanhainfluenciador}" var="campanha"> 
                    <tr>
                        <td>${campanha.idCampanha}</td>
                        <td>${campanha.nomeCampanha}</td>
                        <td>${campanha.descricaoCampanha}</td>
                        <td>${campanha.influenciador.idInfluenciador}</td>
                        <td>${campanha.influenciador.nomeInfluenciador}</td>
                        <td><a href="${pageContext.request.contextPath}/CarregarCampanha?idCampanha=${campanha.idCampanha}">Alterar</a></td>
                        <td><a href="${pageContext.request.contextPath}/DadosDoacao?idCampanha=${campanha.idCampanha}">Instituições</a></td>
                        <td><a href="${pageContext.request.contextPath}/DadosProduto?idCampanha=${campanha.idCampanha}">Produtos</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
