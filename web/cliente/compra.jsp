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
            String descripcion = request.getParameter("descripcion");
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
                <strong class="text-center">ID: <%= id%></strong><br>
                <strong name="seguro" class="text-center">Nombre: <%= nombre%></strong><br>
                <strong class="text-center">Precio: <%= precio%></strong><br>
                <strong class="text-center">Descripcion: <%= descripcion%></strong><br><br>
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
            String seguro = request.getParameter("seguro");
            try {                    
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/aseguradora","root","");
                st=con.createStatement();
                st.executeUpdate("insert into venta (id,rut,seguro) values('"+id+"','"+rut+"','"+seguro+"');");
                request.getRequestDispatcher("MisSeguros.jsp").forward(request, response);
            } catch (Exception e) {
                out.print(e);
            }
        }
        %>
    </body>
</html>
