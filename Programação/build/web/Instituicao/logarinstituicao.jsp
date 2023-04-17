<%-- 
    Document   : logarinstituicao
    Created on : 03/11/2022, 00:26:35
    Author     : Vinicius
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/Instituicao/logincssinsti.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="box">
            <div class="form">


                <a href="${pageContext.request.contextPath}/ListarProduto"><img src="${pageContext.request.contextPath}/Influenciador/Arvere- Cor.png"></a>

                <h2>Logar Instituicao</h2>
                <form action="${pageContext.request.contextPath}/LogarInstituicao" method="post">

                    <div class="inputBox">
                        <input type="text" name="cnpjInstituicao" required="required">
                        <span>CNPJ</span>
                        <i></i>
                    </div>
                    <div class="inputBox">
                        <input type="password"  name="senhaInfluenciador" required="required">
                        <span>Senha</span>
                        <i></i>
                    </div>
                    <br>
                    <p style="color: white">${mensagem}</p>
                    <div class="links" style="">
                        <a href="${pageContext.request.contextPath}/Instituicao/precadastro.jsp">Pre-Cadastro</a>
                        <a style="color: white">${mensagem}</a>

                    </div>

                    <br>


                    <input type="hidden" name="acao" value="login">

                    <input type="submit" value="Logar" style="margin-top: 0px">
                </form>
            </div>
        </div>

    </body>
</html>
