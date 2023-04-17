<%-- 
    Document   : index
    Created on : 15/11/2022, 03:41:06
    Author     : rocha
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
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/corte.css" rel="stylesheet" type="text/css"/>

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



        <!-- Topbar Start -->
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
                    <img class="img-fluid" src="img/banner2.png" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h4 class="text-light text-uppercase font-weight-medium mb-3">Moda Sustentável</h4>
                            <a href="ListarInfluenciador" class="btn btn-light py-2 px-3">Produtos</a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item" style="height: 410px;">
                    <img class="img-fluid" src="img/banner4.png" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h4 class="text-light text-uppercase font-weight-medium mb-3">Seja um</h4>
                            <h4 class="text-light text-uppercase font-weight-medium mb-3">#LegacyInfluencer</h4>

                            <a href="ListarInfluenciador" class="btn btn-light py-2 px-3">Registrar</a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item" style="height: 410px;">
                    <img class="img-fluid" src="img/banner7.png" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h4 class="text-light text-uppercase font-weight-medium mb-3">As melhores roupas</h4>
                            <h4 class="text-light text-uppercase font-weight-medium mb-3">#LegacyFashion</h4>



                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                <div class="btn btn-dark" style="width: 45px; height: 45px;">
                    <span class="carousel-control-prev-icon mb-n2"></span>
                </div>
            </a>
            <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                <div class="btn btn-dark" style="width: 45px; height: 45px;">
                    <span class="carousel-control-next-icon mb-n2"></span>
                </div>
            </a>
        </div>
    </div>
</div>
</div>
<!-- Navbar End -->


<!-- Featured Start -->

<!-- Featured End -->


<!-- Categories Start -->

<!-- Categories End -->


<!-- Offer Start -->

<!-- Offer End -->


<!-- Products Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h4 class="section-title px-5"><span class="px-2">Produtos</span></h4>
        <br>
    </div>
    <div class="row px-xl-5 pb-3">
        <c:forEach items="${listaproduto}" var="produto">

            <div class="col-lg-3 col-md-6 col-sm-12 pb-1" >
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <div style="width: 350px; /* width of container */
                             height: 450px;">
                            <a href="${pageContext.request.contextPath}/CarregarProduto?idprodutodetalhes=${produto.idProduto}"><img class="img-fluid w-100" id="cropped2" style=" /* width of container */
                                                                                                                                     height: 450px; /* height of container */
                                                                                                                                     object-fit: cover;
                                                                                                                                     /*object-position: 5px 10px;*/ /* try 20% 10% */
                                                                                                                                     /*border: 5px solid black;*/" src="${pageContext.request.contextPath}/fotos/${produto.fotoProduto}"></a>
                        </div>
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">${produto.nomeProduto}</h6>
                        <div class="d-flex justify-content-center">
                            <h6 id="preco">R$ ${produto.precoProduto}</h6>
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="${pageContext.request.contextPath}/CarregarProduto?idprodutodetalhes=${produto.idProduto}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-info mr-1"></i>Detalhes</a>


                        <c:choose>
                            <c:when test = "${influenciadorlogado != null}">
                                <a href="${pageContext.request.contextPath}/AlterarProduto?idProduto=${produto.idProduto}" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-info mr-1"></i>Add Carinho</a>
                            </c:when>
                            <c:otherwise>
                                <a  class="btn btn-sm text-dark p-0" onclick="alert('Necessario Cadastro')"><i class="fas fa-shopping-cart text-info mr-1"></i>Add Carinho</a>
                            </c:otherwise>
                        </c:choose>



                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</div>


<!-- Products End -->


<!-- Subscribe Start -->

<!-- Subscribe End -->


<!-- Products Start -->

<!-- Products End -->


<!-- Vendor Start -->

<!-- Vendor End -->


<!-- Footer Start -->
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


<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-info back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="mail/jqBootstrapValidation.min.js"></script>
<script src="mail/contact.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>

<!--Chat-->
<script type="text/javascript">(function (n, r, l, d) {
                                        try {
                                            var h = r.head || r.getElementsByTagName("head")[0], s = r.createElement("script");
                                            s.defer = true;
                                            s.setAttribute("type", "text/javascript");
                                            s.setAttribute("src", l);
                                            n.neuroleadId = d;
                                            h.appendChild(s);
                                        } catch (e) {
                                        }
                                    })(window, document, "https://cdn.leadster.com.br/neurolead/neurolead.min.js", 68821);</script> 


<script src="${pageContext.request.contextPath}/preloder.js" type="text/javascript"></script>
</body>

</html>