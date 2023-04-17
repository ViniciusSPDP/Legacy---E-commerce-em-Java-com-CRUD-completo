<%-- 
    Document   : influenciadores
    Created on : 29/11/2022, 23:10:14
    Author     : Vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>



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

        <link href="${pageContext.request.contextPath}/Influenciador/Influeciadores.css" rel="stylesheet" type="text/css"/>
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
                                <a href="${pageContext.request.contextPath}/ListarInfluenciador" class="nav-item nav-link active">Influenciadores</a>
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
        <br><br>


        <div class="row pb-3">

            <c:forEach items="${listainfluenciador}" var="influenciador"> 
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">


                    <div class="cartao" style="margin-bottom: 70px; margin-left: 20px;">
                        <div class="imgBx">
                            <img src="${pageContext.request.contextPath}/fotos/${influenciador.fotoInfluenciador}" style="position: absolute;
                                 top: 0;
                                 left: 0;
                                 width: 100%;
                                 height: 100%;
                                 object-fit: cover;">
                        </div>

                        <div class="content">
                            <div class="detalhes">
                                <h2>${influenciador.apelidoInfluenciador}<br><span>${influenciador.nomeInfluenciador}</span></h2>

                                <div class="data">
                                    <h3>Instagram<br><span>@${influenciador.instaInfluenciador}</span></h3>
                                    <h3>TikTok<br><span>@${influenciador.tkInfluenciador}</span></h3>
                                    <h3>Facebook<br><span>@${influenciador.faceInfluenciador}</span></h3>
                                </div>

                                <div class="acaoBotao">
                                    <a  href="${pageContext.request.contextPath}/CarregarInfluenciador?idinfluenciadordetalhes=${influenciador.idInfluenciador}"><button>Detalhes</button></a>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>

        <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <a href="" class="text-decoration-none">
                        <h1 class="mb-4 display-5 font-weight-semi-bold">Legacy</h1>
                        <br>
                    </a>
                    <p>Loja virtual destinada a sustentabilidade e preservação da natureza.</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-info mr-3"></i>Rua 2 de março, Fernandópolis, BR</p>
                    <p class="mb-2"><i class="fa fa-envelope text-info mr-3"></i>legacy@legacy.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-info mr-3"></i>+55 99897-8451</p>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="${pageContext.request.contextPath}/ListarProduto"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="${pageContext.request.contextPath}/ListarLoja"><i class="fa fa-angle-right mr-2"></i>Produtos</a>
                                <a class="text-dark mb-2" href="${pageContext.request.contextPath}/ListarInfluenciador"><i class="fa fa-angle-right mr-2"></i>Influenciadores</a>

                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Links Adm</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="${pageContext.request.contextPath}/Adm/loginadm.jsp"><i class="fa fa-angle-right mr-2"></i>Login</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
                            <form action="">
                                <div class="form-group">
                                    <input type="text" class="form-control border-0 py-4" placeholder="Nome" required="required" />
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control border-0 py-4" placeholder="Email"
                                           required="required" />
                                </div>
                                <div>
                                    <button class="btn btn-info btn-block border-0 py-3" type="submit">Inscreva-se</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row border-top border-light mx-xl-5 py-4">
                <div class="col-md-6 px-xl-0">
                    <p class="mb-md-0 text-center text-md-left text-dark">
                        &copy; <a class="text-dark font-weight-semi-bold" href="#">Legacy</a>. All Rights Reserved.
                </div>

            </div>
        </div>




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
        <script src="${pageContext.request.contextPath}/preloder.js" type="text/javascript"></script>

    </body>
</html>
