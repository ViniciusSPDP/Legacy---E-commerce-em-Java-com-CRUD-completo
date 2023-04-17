<%-- 
    Document   : detalhesproduto
    Created on : 18/11/2022, 00:58:16
    Author     : Vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${produtodetalhado.nomeProduto} - Legacy</title>
    </head>
    <body>


        <jsp:include page="../navbar.jsp"/>
        <jsp:include page="../preloader.jsp"/>

        <br><br>

        <div class="container-fluid py-5">
            <div class="row px-xl-5">
                <div class="col-lg-5 pb-5">
                    <div id="product-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner border">
                            <div class="carousel-item active">
                                <img class="w-100 h-100" src="${pageContext.request.contextPath}/fotos/${produtodetalhado.fotoProduto}"  alt="Image">
                            </div>
                            <div class="carousel-item">
                                <img class="w-100 h-100" src="${pageContext.request.contextPath}/fotos/${produtodetalhado.fotoProduto1}" alt="Image">
                            </div>
                            <div class="carousel-item">
                                <img class="w-100 h-100" src="${pageContext.request.contextPath}/fotos/${produtodetalhado.fotoProduto2}" alt="Image">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                            <i class="fa fa-2x fa-angle-left text-dark"></i>
                        </a>
                        <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                            <i class="fa fa-2x fa-angle-right text-dark"></i>
                        </a>
                    </div>
                </div>

                <div class="col-lg-7 pb-5">
                    <h3 class="font-weight-semi-bold">${produtodetalhado.nomeProduto}</h3>

                    <h3 class="font-weight-semi-bold mb-4">R$ ${produtodetalhado.precoProduto}</h3>
                    <p class="mb-4">${produtodetalhado.descricaoProduto}</p>
                    <div class="d-flex mb-3">
                    </div>

                    <div class="d-flex align-items-center mb-4 pt-2">
                        <c:choose>
                            <c:when test = "${influenciadorlogado != null}">

                                <a href="${pageContext.request.contextPath}/AlterarProduto?idProduto=${produtodetalhado.idProduto}" class="btn btn-primary px-3" style="background-color: #0c5460"><i class="fa fa-shopping-cart mr-1"></i> Adicionar ao Carrinho</a>
                            </c:when>
                            <c:otherwise>
                                <a href="Influenciador/gerenciarinfluenciador.jsp" class="btn btn-primary px-3" style="background-color: #000; outline: none; border: none;"><i class="fa fa-shopping-cart mr-1"></i> Registrar</a>
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <div class="d-flex pt-2">
                        <p class="text-dark font-weight-medium mb-0 mr-2">Compartilhe</p>
                        <div class="d-inline-flex">
                            <a class="text-dark px-2" href="">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a class="text-dark px-2" href="">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a class="text-dark px-2" href="">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a class="text-dark px-2" href="">
                                <i class="fab fa-pinterest"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row px-xl-5">
                <div class="col">
                    <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                        <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Descrição</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Informação</a>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab-pane-1">
                            <h4 class="mb-3">Descrição do Produto</h4>
                            <p>${produtodetalhado.descricaoProduto}</p>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-2">
                            <h4 class="mb-3">Informações Adicionais</h4>
                            <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                            <div class="row">
                                <div class="col-md-6">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item px-0">
                                            Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                        </li>
                                    </ul> 
                                </div>
                                <div class="col-md-6">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item px-0">
                                            Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                        </li>
                                    </ul> 
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>



        <jsp:include page="../footer.jsp"/>
    </body>
</html>
