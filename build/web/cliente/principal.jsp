<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="../include/headerCliente.jsp" %>
        <h1>Bienvenido</i> <%= sesion.getAttribute("correo")%></a></h1>
    </body>
</html>
