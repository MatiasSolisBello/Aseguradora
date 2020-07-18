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
        <%
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String precio = request.getParameter("precio");
            String descripcion = request.getParameter("descripcion");
        %>
        <div class="container h-50">
        <!-- ADD TASK FORM -->
        <div class="row h-50 justify-content-center align-items-center">
          <!--GUARDAR-->
          <form action="actSeguro.jsp" method="GET">
          <br>
          <h1>Actualize seguro</h1>
          <br>
            <div class="form-group">
                <input type="text" name="id" class="form-control" 
                placeholder="ID" value="<%= id%>" required="required">
            </div>
            <div class="form-group">
                <input type="text" name="nombre" class="form-control" 
                placeholder="Nombres" value="<%= nombre%>" required="required">
            </div>
            <div class="form-group">
                <input type="number" name="precio" class="form-control" 
                placeholder="Precio" value="<%= precio%>" required="required">
            </div>
            <div class="form-group">
                <input type="text" name="descripcion" class="form-control" 
                placeholder="Descripcion" value="<%= descripcion%>" required="required">
            </div>
            <input type="submit" name="enviar" class="btn btn-success btn-block" value="Guardar">
            <input type="hidden" name="id" value="<%= id%>" >
          </form>
        </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                try {
                    Connection con = null;
                    Statement st = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aseguradora","root","");
                    st = con.createStatement();
                    st.executeUpdate("update seguro set id='" + id + "',"
                            + " nombre='" + nombre + "',"
                            + "precio='" + precio + "',"
                            + "descripcion='" + descripcion + "' "
                            + "where id='"+id+"';");
                    request.getRequestDispatcher("seguros.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
