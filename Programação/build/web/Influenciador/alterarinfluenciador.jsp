<%-- 
    Document   : alterarinfluenciador
    Created on : 04/12/2022, 22:46:08
    Author     : Vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Influenciador/style.css">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

        <!-- Icon-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    </head>
    <body>

        <jsp:include page="../navbar.jsp"/>
        <jsp:include page="../preloader.jsp"/>


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

        <!-- Main-->
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-0 col-md-2"></div>
                    <div class="col-12 col-md-8">

                        <!-- Profile-->

                        <form action="${pageContext.request.contextPath}/SalvarInfluenciador" method="post" enctype="multipart/form-data">
                            <div class="container">
                                <div class="row" style="padding-top: 20px;">
                                    <div class="col-3">
                                        <div class="imgBx">
                                            <img type="file" id="img" name="fotoInfluenciador" class="img-profile" src="${pageContext.request.contextPath}/fotos/${influenciador.fotoInfluenciador}" style="width: 100px; height: 100px; border-radius: 50%;">
                                        </div>
                                    </div>
                                    <div class="col-7">
                                        <div class="row" style="padding-top: 20px; padding-bottom: 10px;">
                                            <div class="col-8 col-lg-5">
                                                <input type="text" name="apelidoInfluenciador" value="${influenciador.apelidoInfluenciador}" required class="form-control" id="inputEmail4">
                                                <label><h1 class="name">Apelido</h1></label>
                                            </div>
                                            <div class="col-2 col-lg-5">
                                                <input type="file" name="fotoInfluenciador" class="custom-file-input" id="upload" required>

                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-12">
                                                <input type="hidden" name="idInfluenciador" value="${influenciador.idInfluenciador}">
                                                <input type="text" name="nomeInfluenciador" value="${influenciador.nomeInfluenciador}" required class="form-control" id="inputEmail4">
                                                <label for="inputEmail4"><h1 class="name">Nome Completo</h1></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="text" name="descricaoInfluenciador" value="${influenciador.descricaoInfluenciador}" required class="form-control" id="inputEmail4">
                                                <label for="inputEmail4"><h1 class="name">Descricao</h1></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="text" name="telInfluenciador" value="${influenciador.telInfluenciador}" id="tel" required class="form-control" id="inputEmail4">
                                                <label for="inputEmail4"><h1 class="name">Telefone</h1></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="text" name="cpfInfluenciador" readonly="" value="${influenciador.cpfInfluenciador}" id="cpf" required class="form-control" id="inputEmail4">
                                                <label for="inputEmail4"><h1 class="name">CPF</h1></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="email" name="emailInfluenciador" readonly="" value="${influenciador.emailInfluenciador}" required class="form-control">
                                                <label for="inputEmail4"><h1 class="name">Email</h1></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="password" name="senhaInfluenciador" value="${influenciador.senhaInfluenciador}" required class="form-control">
                                                <label for="inputEmail4"><h1 class="name">Senha</h1></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <input type="text" name="instaInfluenciador" value="${influenciador.instaInfluenciador}" required class="form-control">
                                                <label for="inputEmail4"><h1 class="name">Instagram</h1></label>
                                            </div>
                                            <div class="col-3">
                                                <input type="text" name="faceInfluenciador" value="${influenciador.faceInfluenciador}" required class="form-control">
                                                <label for="inputEmail4"><h1 class="name">Facebook</h1></label>
                                            </div>
                                            <div class="col-3">
                                                <input type="text" name="ytInfluenciador" value="${influenciador.ytInfluenciador}" required class="form-control">
                                                <label for="inputEmail4"><h1 class="name">Youtube</h1></label>
                                            </div>
                                            <div class="col-3">
                                                <input type="text" name="tkInfluenciador" value="${influenciador.tkInfluenciador}" required class="form-control">
                                                <label for="inputEmail4"><h1 class="name">TikTok</h1></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <input type="text" name="cepInfluenciador" value="${influenciador.cepInfluenciador}" id="cep" required class="form-control">
                                                <label for="inputEmail4"><h1 class="name">CEP</h1></label>
                                            </div>
                                            <div class="col-6">
                                                <input type="text" name="ruaInfluenciador" id="logradouro" value="${influenciador.ruaInfluenciador}" required class="form-control">
                                                <label for="inputEmail4"><h1 class="name">Rua</h1></label>
                                            </div>
                                            <div class="col-3">
                                                <input type="text" name="numInfluenciador" value="${influenciador.numInfluenciador}" maxlength="5" required class="form-control">
                                                <label for="inputEmail4"><h1 class="name">Numero</h1></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="text" name="bairroInfluenciador" id="bairro" value="${influenciador.bairroInfluenciador}" required class="form-control">
                                                <label for="inputEmail4"><h1 class="name">Bairro</h1></label>
                                            </div>
                                            <div class="col-9">
                                                <input type="text" name="cidadeInfluenciador" id="localidade" value="${influenciador.cidadeInfluenciador}" required class="form-control">
                                                <label for="inputEmail4"><h1 class="name">Cidade</h1></label>
                                            </div>
                                            <div class="col-3">
                                                <input type="text" name="estadoInfluenciador" id="uf" value="${influenciador.estadoInfluenciador}" maxlength="2" class="form-control">
                                                <label for="inputEmail4"><h1 class="name">Estado</h1></label>
                                            </div>
                                            <div class="col-3"></div>

                                        </div>
                                    </div>
                                    <div class="col-2">

                                        <button type="submit" class="btn btn-primary" style="color:whitesmoke">Alterar</button>

                                    </div>




                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>                       
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTw1AQgxVSNgt4=" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/Influenciador/influenciadorpreview.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/Influenciador/cep2.js" type="text/javascript"></script>

    </body>
</html>
