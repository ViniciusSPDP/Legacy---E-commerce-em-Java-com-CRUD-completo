<%-- 
    Document   : itenscarrinho
    Created on : 17/11/2022, 07:10:57
    Author     : Vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrinho</title>
        <link href="${pageContext.request.contextPath}/prelodear.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
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
                                        <a href="${pageContext.request.contextPath}/ListarProdutoCarrinho" class="nav-item nav-link active">Carrinho</a>
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



        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Carrinho de Compras</h1>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Cart Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <div class="col-lg-8 table-responsive mb-5">
                    <table class="table table-bordered text-center mb-0">
                        <thead class="bg-secondary text-dark">
                            <tr>
                                <th>Produto</th>
                                <th>Nome</th>
                                <th>Campanha</th>
                                <th>Preço</th>
                                <th>Tempo</th>
                                <th>Remover</th>
                            </tr>
                        </thead>
                        <tbody class="align-middle">
                            <c:forEach items="${listaprodutocarrinho}" var="produto"> 
                                <tr>
                                    <td class="align-middle"><img src="${pageContext.request.contextPath}/fotos/${produto.fotoProduto}" alt="" style="width: 50px;"></td>
                                    <td class="align-middle">${produto.nomeProduto}</td>
                                    <td class="align-middle">${produto.campanha.nomeCampanha}</td>
                                    <td class="align-middle">R$ ${produto.precoProduto}</td>
                                    <td class="align-middle">${produto.tempousoProduto}</td>
                                    <td class="align-middle" style="outline: none; border-color: transparent;"><a href="${pageContext.request.contextPath}/RemoverProduto?idProduto=${produto.idProduto}" class="btn btn-sm btn-primary" style="background-color: whitesmoke; color: #000; outline: none; border-color: transparent;"><i class="fa fa-times"></i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4">


                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Total do Carrinho</h4>
                        </div>
                        <tbody>
                            <c:forEach items="${listaprodutocarrinho}" var="produto"> 
                            <div class="card-body">
                                <div class="d-flex justify-content-between mb-3 pt-1">
                                    <tr>
                                        <td><h6 class="font-weight-medium">${produto.nomeProduto}</h6></td>
                                        <td><h6 class="font-weight-medium">R$ ${produto.precoProduto}</h6></td>
                                    </tr>
                                </div>

                            </div>

                        </c:forEach>

                        </tbody>
                    </div>
                    <form action="${pageContext.request.contextPath}/FinalizarCarrinho" method="POST">
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total:</h5>
                                <h5> R$ <input type="number" step="0.01" class="valorTotal" name="valorTotal" readonly="" value="" style="width:100px; outline: none; border: none;"></h5>
                                <input type="hidden" value="${produto.carrinho.idCarrinho}">
                            </div>
                            <input type="submit" value="Finalizar Carrinho" class="btn btn-block btn-primary my-3 py-3" style="color: whitesmoke">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="container-fluid pt-12">
            <div class="row px-xl-5">
                <div class="col-lg-12 table-responsive mb-5">
                    <table class="table table-bordered text-center mb-0">
                        <caption style="text-transform: uppercase; text-align: center;">Instituiçoes que serao beneficiadas apos essa compra </caption>
                        <thead class="bg-secondary text-dark">
                            <tr>
                                <th>Campanha</th>
                                <th>Nome Instituição</th>
                                <th>Porcentagem</th>
                                <th>Total Doado</th>
                            </tr>
                        </thead>
                        <tbody class="align">
                            <c:forEach items="${listadoacao}" var="doacao"> 
                                <tr>
                                    <td class="align-middle">${doacao.campanha.nomeCampanha}</td>
                                    <td class="align-middle">${doacao.instituicao.nomeInstituicao}</td>
                                    <td class="align-middle">${doacao.porcentagemDoacao}</td>
                                    <td class="align-middle">${doacao.totaldoadoDoacao}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Cart End -->


        <!-- Footer Start -->


        <jsp:include page="../footer.jsp"/>
        <script>

            var valorCarrinho = 0;

            <c:forEach items="${listaprodutocarrinho}" var="produto">
            var preco = [${produto.precoProduto}];

            preco.forEach((preco, index) => {
                for (var i = 0; i <= index; i++) {
                    valorCarrinho += preco;
                }
                ;
            });
            </c:forEach>
            document.querySelector('.valorTotal').value = valorCarrinho;


            var totaldoado = valorCarrinho * 0.1;

            document.querySelector('.totaldoacaoCarrinho').value = totaldoado;

        </script>
        <script src="${pageContext.request.contextPath}/preloder.js" type="text/javascript"></script>

    </body>
</html>
