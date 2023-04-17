<%-- 
    Document   : produtodetalhado
    Created on : 30/10/2022, 22:24:07
    Author     : Vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    </head>
    <body>
        
        
        <div class="row">
            <div class="col-12 border"> ${produtodetalhado.nomeProduto} </div>
        </div>
        <div class="row">
            <div class="col-8 border">Fotos do Produto</div>
            <div><img src="${pageContext.request.contextPath}/fotos/${produtodetalhado.fotoProduto}" width="75 px"></div>
            <div><img src="${pageContext.request.contextPath}/fotos/${produtodetalhado.fotoProduto1}" width="75 px"</div>
            <div><img src="${pageContext.request.contextPath}/fotos/${produtodetalhado.fotoProduto2}" width="75 px"</div>
            <div class="col-4 border">
                <h1> ${produtodetalhado.nomeProduto}</h1>
                <h2>R$ ${produtodetalhado.precoProduto} </h2>

                <p>Distribuido por: <strong> ${produtodetalhado.campanha.nomeCampanha} </strong></p><br>
                <p>${produtodetalhado.descricaoProduto}</p><br>
                <p>Seu tempo de uso é de: ${produtodetalhado.tempousoProduto}</p>
                

                <a href="${pageContext.request.contextPath}/AlterarProduto?idProduto=${produtodetalhado.idProduto}">Comprar</a>
                
                <h1>${mensagem}</h1>
                
            </div>
        </div>
        <div class="row">
            <div class="col-12 border">Comentarios</div>
        </div>







        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>


    </body>
</html>
