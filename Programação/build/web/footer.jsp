<%-- 
    Document   : footer
    Created on : 18/11/2022, 00:15:05
    Author     : Vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body style="overflow-x: hidden;">
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
                                <a class="text-dark mb-2" href="${pageContext.request.contextPath}/Instituicao/precadastro.jsp"><i class="fa fa-angle-right mr-2"></i>Pré-Cadastro</a>
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
    </body>
</html>
