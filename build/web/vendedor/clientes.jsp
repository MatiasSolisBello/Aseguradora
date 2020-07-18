<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="../include/headerVendedor.jsp" %>          
        <form class="text-center border border-light p-2">
            <p class="h4 mb-4">Administrador de Usuarios</p>
            <div class="form-row mb-2">
                <div class="col">
                    <input id="entradafilter" type="text" class="form-control" placeholder="Filtrado">
                </div>
                <div>
                    <a href="crearUsuario.jsp" class="btn btn-success">Agregar Usuario</a>
                </div>
            </div>
        </form>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">RUN</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Correo</th>
                    <th scope="col">Pass</th>
                </tr>
            </thead>
            <tbody class="contenidobusqueda">
            <%
            
            %>
            </tbody>
        </table>
        <%@ include file="../include/footer.jsp" %> 
    </body>
</html>
