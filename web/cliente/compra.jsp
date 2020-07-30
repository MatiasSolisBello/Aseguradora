<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="../include/headerCliente.jsp" %>
        <%
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String precio = request.getParameter("precio");
        %>
        <!--DISEÑO-->
        <div class="container p-4">
        <div class="row">
        <div class="col-md-4 mx-auto">
        <div class="card card-body">
            <!--FORMULARIO-->
            <form action="compra.jsp" method="POST">
                <div class="form-group">
                <h2 class="text-lg-center">Comprar Sguro</h2>
                <strong id="id" class="id"class="text-center">ID: <%= id%></strong><br>
                <strong  class="text-center">Nombre: <%= nombre%></strong><br>
                <strong class="text-center">Precio: <%= precio%></strong><br>
                <div class="form-group">
                    <p>INGRESE SU RUT PARA CONFIRMAR:</p>
                    <input type="text" name="rut" class="form-control" placeholder="Solo numeros">
                </div>
                <input type="submit" name="enviar" class="btn btn-success btn-block" value="COMPRAR">
                <input type="hidden" name="id" value="<%= id%>" >
            </form>
            </div>
        </div>
        </div>
        </div>
            
            
        <%
        if (request.getParameter("enviar") != null) {
            String rut = request.getParameter("rut");
            
            try {                    
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/aseguradora","root","");
                st=con.createStatement();
                st.executeUpdate("insert into venta (rut,seguro) values('"+rut+"','"+id+"');");
                request.getRequestDispatcher("MisSeguros.jsp").forward(request, response);
            } catch (Exception e) {
                 out.print(" <div class=\"alert alert-danger\" role=\"alert\"> RUT no valido, recarge la pagina </div>");
            }
        }
        %>
    </body>
</html>
