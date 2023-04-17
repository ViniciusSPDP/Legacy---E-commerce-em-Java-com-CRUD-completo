<%-- 
    Document   : gerenciarproduto
    Created on : 19/10/2022, 18:56:21
    Author     : Vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            input[type=text] {
                width: 30%;
                -webkit-transition: width 0.15s ease-in-out;
                transition: width 0.15s ease-in-out;
            }

            /* When the input field gets focus,
                 change its width to 100% */
            input[type=text]:focus {
                width: 70%;
            }

        </style>
    </head>
    <body style="overflow-x: hidden;">     

        <jsp:include page="../navbar.jsp"/>
        <jsp:include page="../preloader.jsp"/>





        <link href="${pageContext.request.contextPath}/Influenciador/csscadastrar.css" rel="stylesheet" type="text/css"/>

        <br><br>
        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" style="height: 410px;">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/img/Produtos.png" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h4 class="text-light text-uppercase font-weight-medium mb-3">Vender Produtos</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br><br>




        <form action="${pageContext.request.contextPath}/SalvarProduto" method="post" enctype="multipart/form-data">
            <div class="form-row">

                <div class="form-group col-md-2"> </div>

                <div class="form-group col-md-5">
                    <input type="hidden" name="idProduto" value="">
                    <input type="text" name="nomeProduto" required class="form-control" value="">
                    <label>Nome do Produto</label>
                </div>
                <div class="form-group col-md-3">
                    <input type="text" name="tempousoProduto" required class="form-control" value="">
                    <label>Tempo de Uso</label>
                </div>
                <div class="form-group col-md-2"> </div>

                <div class="form-group col-md-2"> </div>


                <div class="custom-file col-md-5">
                    <input type="file" name="fotoProduto" class="custom-file-input" id="upload" required>
                    <label class="custom-file-label" for="validatedCustomFile">Escolha a foto principal do produto...</label>
                </div>
                <div class="form-group col-md-1"> </div>

                <div class="form-group col-md-2"> 
                    <img id="img" style="width: 100px; height: 100px; border-radius: 10px; object-fit: cover;">
                </div>
                <div class="form-group col-md-2"> </div>






                <div class="form-group col-md-2"> </div>

                <div class="custom-file col-md-5">
                    <input type="file" name="fotoProduto1" class="custom-file-input" id="upload2" required>
                    <label class="custom-file-label" for="validatedCustomFile">Escolha a 2 foto do produto...</label>
                </div>
                <div class="form-group col-md-1"> </div>

                <div class="form-group col-md-2"> 
                    <img id="img2" style="width: 100px; height: 100px; border-radius: 10px; object-fit: cover;">
                </div>
                <div class="form-group col-md-2"> </div>


                <div class="form-group col-md-2"> </div>
                <div class="custom-file col-md-5">
                    <input type="file" name="fotoProduto2" class="custom-file-input" id="upload3" required>
                    <label class="custom-file-label" for="validatedCustomFile">Escolha a ultima foto do produto...</label>
                </div>
                <div class="form-group col-md-1"> </div>

                <div class="form-group col-md-2"> 
                    <img id="img3" style="width: 100px; height: 100px; border-radius: 10px; object-fit: cover;">
                </div>
                <div class="form-group col-md-2"> </div>





                <div class="form-group col-md-2"> </div>

                <div class="form-group col-md-8">
                    <input type="number" name="precoProduto" required class="form-control" step="0.01">
                    <label>Preço </label>
                </div>

                <div class="form-group col-md-2"> </div>



                <div class="col-md-2"></div>

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
                        <textarea id="form18" maxlength="100" name="descricaoProduto" class="md-textarea form-control" rows="3"></textarea>
                        <label for="form18">Digite uma descricao ao Produto...</label>
                    </div>
                </div>
                <div class="col-md-2"></div>


                <div class="col-md-2"></div>
                <div class="col-md-3">

                    <input type="hidden" name="idCampanha" value="${idCampanha}">
                    <input type="submit" class="btn btn-primary" style="color:whitesmoke; border-radius: 5px;" value="salvar">

                </div>

                <div class="col-md-5">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Produtos" style="color: white; border-radius: 4px;">
                        Mostrar produtos desta campanha
                    </button>

                </div>
                <div class="col-md-2"></div>

        </form>
        <br><br>
        ${mensagem}
        <br><br>
    </div>


    <div class="modal fade" id="Produtos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Produtos desta Campanha</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-lg-9 col-md-12">
                        <div class="row pb-3">
                            <div class="col-12 pb-1">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <form action="">
                                        <div class="input-group">
                                            <input type="text" id="searchbar" onkeyup="pesquisar_produto()" class="form-control" placeholder="Pesquise...">
                                            <div class="input-group-append">
                                                <span class="input-group-text bg-transparent text-primary">
                                                    <i class="fa fa-search"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                            <c:forEach items="${listarprodutocampanha}" var="produto"> 

                                <div class="col-lg-2 col-md-6 col-sm-6 pb-1 nomeproduto"  id="list" style="margin-right: 55px; margin-left: 35px; list-style-type: none;">

                                    <div class="card product-item border-0 mb-4" style="width: 150px;">
                                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0" style="">
                                            <div style="">
                                                <a href="${pageContext.request.contextPath}/CarregarProduto?idprodutodetalhes=${produto.idProduto}"><img class="img-fluid w-100" src="${pageContext.request.contextPath}/fotos/${produto.fotoProduto}" style="/*width: 100px; /* width of container */
                                                                                                                                                         /*height: 300px;*/ /* height of container */
                                                                                                                                                         object-fit: cover;
                                                                                                                                                         /*object-position: 20px 10px;*/
                                                                                                                                                         /* try 20% 10% */
                                                                                                                                                         /*border: 5px solid black;*/" alt=""><a/>
                                            </div>
                                        </div>
                                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3"  style="">
                                            <h6 class="text-truncate mb-3">${produto.nomeProduto}</h6>
                                            <div class="d-flex justify-content-center">
                                                <h6 style="margin-bottom: 20px">R$ ${produto.precoProduto}</h6><h6 class="text-muted ml-2"><del></del></h6>
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
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <%--
                <table>

                <caption> Lista Produto </caption>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Preco</th>
                        <th>tempousoProdut</th>
                        <th>fotoProduto</th>
                        <th>fotoProduto1</th>
                        <th>fotoProduto2</th>
                        <th>idCampanha</th>
                        <th>Nome Campanha</th>
                        <th>Detalhes</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listarprodutocampanha}" var="produto"> 
                        <tr>
                            <td>${produto.idProduto}</td>
                            <td>${produto.nomeProduto}</td>
                            <td>${produto.descricaoProduto}</td>
                            <td>${produto.precoProduto}</td>
                            <td>${produto.tempousoProduto}</td>
                            <td>${produto.fotoProduto}</td>
                            <td>${produto.fotoProduto1}</td>
                            <td>${produto.fotoProduto2}</td>
                            <td>${produto.campanha.idCampanha}</td>
                            <td>${produto.campanha.nomeCampanha}</td>
                            <td><a href="${pageContext.request.contextPath}/CarregarProduto?idprodutodetalhes=${produto.idProduto}"/>Detalhes</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
    --%>



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
    <script src="${pageContext.request.contextPath}/Produto/previewimg.js" type="text/javascript"></script>
</body>
</html>
