<%-- 
    Document   : gerenciarinfluenciador
    Created on : 29 de set de 2022, 11:08:10
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="fisicacss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

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
                                <a href="${pageContext.request.contextPath}/ListarInfluenciador" class="nav-item nav-link">Influenciadores</a>
                            </div>
                            <div class="navbar-nav ml-auto py-0">
                                <c:choose>
                                    <c:when test = "${influenciadorlogado != null}">
                                        <div>
                                            <img src="${pageContext.request.contextPath}/fotos/${influenciadorlogado.fotoInfluenciador}" style="width: 30px; border-radius: 50%; margin-top: 17px;">
                                        </div>
                                        <a  href="${pageContext.request.contextPath}/CarregarInfluenciador?idinfluenciadordetalhes=${influenciadorlogado.idInfluenciador}" class="nav-item nav-link">${influenciadorlogado.nomeInfluenciador}</a>
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
                                        <a href="${pageContext.request.contextPath}/Influenciador/gerenciarinfluenciador.jsp" class="nav-item nav-link active">Registrar</a>
                                    </c:otherwise>
                                </c:choose>



                            </div>
                        </div>
                </div>
            </div>
        </div>




        <link href="${pageContext.request.contextPath}/Influenciador/csscadastrar.css" rel="stylesheet" type="text/css"/>







        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" style="height: 410px;">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/img/banner22.png" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h4 class="text-light text-uppercase font-weight-medium mb-3">Torne-se um Influenciador</h4>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <br><br>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>


        <script>
                                            $(document).ready(function () {
                                                $('#cpf').mask('000.000.000-00');
                                                $('#tel').mask('(00) 00000-0000');
                                                $('#cep').mask('00000-000');
                                            }
                                            );
        </script>
        <!-- Page Header End -->

        <form action="${pageContext.request.contextPath}/SalvarInfluenciador" method="post" enctype="multipart/form-data">
            <div class="input-data">
                <div class="form-row">



                    <div class="form-group col-md-2"> </div>
                    <div class="form-group col-md-6">

                        <input type="hidden" name="idInfluenciador"></label>
                        <input type="text" name="nomeInfluenciador" required class="form-control" id="inputEmail4">
                        <label for="inputEmail4">Nome Completo</label>
                    </div>
                    <div class="form-group col-md-2">
                        <input type="text" name="apelidoInfluenciador" maxlength="10" required class="form-control" id="inputPassword4">
                        <label for="inputPassword4">Apelido</label>

                    </div>
                    <div class="form-group col-md-2"> </div>



                    <div class="form-group col-md-2"> </div>
                    <div class="form-group col-md-4">
                        <%--<input type="text" class="form-control" name="telInfluenciador" class="form-control" id="tel">
                        --%>                  
                        <input type="text" name="telInfluenciador" required class="form-control" id="tel">
                        <label for="inputAddress">Telefone</label>
                    </div>
                    <div class="form-group col-md-4">
                        <input type="text" name="cpfInfluenciador" id="cpf" required="" class="form-control" >
                        <label for="inputAddress">CPF</label>

                    </div>

                    <div class="form-group col-md-2"> </div>


                    <div class="form-group col-md-2"> </div>
                    <div class="form-group col-md-8">
                        <input type="email" name="emailInfluenciador" required="" class="form-control">
                        <label for="inputAddress">Email</label>
                    </div>
                    <div class="form-group col-md-2"> </div>

                    <div class="form-group col-md-2"> </div>
                    <div class="form-group col-md-8">
                        <input type="password" name="senhaInfluenciador" required="" class="form-control" maxlength="20">
                        <label for="inputAddress">Senha</label>

                    </div>
                    <div class="form-group col-md-2"> </div>



                </div>

                <div class="form-row">
                    <div class="form-group col-md-12" style="">
                        <div class="container-fluid bg-primary mb-5 col-md-12" style="">
                            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 100px">
                                <p style="color: white; margin-top: 25px;"> REDES SOCIAIS<p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2"> </div>

                    <div class="col-md-2">
                        <label class="sr-only" for="inlineFormInputGroup">Instagram</label>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">@</div>
                            </div>
                            <input type="text" class="form-control" name="instaInfluenciador" id="inlineFormInputGroup" placeholder="Instagram">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label class="sr-only" for="inlineFormInputGroup">TikTok</label>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">@</div>
                            </div>
                            <input type="text" class="form-control"  name="tkInfluenciador" required="" id="inlineFormInputGroup" placeholder="TikTok">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label class="sr-only" for="inlineFormInputGroup">Youtube</label>
                        <div class="input-group mb-2">
                            <input type="text" class="form-control"  name="ytInfluenciador" required="" id="inlineFormInputGroup" placeholder="Link Canal Youtube">
                        </div>
                    </div>

                    <div class="col-md-2">
                        <label class="sr-only" for="inlineFormInputGroup">Facebook</label>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">@</div>
                            </div>
                            <input type="text" class="form-control"  name="faceInfluenciador" required="" id="inlineFormInputGroup" placeholder="Facebook">
                        </div>
                    </div>
                    <div class="col-md-2"> </div>

                </div>
                <br>

                <div class="form-row">
                    <div class="form-group col-md-12">
                        <div class="container-fluid bg-primary mb-5 col-md-12">
                            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 100px">
                                <p style="color: white; margin-top: 22px;">ENDEREÇO</p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-md-2"> </div>
                    <div class="form-group col-md-2">
                        <input type="text" name="cepInfluenciador" required class="form-control" id="cep">
                        <label for="inputAddress">CEP</label>

                    </div>
                    <div class="form-group col-md-6">
                        <input type="text" name="ruaInfluenciador" required class="form-control" id="logradouro">
                        <label for="inputAddress2">Endereço</label>

                    </div>
                    <div class="form-group col-md-2"></div>



                    <div class="form-group col-md-2"> </div>
                    <div class="form-group col-md-1">
                        <input type="text" name="numInfluenciador" required class="form-control" maxlength="5">
                        <label for="inputCity">Número</label>

                    </div>
                    <div class="form-group col-md-4">
                        <input type="text" name="bairroInfluenciador" required class="form-control" id="bairro">
                        <label for="barrito">Bairro</label>

                    </div>
                    <div class="form-group col-md-2">
                        <input type="text" name="cidadeInfluenciador" required class="form-control" id="localidade">
                        <label>Cidade</label>

                    </div>
                    <div class="form-group col-md-1">
                        <input type="text" name="estadoInfluenciador" required class="form-control" id="uf" maxlength="2">
                        <label>UF</label>

                    </div>
                    <div class="form-group col-md-2"> </div>




                    <div class="form-group col-md-2"> </div>


                    <div class="custom-file col-md-5">
                        <input type="file" name="fotoInfluenciador" class="custom-file-input" id="upload" required>
                        <label class="custom-file-label" for="validatedCustomFile">Escolha uma foto de perfil...</label>
                    </div>
                    <div class="form-group col-md-1"> </div>

                    <div class="form-group col-md-3"> 
                        <img id="img" style="width: 100px; height: 100px; object-fit: cover; border-radius: 50%;">
                    </div>
                    <div class="form-group col-md-1"> </div>


                    <div class="form-group col-md-2"> </div>



                    <div class="col-md-8">
                        <br>
                        <style>
                            .pink-textarea textarea.md-textarea:focus:not([readonly]) {
                                border-bottom: 1px solid #f48fb1;
                                box-shadow: 0 1px 0 0 #f48fb1;
                            }
                            .active-pink-textarea.md-form label.active {
                                color: #f48fb1;
                            }
                            .active-pink-textarea.md-form textarea.md-textarea:focus:not([readonly])+label {
                                color: #f48fb1;
                            }


                            .amber-textarea textarea.md-textarea:focus:not([readonly]) {
                                border-bottom: 1px solid #ffa000;
                                box-shadow: 0 1px 0 0 #ffa000;
                            }
                            .active-amber-textarea.md-form label.active {
                                color: #ffa000;
                            }
                            .active-amber-textarea.md-form textarea.md-textarea:focus:not([readonly])+label {
                                color: #ffa000;
                            }


                            .active-pink-textarea-2 textarea.md-textarea {
                                border-bottom: 1px solid #f48fb1;
                                box-shadow: 0 1px 0 0 #f48fb1;
                            }
                            .active-pink-textarea-2.md-form label.active {
                                color: #f48fb1;
                            }
                            .active-pink-textarea-2.md-form label {
                                color: #f48fb1;
                            }
                            .active-pink-textarea-2.md-form textarea.md-textarea:focus:not([readonly])+label {
                                color: #f48fb1;
                            }


                            .active-amber-textarea-2 textarea.md-textarea {
                                border-bottom: 1px solid #ffa000;
                                box-shadow: 0 1px 0 0 #ffa000;
                            }
                            .active-amber-textarea-2.md-form label.active {
                                color: #ffa000;
                            }
                            .active-amber-textarea-2.md-form label {
                                color: #ffa000;
                            }
                            .active-amber-textarea-2.md-form textarea.md-textarea:focus:not([readonly])+label {
                                color: #ffa000;
                            }
                        </style>

                        <div class="md-form mb-4 pink-textarea active-pink-textarea">
                            <textarea id="form18" maxlength="100" name="descricaoInfluenciador" class="md-textarea form-control" rows="3"></textarea>
                            <label for="form18">Digite uma descricao</label>
                        </div>
                    </div>

                    <div class="form-group col-md-2"> </div>

                    <div class="form-group col-md-2"> </div>

                    <div class="form-group col-md-2"> 

                        <button type="submit" class="btn btn-primary" style="color:whitesmoke">Register</button>

                    </div>

                    <div class="form-group col-md-2"> </div>

                    </form>
                </div>
            </div>

            <br><br>

            ${mensagem}
            <br><br>


            <a href="#" class="btn btn-info back-to-top"><i class="fa fa-angle-double-up"></i></a>


            <!-- JavaScript Libraries -->
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>

            <!-- Contact Javascript File -->
            <script src="${pageContext.request.contextPath}/mail/jqBootstrapValidation.min.js"></script>
            <script src="${pageContext.request.contextPath}/mail/contact.js"></script>

            <!-- Template Javascript -->
            <script src="${pageContext.request.contextPath}/js/main.js"></script>


            <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
            <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
            <script src="${pageContext.request.contextPath}/Influenciador/cep2.js" type="text/javascript"></script>
            <script src="${pageContext.request.contextPath}/Influenciador/influenciadorpreview.js" type="text/javascript"></script>

    </body>
</html>
