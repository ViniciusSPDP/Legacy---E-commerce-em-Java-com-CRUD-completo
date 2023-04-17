<%-- 
    Document   : gerenciarinstituicao
    Created on : 14/10/2022, 04:56:38
    Author     : Vinicius
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

        <script>
            $(document).ready(function () {
                $('#cnpj').mask('00.000.000/0001-00');
                $('#tel').mask('(00) 00000-0000');
                $('#cep').mask('00000-000');
            }
            );
        </script>

    </head>
    <body style="overflow-x: hidden;">
        <c:choose>
            <c:when test="${sessionScope.admlogado !=null}">
                <h1>Cadastro da Instituicao</h1>
                <br>
                <form action="${pageContext.request.contextPath}/SalvarInstituicao" method="post" enctype="multipart/form-data">

                    <label>idInstituicao </label>
                    <input type="hidden" name="idInstituicao" value="${instituicao.idInstituicao}">
                    <br /><br />
                    <label>nomeInstituicao </label>
                    <input type="text" name="nomeInstituicao" value="${instituicao.nomeInstituicao}">
                    <br /><br />
                    <label>fotoInstituicao </label>
                    <input type="file" name="fotoInstituicao" value="${instituicao.fotoInstituicao}" required="">
                    <br /><br />
                    <label>telInstituicao </label>
                    <input type="text" name="telInstituicao" value="${instituicao.telInstituicao}" required="" id="tel">
                    <br /><br />
                    <label>cnpjInstituicao </label>
                    <input type="text" name="cnpjInstituicao" value="${instituicao.cnpjInstituicao}" id="cnpj">
                    <br /><br />
                    <label>senhaInstituicao </label>
                    <input type="text" name="senhaInstituicao" value="${instituicao.senhaInstituicao}">
                    <br /><br />
                    <label>cepInstituicao </label>
                    <input type="text" name="cepInstituicao" value="${instituicao.cepInstituicao}" id="cep">
                    <br /><br />
                    <label>ruaInstituicao </label>
                    <input type="text" name="ruaInstituicao" value="${instituicao.ruaInstituicao}">
                    <br /><br />
                    <label>bairroInstituicao </label>
                    <input type="text" name="bairroInstituicao" value="${instituicao.bairroInstituicao}">
                    <br /><br />
                    <label>cidadeInstituicao </label>
                    <input type="text" name="cidadeInstituicao" value="${instituicao.cidadeInstituicao}">
                    <br /><br />
                    <label>estadoInstituicao </label>
                    <input type="text" maxlength="2" name="estadoInstituicao" value="${instituicao.estadoInstituicao}">
                    <br /><br />
                    <label>numInstituicao </label>
                    <input type="text" maxlength="5" name="numInstituicao" value="${instituicao.numInstituicao}">
                    <br /><br />

                    <label>Adm: ${nome} com o id: </label>
                    <input type="number" value="${id}" name="idAdm">

                    <%--
                    <select name="idAdm">
                        <c:forEach items="${listaadm}" var="adm">
                            <option  value="${adm.idAdm}"${instituicao.adm.idAdm==adm.idAdm? 'selected':''}>
                                ${adm.nomeAdm}
                            </option>
                        </c:forEach>
                    </select>
                    <br />
                    --%>
                    <input type="submit" value="salvar">
                </form>
                <br><br>
                ${mensagem}
                <br><br>

                <table>
                    <caption> Lista Instituição </caption>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Status</th>
                            <th>Nome</th>
                            <th>Foto</th>
                            <th>Telefone</th>
                            <th>CNPJ</th>
                            <th>Senha</th>
                            <th>CEP</th>
                            <th>Rua</th>
                            <th>Bairro</th>
                            <th>Cidade</th>
                            <th>Estado</th>
                            <th>Numero</th>
                            <th>id Adm</th>
                            <th>nome Adm</th>
                            <th>Alterar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listainstituicao}" var="instituicao"> 
                            <tr>
                                <td>${instituicao.idInstituicao}</td>
                                <td>${instituicao.statusInstituicao}</td>
                                <td>${instituicao.nomeInstituicao}</td>
                                <td><img src="${pageContext.request.contextPath}/fotos/${instituicao.fotoInstituicao}" width="75 px"></td>
                                <td>${instituicao.telInstituicao}</td>
                                <td>${instituicao.cnpjInstituicao}</td>
                                <td>${instituicao.senhaInstituicao}</td>
                                <td>${instituicao.cepInstituicao}</td>
                                <td>${instituicao.ruaInstituicao}</td>
                                <td>${instituicao.bairroInstituicao}</td>
                                <td>${instituicao.cidadeInstituicao}</td>
                                <td>${instituicao.estadoInstituicao}</td>
                                <td>${instituicao.numInstituicao}</td>
                                <td>${instituicao.adm.idAdm}</td>
                                <td>${instituicao.adm.nomeAdm}</td>
                                <td><a href="${pageContext.request.contextPath}/CarregarInstituicao?idInstituicao=${instituicao.idInstituicao}">Alterar</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>


                <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
                <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
                <script src="${pageContext.request.contextPath}/Influenciador/cep2.js" type="text/javascript"></script>

                <script src="${pageContext.request.contextPath}/Instituicao/cep2.js" type="text/javascript"></script>
            </c:when>
            <c:otherwise>
                <!Redirecionar>
                <c:redirect url="../Adm/loginadm.jsp"></c:redirect>
            </c:otherwise>
        </c:choose>
</body>
</html>
