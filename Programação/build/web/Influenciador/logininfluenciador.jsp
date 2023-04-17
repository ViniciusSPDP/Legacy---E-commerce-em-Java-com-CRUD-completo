<%-- 
    Document   : logininfluenciador
    Created on : 23/11/2022, 08:13:32
    Author     : Vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/Influenciador/logincssinflu.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="box">
            <div class="form">


                <a href="${pageContext.request.contextPath}/ListarProduto"><img src="${pageContext.request.contextPath}/Influenciador/Arvere- Cor.png"></a>

                <h2>Logar Influencer</h2>
                <form action="${pageContext.request.contextPath}/LogarInfluenciador" method="post">

                    <div class=" inputBox">
                        <input type="email" name="emailInfluenciador" required="required">
                        <span>Email</span>
                        <i></i>
                    </div>
                    <div class="inputBox">
                        <input type="password"  name="senhaInfluenciador" required="required">
                        <span>Senha</span>
                        <i></i>
                    </div>
                    <br>
                    <p style="color: white">${mensagem}</p>
                    <br>


                    <input type="hidden" name="acao" value="login">

                    <input  href="Influenciador/homeinfluenciador.jsp" type="submit" value="Logar">
                </form>
            </div>
        </div>
    </body>
</html>
