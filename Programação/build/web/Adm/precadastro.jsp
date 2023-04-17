<%-- 
    Document   : precadastro
    Created on : 05/12/2022, 18:55:20
    Author     : Vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="container-fluid pt-5">
            <div class="row px-xl-12">
                <div class="col-lg-12 table-responsive mb-12">
                    <table class="table table-bordered text-center mb-0">
                        <thead class="bg-secondary text-dark">
                            <tr>
                                <th>Foto</th>
                                <th>Nome</th>
                                <th>CNPJ</th>
                                <th>Telefone</th>
                                <th>CEP</th>
                                <th>Rua</th>
                                <th>Bairro</th>
                                <th>Cidade</th>
                                <th>Estado</th>
                                <th>Numero</th>
                                <th>Aprovar</th>
                            </tr>
                        </thead>
                        <tbody class="align-middle">
                            <c:forEach items="${precadastro}" var="instituicao"> 
                                <tr>
                                    <td class="align-middle"><img src="${pageContext.request.contextPath}/fotos/${instituicao.fotoInstituicao}" alt="" style="width: 50px;"></td>
                                    <td class="align-middle">${instituicao.nomeInstituicao}</td>
                                    <td class="align-middle">${instituicao.cnpjInstituicao}</td>
                                    <td class="align-middle">${instituicao.telInstituicao}</td>
                                    <td class="align-middle">${instituicao.cepInstituicao}</td>
                                    <td class="align-middle">${instituicao.ruaInstituicao}</td>
                                    <td class="align-middle">${instituicao.bairroInstituicao}</td>
                                    <td class="align-middle">${instituicao.cidadeInstituicao}</td>
                                    <td class="align-middle">${instituicao.estadoInstituicao}</td>
                                    <td class="align-middle">${instituicao.numInstituicao}</td>
                                    
                                    <td class="align-middle" style="outline: none; border-color: transparent;"><a href="${pageContext.request.contextPath}/Aprovar?idInstituicao=${instituicao.idInstituicao}" class="btn btn-sm btn-primary" style="background-color: whitesmoke; color: #000; outline: none; border-color: transparent;">Aprovar</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <jsp:include page="../footer.jsp"/>



    </body>
</html>
