
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/csscamp.css" rel="stylesheet" type="text/css"/>
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
                        <div><a href="${pageContext.request.contextPath}/ListarProduto"><h3 class="text-info"> <img class="" src="img/logo45.png"> Legacy</h3></a></div>

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
                                        <a href="${pageContext.request.contextPath}/DadosCampanha" class="nav-item nav-link active">Campanha</a>
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
                    <img class="img-fluid" src="${pageContext.request.contextPath}/img/Campanha.png" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h4 class="text-light text-uppercase font-weight-medium mb-3" style="font-size: 45px">Campanha</h4>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <br><br>


        <form action="${pageContext.request.contextPath}/SalvarCampanha" method="POST">
            <div class="form-row">
                <div class="form-group col-md-2"> </div>
                <div class="form-group col-md-8">
                    <input type="hidden" name="idCampanha" value="${campanha.idCampanha}">
                    <label for="nomeCampanha">Nome </label>
                    <input type="text" name="nomeCampanha" style="" value="${campanha.nomeCampanha}" required class="form-control">
                </div>
                <div class="form-group col-md-2"> </div>

                <div class="form-group col-md-2"> </div>
                <div class="form-group col-md-8">
                    <div class="md-form mb-4 pink-textarea active-pink-textarea">
                        <label for="form18"> Digite uma descricao  </label>
                        <textarea id="form18" name="descricaoCampanha" value="${campanha.descricaoCampanha}" class="md-textarea form-control" rows="3"  value="${campanha.descricaoCampanha}"></textarea>
                    </div>
                </div>
                <div class="form-group col-md-2"> </div>

                <div class="form-group col-md-2"> </div>
                <div class="form-group col-md-2">
                    <input type="hidden" name="idInfluenciador" value="${id}">
                    <input type="submit"   value="Salvar" class="btn btn-primary" style="color:whitesmoke">    
                </div>
                <div class="form-group col-md-8"> </div>

                <div class="form-group col-md-2"> </div>
                <div class="form-group col-md-8">Para validar a campanha e necessario associar uma instituicao na campanha </div>

                <div class="form-group col-md-2"> </div>



            </div>
        </form>


        <br><br><br>

        <br><br>
        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" style="height: 410px;">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/img/Doacao.png" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h4 class="text-light text-uppercase font-weight-medium mb-3" style="font-size: 45px">Doações e Produtos</h4>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <link href="${pageContext.request.contextPath}/Campanha/csscamp.css" rel="stylesheet" type="text/css"/>


        <div class="container1">
            <c:forEach items="${listacampanhainfluenciador}" var="campanha"> 

                <div class="cartao">
                    <div class="caixa">
                        <div class="content">
                            <h2>${campanha.idCampanha}</h2>
                            <h3>${campanha.nomeCampanha}</h3>
                            <p>${campanha.descricaoCampanha}</p>
                            <a href="${pageContext.request.contextPath}/DadosProduto?idCampanha=${campanha.idCampanha}">Produtos</a>
                            <a href="${pageContext.request.contextPath}/DadosDoacao?idCampanha=${campanha.idCampanha}">Instituições</a>
                            <a href="${pageContext.request.contextPath}/CarregarCampanha?idCampanha=${campanha.idCampanha}">Alterar</a>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>



        <%--
        <table>
            <caption> Lista Campanha </caption>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>ID Influenciador</th>
                    <th>Nome Influenciador</th>
                    <th>Alterar</th>
                    <th>Instituições para Doação</th>
                    <th>Produtos da Campanha</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listacampanhainfluenciador}" var="campanha"> 
                    <tr>
                        <td>${campanha.idCampanha}</td>
                        <td>${campanha.nomeCampanha}</td>
                        <td>${campanha.descricaoCampanha}</td>
                        <td>${campanha.influenciador.idInfluenciador}</td>
                        <td>${campanha.influenciador.nomeInfluenciador}</td>
                        <td><a href="${pageContext.request.contextPath}/CarregarCampanha?idCampanha=${campanha.idCampanha}">Alterar</a></td>
                        <td><a href="${pageContext.request.contextPath}/DadosDoacao?idCampanha=${campanha.idCampanha}">Instituições</a></td>
                        <td><a href="${pageContext.request.contextPath}/DadosProduto?idCampanha=${campanha.idCampanha}">Produtos</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        --%>

        <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <jsp:include page="../footer.jsp"/>
        <script src="${pageContext.request.contextPath}/preloder.js" type="text/javascript"></script>

    </body>
</html>
