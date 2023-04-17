<%-- 
    Document   : navbar
    Created on : 17/11/2022, 07:03:16
    Author     : Vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Legacy</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Topbar Start -->
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
                    <a href="" class="btn border">
                        <i class="fas fa-heart text-info"></i>
                        <span class="badge">0</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/ListarProdutoCarrinho" class="btn border">
                        <i class="fas fa-shopping-cart text-info"></i>
                        <span class="badge">0</span>
                    </a>
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
                                <a href="${pageContext.request.contextPath}/ListarProduto" class="nav-item nav-link active">Home</a>
                                <a href="${pageContext.request.contextPath}/ListarLoja" class="nav-item nav-link">Produtos</a>
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
                                        <a href="${pageContext.request.contextPath}/Influenciador/homeinfluenciador.jsp" class="nav-item nav-link">${influenciadorlogado.nomeInfluenciador}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/Influenciador/logininfluenciador.jsp" class="nav-item nav-link">Login</a>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test = "${influenciadorlogado != null}">
                                        <a href="${pageContext.request.contextPath}/LogarInfluenciador?acao=logout" class="nav-item nav-link">Sair</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/Influenciador/gerenciarinfluenciador.jsp" class="nav-item nav-link">Registrar</a>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                </div>
            </div>
        </div>
    </nav>
    <a href="#" class="btn btn-info back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="${pageContext.request.contextPath}/mail/jqBootstrapValidation.min.js"></script>
    <script src="${pageContext.request.contextPath}/mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>



</body>
</html>
