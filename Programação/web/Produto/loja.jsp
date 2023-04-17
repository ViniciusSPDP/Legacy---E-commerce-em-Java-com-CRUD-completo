<%-- 
    Document   : loja
    Created on : 28/11/2022, 19:07:27
    Author     : Vinicius
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/prelodear.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="overflow-x: hidden;">
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




        <div class="container-fluid">
            <div class="row bg-secondary py-2 px-xl-5">
                <div class="col-lg-6 d-none d-lg-block">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-dark" href="${pageContext.request.contextPath}/ListarProduto">Home</a>
                        <span class="text-muted px-2">|</span>
                        <a class="text-dark" href="Instituicao/logarinstituicao.jsp">Instituição</a>

                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>

                        <a class="text-dark px-2" href="">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a class="text-dark pl-2" href="">
                            <i class="fab fa-youtube"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row align-items-center py-3 px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a href="" class="text-decoration-none">
                        <div><a href="${pageContext.request.contextPath}/ListarProduto" style="text-decoration:none"><h3 class="text-info"> <img class="" src="${pageContext.request.contextPath}/img/logo45.png"> Legacy</h3></a></div>

                    </a>
                </div>
                <div class="col-lg-6 col-6 text-left">

                </div>
                <div class="col-lg-3 col-6 text-right">
                    <c:choose>
                        <c:when test = "${influenciadorlogado != null}">
                            <a href="${pageContext.request.contextPath}/ListarProdutoCarrinho" class="btn">
                                <i class="fas fa-shopping-cart text-info"></i>
                                <span class="badge"></span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <i class="fas fa-shopping-cart text-info"></i>
                            <span class="badge"></span>
                        </c:otherwise>

                    </c:choose>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">


                </div>
                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">

                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="${pageContext.request.contextPath}/ListarProduto" class="nav-item nav-link">Home</a>
                                <a href="${pageContext.request.contextPath}/ListarLoja" class="nav-item nav-link active">Produtos</a>
                                <c:choose>
                                    <c:when test = "${influenciadorlogado != null}">
                                        <a href="${pageContext.request.contextPath}/ListarProdutoCarrinho" class="nav-item nav-link">Carrinho</a>
                                        <a href="${pageContext.request.contextPath}/DadosCampanha" class="nav-item nav-link">Campanha</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="" onclick="alert('Para prosseguir primeiro é necessario o cadastro')" class="nav-item nav-link">Carrinho</a>
                                        <a href="" onclick="alert('Para prosseguir primeiro é necessario o cadastro')" class="nav-item nav-link">Campanha</a>
                                    </c:otherwise>
                                </c:choose>
                                <a href="${pageContext.request.contextPath}/ListarInfluenciador" class="nav-item nav-link">Influenciadores</a>
                            </div>
                            <div class="navbar-nav ml-auto py-0">
                                <c:choose>
                                    <c:when test = "${influenciadorlogado != null}">
                                        <div>
                                            <img src="${pageContext.request.contextPath}/fotos/${influenciadorlogado.fotoInfluenciador}" style="width: 30px; height: 30px; border-radius: 50%; margin-top: 17px; object-fit: cover">
                                        </div>
                                        <a  href="${pageContext.request.contextPath}/CarregarInfluenciador?idinfluenciadordetalhes=${influenciadorlogado.idInfluenciador}" class="nav-item nav-link">${influenciadorlogado.nomeInfluenciador}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="Influenciador/logininfluenciador.jsp" class="nav-item nav-link">Login</a>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test = "${influenciadorlogado != null}">
                                        <a href="${pageContext.request.contextPath}/LogarInfluenciador?acao=logout" class="nav-item nav-link">Sair</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="Influenciador/gerenciarinfluenciador.jsp" class="nav-item nav-link">Registrar</a>
                                    </c:otherwise>
                                </c:choose>



                            </div>
                        </div>
                </div>
            </div>
        </div>

        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" style="height: 410px;">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/img/loja1.png" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h4 class="text-light text-uppercase font-weight-medium mb-3" style="font-size: 45px">loja</h4>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Shop Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <!-- Shop Sidebar Start -->

                <!-- Shop Sidebar End -->


                <!-- Shop Product Start -->
                <div class="col-lg-9 col-md-12">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <form action="">
                                    <div class="input-group">
                                        <input type="text" id="searchbar" onkeyup="pesquisar_produto()"  class="form-control" placeholder="Pesquise...">
                                        <div class="input-group-append">
                                            <span class="input-group-text bg-transparent text-primary">
                                                <i class="fa fa-search"></i>
                                            </span>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                        <c:forEach items="${listarloja}" var="produto">

                            <div class="col-lg-2 col-md-6 col-sm-6 pb-1 nomeproduto" id="list" style="list-style-type: none;">

                                <div class="card product-item border-0 mb-4" style="height: 350px;">
                                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0" style="">
                                        <div style="height: 350px;">
                                            <a href="${pageContext.request.contextPath}/CarregarProduto?idprodutodetalhes=${produto.idProduto}"><img class="img-fluid w-100" src="${pageContext.request.contextPath}/fotos/${produto.fotoProduto}" style="/*width: 100px; /* width of container */
                                                                                                                                                     /*height: 300px;*/ /* height of container */
                                                                                                                                                     object-fit: cover;
                                                                                                                                                     /*object-position: 20px 10px;*/
                                                                                                                                                     /* try 20% 10% */
                                                                                                                                                     /*border: 5px solid black;*/" alt=""><a/>
                                        </div>
                                    </div>
                                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3" style="">
                                        <h6 class="text-truncate mb-3">${produto.nomeProduto}</h6>
                                        <div class="d-flex justify-content-center">
                                            <h6 style="margin-bottom: 30px">R$ ${produto.precoProduto}</h6><h6 class="text-muted ml-2"><del></del></h6>
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
        <!-- Shop Product End -->
        <jsp:include page="../footer.jsp"/>


        <script>
            // JavaScript code
            function pesquisar_produto() {
                let input = document.getElementById('searchbar').value
                input = input.toLowerCase();
                let x = document.getElementsByClassName('nomeproduto');

                for (i = 0; i < x.length; i++) {
                    if (!x[i].innerHTML.toLowerCase().includes(input)) {
                        x[i].style.display = "none";
                    } else {
                        x[i].style.display = "list-item";
                    }
                }
            }
        </script>
        <script src="${pageContext.request.contextPath}/preloder.js" type="text/javascript"></script>

    </body>
</html>
