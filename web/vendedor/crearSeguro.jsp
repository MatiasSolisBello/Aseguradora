<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="../include/headerVendedor.jsp" %>  
        <div class="container h-50">
        <!-- ADD TASK FORM -->
        <div class="row h-50 justify-content-center align-items-center">
          <!--GUARDAR-->
          <form action="crearSeguro.jsp" method="POST">
          <br>
          <h1>Registre seguro</h1>
          <br>
            <div class="form-group">
                <input type="text" name="id" class="form-control" 
                placeholder="ID" autofocus required="required">
            </div>
            <div class="form-group">
                <input type="text" name="seguro" class="form-control" 
                placeholder="Nombres" autofocus required="required">
            </div>
            <div class="form-group">
                <input type="number" name="precio" class="form-control" 
                placeholder="Precio" autofocus required="required">
            </div>

            <div class="form-group">
              <input type="text" name="descripcion" class="form-control" 
                placeholder="Descripcion" autofocus required="required">
            </div>
            <input type="submit" name="enviar" class="btn btn-success btn-block" value="Guardar">
          </form>
        </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                String id = request.getParameter("id");
                String seguro = request.getParameter("seguro");
                String precio = request.getParameter("precio");
                String descripcion = request.getParameter("descripcion");
                try {
                    Connection con=null;
                    Statement st=null;
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/aseguradora","root","");
                    st=con.createStatement();
                    st.executeUpdate("insert into seguro (id,nombre,precio,descripcion) values('"+id+"','"+seguro+"','"+precio+"','"+descripcion+"');");
                    request.getRequestDispatcher("seguros.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
