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
        <script>
            $(document).ready(function () {
                $('#cpf').mask('000.000.000-00');
                $('#tel').mask('(00) 00000-0000');
                $('#cep').mask('00000-000');
            }
            );
        </script>
    </head>
    <body>


        <h1>Cadastrar Influenciador</h1><br><br>
        <div id="appCep">
            <form action="${pageContext.request.contextPath}/SalvarInfluenciador" method="post" enctype="multipart/form-data">

                <label>idInfluenciador: </label>
                <input type="hidden" name="idInfluenciador" value="${influenciador.idInfluenciador}">
                <br /><br />
                <label>nomeInfluenciador: </label>
                <input type="text" name="nomeInfluenciador" value="${influenciador.nomeInfluenciador}">
                <br /><br />
                <label>apelidoInfluenciador </label>
                <input type="text" name="apelidoInfluenciador" value="${influenciador.apelidoInfluenciador}" maxlength="10">
                <br /><br />
                <label>telInfluenciador: </label>
                <input type="text" name="telInfluenciador" value="${influenciador.telInfluenciador}" id="tel">
                <br /><br />
                <label>instaInfluenciador </label>
                <input type="text" name="instaInfluenciador" value="${influenciador.instaInfluenciador}">
                <br /><br />
                <label>tkInfluenciador </label>
                <input type="text" name="tkInfluenciador" value="${influenciador.tkInfluenciador}">
                <br /><br />
                <label>ytInfluenciador </label>
                <input type="text" name="ytInfluenciador" value="${influenciador.ytInfluenciador}">
                <br /><br />
                <label>faceInfluenciador </label>
                <input type="text" name="faceInfluenciador" value="${influenciador.faceInfluenciador}">
                <br /><br />
                <label>cpfInfluenciador </label>
                <input type="text" name="cpfInfluenciador" value="${influenciador.cpfInfluenciador}" id="cpf">
                <br /><br />
                <label>emailInfluenciador </label>
                <input type="text" name="emailInfluenciador" value="${influenciador.emailInfluenciador}">
                <br /><br />
                <label>senhaInfluenciador </label>
                <input type="text" name="senhaInfluenciador" value="${influenciador.senhaInfluenciador}" maxlength="20">
                <br /><br />
                <label>cepInfluenciador </label>
                <input type="text" name="cepInfluenciador" value="${influenciador.cepInfluenciador}" id="cep">
                <br /><br />
                <label>ruaInfluenciador </label>
                <input type="text" name="ruaInfluenciador" id="logradouro" value="${influenciador.ruaInfluenciador}">
                <br /><br />
                <label>numInfluenciador </label>
                <input type="text" name="numInfluenciador" value="${influenciador.numInfluenciador}" maxlength="5">
                <br /><br />
                <label>bairroInfluenciador </label>
                <input type="text" name="bairroInfluenciador" id="bairro" value="${influenciador.bairroInfluenciador}">
                <br /><br />
                <label>cidadeInfluenciador </label>
                <input type="text" name="cidadeInfluenciador" id="localidade" value="${influenciador.cidadeInfluenciador}">
                <br /><br />
                <label>estadoInfluenciador </label>
                <input type="text" name="estadoInfluenciador" id="uf" value="${influenciador.estadoInfluenciador}" maxlength="2">
                <br /><br />
                <label>fotoInfluenciador </label>
                <input type="file" name="fotoInfluenciador" value="${influenciador.fotoInfluenciador}" required>
                <br /><br />
                <label>descricaoInfluenciador </label>
                <input type="text" name="descricaoInfluenciador" value="${influenciador.descricaoInfluenciador}" >
                <br /><br />
                <input type="submit" value="Salvar">            
            </form>
        </div>
        <br><br>

        ${mensagem}
        <br><br>

        <table>
            <caption> Lista Influenciador </caption>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Senha</th>
                    <th>Apelido</th>
                    <th>Telefone</th>
                    <th>Descrição</th>
                    <th>Link Instagram</th>
                    <th>Link YouTube</th>
                    <th>Link TikTok</th>
                    <th>Link Facebook</th>
                    <th>CPF</th>
                    <th>Foto de Perfil</th>
                    <th>CEP</th>
                    <th>Rua</th>
                    <th>Número da Rua</th>
                    <th>Bairro</th>
                    <th>Estado</th>
                    <th>Cidade</th>
                    <th>Alterar</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listainfluenciador}" var="influenciador"> 
                    <tr>
                        <td>${influenciador.idInfluenciador}</td>
                        <td>${influenciador.nomeInfluenciador}</td>
                        <td>${influenciador.emailInfluenciador}</td>
                        <td>${influenciador.senhaInfluenciador}</td>
                        <td>${influenciador.apelidoInfluenciador}</td>
                        <td>${influenciador.telInfluenciador}</td>
                        <td>${influenciador.descricaoInfluenciador}</td>
                        <td>${influenciador.instaInfluenciador}</td>
                        <td>${influenciador.tkInfluenciador}</td>
                        <td>${influenciador.ytInfluenciador}</td>
                        <td>${influenciador.faceInfluenciador}</td>
                        <td>${influenciador.cpfInfluenciador}</td>
                        <td><img src="${pageContext.request.contextPath}/fotos/${influenciador.fotoInfluenciador}" width="75 px"></td>
                        <td>${influenciador.cepInfluenciador}</td>
                        <td>${influenciador.ruaInfluenciador}</td>
                        <td>${influenciador.numInfluenciador}</td>
                        <td>${influenciador.bairroInfluenciador}</td>
                        <td>${influenciador.estadoInfluenciador}</td>
                        <td>${influenciador.cidadeInfluenciador}</td>
                        <td><a href="${pageContext.request.contextPath}/CarregarInfluenciador?idInfluenciador=${influenciador.idInfluenciador}">Alterar</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <script src="${pageContext.request.contextPath}/Influenciador/cep2.js" type="text/javascript"></script>
    </body>
</html>
