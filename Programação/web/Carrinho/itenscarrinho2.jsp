<%-- 
    Document   : itenscarrinho
    Created on : 1 de nov de 2022, 11:26:56
    Author     : Aluno
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="${pageContext.request.contextPath}/ListarProduto"><h1>Hello World!</h1></a><br>
        <table>
            <caption> Lista Produto </caption>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>idProduto</th>
                    <th>Nome</th>
                    <th>Preco</th>
                    <th>tempousoProduto</th>
                    <th>fotoProduto</th>
                    <th>idCampanha</th>
                    <th>Nome Campanha</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaprodutocarrinho}" var="produto"> 
                    <tr>
                        <td>${produto.carrinho.idCarrinho}</td>
                        <td>${produto.idProduto}</td>
                        <td>${produto.nomeProduto}</td>
                        <td>${produto.precoProduto}</td>
                        <td>${produto.tempousoProduto}</td>
                        <td>${produto.fotoProduto}</td>
                        <td>${produto.campanha.idCampanha}</td>
                        <td>${produto.campanha.nomeCampanha}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br><br><br><br><br>
        <table>
            <caption> Lista Doações </caption>
            <thead>
                <tr>
                    <th>Nome Campanha</th>
                    <th>Nome Instituição</th>
                    <th>Procentagem</th>                    
                    <th>Total Doado</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listadoacao}" var="doacao"> 
                    <tr>                        
                        <td>${doacao.campanha.nomeCampanha}</td>
                        <td>${doacao.instituicao.nomeInstituicao}</td>
                        <td>${doacao.porcentagemDoacao}</td>
                        <td>${doacao.totaldoadoDoacao}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>


        <br>
        <form action="${pageContext.request.contextPath}/FinalizarCarrinho" method="POST">
            <input type="number" step="0.01" class="valorTotal" name="valorTotal" readonly="" value="">
            <br>
            <input type="number" step="0.01" class="totaldoacaoCarrinho" name="totaldoacaoCarrinho" readonly="" value="">
            <br>
            <input type="number" value="${produto.carrinho.idCarrinho}">
            <br>
            <input type="submit">
        </form>
        <script>
            
            var valorCarrinho = 0;
            
            <c:forEach items="${listaprodutocarrinho}" var="produto">
            var preco = [${produto.precoProduto}];
            
            preco.forEach((preco, index) => {
                for (var i = 0; i <= index; i++) {
                    valorCarrinho += preco;
                }
                ;
            });
            
            </c:forEach>
            document.querySelector('.valorTotal').value = valorCarrinho;
            
            var totaldoado = valorCarrinho * 0.1;
            
            document.querySelector('.totaldoacaoCarrinho').value = totaldoado;
            
        </script>


    </body>
</html>
