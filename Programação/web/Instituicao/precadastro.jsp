<%-- 
    Document   : gerenciarinstituicao
    Created on : 05/12/2022, 10:18:40
    Author     : Vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="overflow-x: hidden;">


        <jsp:include page="../navbar.jsp"/>
        <jsp:include page="../preloader.jsp"/>


        <link href="${pageContext.request.contextPath}/Influenciador/csscadastrar.css" rel="stylesheet" type="text/css"/>





        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>

        <script>
            $(document).ready(function () {
                $('#cpf').mask('000.000.000-00');
                $('#tel').mask('(00) 00000-0000');
                $('#cep').mask('00000-000');
                $('#cnpj').mask('00.000.000/0001-00');

            }
            );
        </script>


        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" style="height: 410px;">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/img/banner22.png" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h4 class="text-light text-uppercase font-weight-medium mb-3">Pre-Cadastro das Instituições</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br><br>

        <form action="${pageContext.request.contextPath}/PreCadastro" method="post" enctype="multipart/form-data">

            <div class="form-row">



                <div class="form-group col-md-2"> </div>
                <div class="form-group col-md-6">

                    <input type="hidden" name="idInstituicao"></label>
                    <input type="text" name="nomeInstituicao" required class="form-control" id="inputEmail4">
                    <label for="inputEmail4">Nome Instituicao</label>
                </div>
                <div class="form-group col-md-2">
                    <input type="text" name="telInstituicao" required class="form-control" id="tel">
                    <label for="inputPassword4">Telefone</label>

                </div>
                <div class="form-group col-md-2"> </div>



                <div class="form-group col-md-2"> </div>
                <div class="form-group col-md-8">         
                    <input type="text" name="cnpjInstituicao" required class="form-control" id="cnpj">
                    <label for="inputAddress">CNPJ</label>
                </div>
                <div class="form-group col-md-2"> </div>

                <div class="form-group col-md-2"> </div>

                <div class="form-group col-md-8">
                    <input type="password" name="senhaInstituicao" required="" class="form-control" >
                    <label for="inputAddress">Senha</label>

                </div>

                <div class="form-group col-md-2"> </div>

                <div class="form-group col-md-2"> </div>
                <div class="form-group col-md-2">
                    <input type="text" name="cepInstituicao" required class="form-control" id="cep">
                    <label for="inputAddress">CEP</label>

                </div>
                <div class="form-group col-md-6">
                    <input type="text" name="ruaInstituicao" required class="form-control" id="logradouro">
                    <label for="inputAddress2">Endereço</label>

                </div>
                <div class="form-group col-md-2"></div>



                <div class="form-group col-md-2"> </div>
                <div class="form-group col-md-1">
                    <input type="text" name="numInstituicao" required class="form-control" maxlength="5">
                    <label for="inputCity">Número</label>

                </div>
                <div class="form-group col-md-4">
                    <input type="text" name="bairroInstituicao" required class="form-control" id="bairro">
                    <label for="barrito">Bairro</label>

                </div>
                <div class="form-group col-md-2">
                    <input type="text" name="cidadeInstituicao" required class="form-control" id="localidade">
                    <label>Cidade</label>

                </div>
                <div class="form-group col-md-1">
                    <input type="text" name="estadoInstituicao" required class="form-control" id="uf" maxlength="2">
                    <label>UF</label>

                </div>
                <div class="form-group col-md-2"> </div>




                <div class="form-group col-md-2"> </div>


                <div class="custom-file col-md-5">
                    <input type="file" name="fotoInstituicao" class="custom-file-input" id="upload" required>
                    <label class="custom-file-label" for="validatedCustomFile">Escolha uma foto de perfil...</label>
                </div>
                <div class="form-group col-md-1"> </div>

                <div class="form-group col-md-3"> 
                    <img id="img" style="width: 100px; height: 100px; border-radius: 50%;">
                </div>
                <div class="form-group col-md-1"> </div>



                <div class="form-group col-md-2"> </div>

                <div class="form-group col-md-2"> 
                    <button type="submit" class="btn btn-primary" style="color:whitesmoke">Register</button>

                </div>

                <div class="form-group col-md-2"> </div>

        </form>



        <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <script src="${pageContext.request.contextPath}/Influenciador/cep2.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTw1AQgxVSNgt4=" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/Influenciador/influenciadorpreview.js" type="text/javascript"></script>





    </body>
</html>
