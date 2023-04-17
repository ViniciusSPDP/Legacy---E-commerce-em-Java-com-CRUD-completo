<%-- 
    Document   : preloader
    Created on : 05/12/2022, 17:33:17
    Author     : Vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        
        <script src="${pageContext.request.contextPath}/preloder.js" type="text/javascript"></script>
    </body>
</html>
