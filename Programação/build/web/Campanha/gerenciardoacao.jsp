<%-- 
    Document   : gerenciarinstituicoescampanha
    Created on : 20 de out de 2022, 11:52:17
    Author     : Aluno
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="overflow-x: hidden;">
        <jsp:include page="../navbar.jsp"/>
        <br>


        <div class="form-row">

            <div class="form-group col-md-2"> </div>


            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Cadastro" style="color: white; border-radius: 4px; margin-bottom: 20px;">
                Cadastrar Instituições nessa campanha
            </button>

            <div class="form-group col-md-5" w-100> </div>



            <div class="form-group col-md-2"> </div>



            <div class="modal fade" id="Cadastro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Cadastrar Instituição</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="CadastrarDoacao" method="post">
                                <input type="hidden" value="" name="idDoacao">

                                <input type="hidden" value="${idCampanha}" name="idCampanha">     

                                <select name="idInstituicao">
                                    <c:forEach items="${listainstituicao}" var="instituicao">
                                        <option  value="${instituicao.idInstituicao}"${doacao.instituicao.idInstituicao==instituicao.idInstituicao? 'selected':''}>
                                            ${instituicao.nomeInstituicao}
                                        </option>
                                    </c:forEach>
                                </select>
                                <br>
                                <select name="porcentagemDoacao">
                                    <option value="0.10">10%</option>
                                    <option value="0.15">15%</option>
                                    <option value="0.20">20%</option>
                                    <option value="0.25">25%</option>
                                    <option value="0.30">30%</option>
                                    <option value="0.35">35%</option>
                                    <option value="0.40">40%</option>
                                    <option value="0.45">45%</option>
                                    <option value="0.50">50%</option>
                                </select>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                    <input type="submit" value="Cadastrar" class="btn btn-secondary">
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>

            <link href="${pageContext.request.contextPath}/Campanha/csscamp.css" rel="stylesheet" type="text/css"/>



            <div class="container1">
                <c:forEach items="${listadoacao}" var="doacao"> 

                    <div class="cartao">
                        <div class="caixa">
                            <div class="content">
                                <img src="${pageContext.request.contextPath}/fotos/${doacao.instituicao.fotoInstituicao}" style="border-radius: 50%" width="125px" height="125px">
                                <h2>${doacao.instituicao.idInstituicao}</h2>
                                <h3>${doacao.instituicao.nomeInstituicao}</h3>
                                <p>Porcentagem de Doacao</p>
                                <p class="porcentagem${doacao.instituicao.idInstituicao}"></p>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>

        </div>
        <jsp:include page="../footer.jsp"/>

        <script>
            <c:forEach items="${listadoacao}" var="doacao">
            var total = 100;
            var porcentagem = ${doacao.porcentagemDoacao};
            var conta = total * porcentagem;
            document.querySelector('.porcentagem${doacao.instituicao.idInstituicao}').innerHTML = conta + "%";
            </c:forEach>
        </script>  

    </body>
</html>
