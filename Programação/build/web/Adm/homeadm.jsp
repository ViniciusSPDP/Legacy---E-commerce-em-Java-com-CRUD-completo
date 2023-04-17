<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Legacy - ADM</title>
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

        <link href="${pageContext.request.contextPath}/Adm/Influeciadores.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>
        <!-- Topbar Start -->

        <!-- Topbar End -->


        <!-- Navbar Start -->
        <jsp:include page="../navbar.jsp"/>
        <!-- Navbar End -->


        <!-- Page Header Start -->
        <br><br>
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h5 class="font-weight-semi-bold text-uppercase mb-3">#LegacyAdm</h5>
                <h3 class="font-weight-semi-bold text-uppercase mb-3">Seja bem vindo ${admlogado.nomeAdm}</h3>

                <div class="d-inline-flex">
                </div>
                <br>
                <a href="${pageContext.request.contextPath}/Instituicao/gerenciarinstituicao.jsp"> <button class="btn btn-info py-2 px-4">Cadastrar Instituição</button></a><br>
                <a href="${pageContext.request.contextPath}/ListarPreCadastro"> <button class="btn btn-info py-2 px-4">Aprovar Instituição</button></a>
            </div>
        </div>
        <!-- Page Header End -->




        <!-- Contact Start -->
        <div class="container-fluid pt-5">
            <div class="text-center mb-4">
                <h5 class="section-title px-5"><span class="px-2">Controle do Sistema - Produtos</span></h5>
            </div>
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
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>
        </div>

        <div class="container-fluid pt-5">
            <div class="text-center mb-4">
                <h5 class="section-title px-5"><span class="px-2">Controle do Sistema - Influenciadores</span></h5>
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
        </div>

        <!-- Contact Start -->  

        <!-- Contact End -->


        <!-- Footer Start -->
        <!-- Footer End -->


        <!-- Back to Top -->


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
    </body>

</html>