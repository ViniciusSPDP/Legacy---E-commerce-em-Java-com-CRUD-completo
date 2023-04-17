<%-- 
    Document   : homeinfluenciador
    Created on : 18 de out de 2022, 10:59:46
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

    <head>
        <!-- Required meta tags -->
            <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/Influenciador/style.css">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

        <!-- Icon-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

        <title>${influenciador.nomeInfluenciador}</title>


        <link href="${pageContext.request.contextPath}/prelodear.css" rel="stylesheet" type="text/css"/>

    </head>

    <body class="body">

        <div id="preloader">
            <div class="inner">
                <!-- HTML DA ANIMAÇÃO MUITO LOUCA DO SEU PRELOADER! -->
                <div class="bolas">
                    <div></div>
                    <div></div>
                    <div></div>                    
                </div>
            </div>
        </div>

        <jsp:include page="../navbar.jsp"/>

        <!-- Nav-->
        <header>

        </header>

        <!-- Main-->
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-0 col-md-2"></div>
                    <div class="col-12 col-md-8">

                        <!-- Profile-->
                        <div class="container">
                            <div class="row" style="padding-top: 20px;">
                                <div class="col-3">
                                    <div class="imgBx">

                                        <img class="img-profile" src="${pageContext.request.contextPath}/fotos/${influenciador.fotoInfluenciador}" style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover;">
                                    </div>
                                </div>
                                <div class="col-7">
                                    <div class="row" style="padding-top: 20px; padding-bottom: 10px;">
                                        <div class="col-8 col-lg-5">
                                            <h2 class="username">${influenciador.apelidoInfluenciador}</h2>
                                        </div>
                                        <div class="col-2 col-lg-5"></div>

                                        <c:choose>
                                            <c:when test = "${influenciadorlogado.idInfluenciador == influenciador.idInfluenciador}">
                                                <div class="col-2 col-lg-5">
                                                    <a href="${pageContext.request.contextPath}/CarregarInfluenciadorPerfil?idInfluenciador=${influenciador.idInfluenciador}" style="color: black;" class="btn btn-outline-secondary button-edit">Editar perfil</a>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="col-2 col-lg-5"></div>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:choose>
                                            <c:when test = "${influenciadorlogado.idInfluenciador == influenciador.idInfluenciador}">
                                                <div class="col-2 col-lg-2">
                                                    <a href="${pageContext.request.contextPath}/DadosCampanha"><button type="button" style="color: black; " class="btn btn-outline-secondary button-edit" >Campanhas</button></a>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="col-2 col-lg-5"></div>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>


                                    <div class="row">
                                        <div class="col-12">
                                            <h1 class="name">${influenciador.nomeInfluenciador}</h1>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <p class="profile-desc">${influenciador.descricaoInfluenciador}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2"></div>
                            </div>
                        </div>

                        <!-- Stories-->


                        <!-- Line-->
                        <hr size="3" width="100%" color="#EEEEEE" style="margin: 0%;">

                        <!-- Nav-Feed-->
                        <ul class="nav nav-tabs nav-feed" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active nav-link-1" id="home-tab" data-bs-toggle="tab" href="#home" role="tab"
                                   aria-controls="home" aria-selected="true">Campanhas</a>
                            </li>

                            <li class="nav-item" role="presentation">
                                <a class="nav-link nav-link-2" id="profile-tab" data-bs-toggle="tab" href="#profile" role="tab"
                                   aria-controls="profile" aria-selected="false">Produtos</a>
                            </li>
                        </ul>

                        <!-- Card-Feed-->
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="row" style="padding-bottom: 25px;">
                                    <c:forEach items="${listacampanhainfluenciador}" var="campanha"> 
                                        <div class="col-4">
                                            <div class="card" style="margin-bottom: 40px;">
                                                ${campanha.nomeCampanha}
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>

                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">

                                <div class="row pb-3">

                                    <c:forEach items="${listaprodutoperfil}" var="produto">

                                        <div class="col-lg-4 col-md-6 col-sm-12 pb-1">

                                            <div class="card product-item border-0 mb-4">
                                                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                                    <img class="img-fluid w-100" src="${pageContext.request.contextPath}/fotos/${produto.fotoProduto}" alt="">
                                                </div>
                                                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                                    <h6 class="text-truncate mb-3">${produto.nomeProduto}</h6>
                                                    <div class="d-flex justify-content-center">
                                                        <h6>R$ ${produto.precoProduto}</h6><h6 class="text-muted ml-2"><del></del></h6>
                                                    </div>
                                                </div>
                                                <div class="card-footer d-flex justify-content-between bg-light border">
                                                    <a href="${pageContext.request.contextPath}/CarregarProduto?idprodutodetalhes=${produto.idProduto}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>Detalhes</a>


                                                    <c:choose>
                                                        <c:when test = "${influenciadorlogado != null}">
                                                            <a href="${pageContext.request.contextPath}/AlterarProduto?idProduto=${produto.idProduto}" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Carrinho</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a  class="btn btn-sm text-dark p-0" onclick="alert('Necessario Cadastro')"><i class="fas fa-shopping-cart text-info mr-1"></i>Carrinho</a>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-0 col-md-2"></div>
                </div>
            </div>
        </section>



        <script type="text/javascript">

            var crl = document.getElementById('myCrl').getContext('2d');

            crl.beginPath();
            crl.arc(60, 100, 40, 0, 2 * Math.PI);
            crl.fillStyle = '#00ACC1';
            crl.fill();
            crl.linewidth = 5;
            crl.strokeStyle = '#dbdbdb';
            crl.stroke();

            var crl1 = document.getElementById('myCrl1').getContext('2d');

            crl1.beginPath();
            crl1.arc(60, 100, 40, 0, 2 * Math.PI);
            crl1.fillStyle = '#F8BBD0';
            crl1.fill();
            crl1.linewidth = 5;
            crl1.strokeStyle = '#dbdbdb';
            crl1.stroke();

            var crl2 = document.getElementById('myCrl2').getContext('2d');

            crl2.beginPath();
            crl2.arc(60, 100, 40, 0, 2 * Math.PI);
            crl2.fillStyle = '#E91E63';
            crl2.fill();
            crl2.linewidth = 5;
            crl2.strokeStyle = '#dbdbdb';
            crl2.stroke();

        </script>


        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>


        <jsp:include page="../footer.jsp"/>
        <script src="${pageContext.request.contextPath}/preloder.js" type="text/javascript"></script>

    </body>

</html>