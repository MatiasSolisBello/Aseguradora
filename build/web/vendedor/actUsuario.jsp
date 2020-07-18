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
            String rut = request.getParameter("rut");
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String password = request.getParameter("password");
        %>
        <div class="container h-50">
        <!-- ADD TASK FORM -->
        <div class="row h-50 justify-content-center align-items-center">
          <!--GUARDAR-->
          <form action="actUsuario.jsp" method="GET">
          <br>
          <h1>Actualize Cliente</h1>
          <br>
            <div class="form-group">
                <input type="text" name="rut" class="form-control" 
                placeholder="RUN" value="<%= rut%>" required="required">
            </div>
            <div class="form-group">
                <input type="text" name="nombre" class="form-control" 
                placeholder="Nombres" value="<%= nombre%>" required="required">
            </div>
            <div class="form-group">
                <input type="email" name="correo" class="form-control" 
                placeholder="Correo" value="<%= correo%>" required="required">
            </div>

            <div class="form-group">
              <input type="password" name="password" class="form-control" 
                placeholder="Password" value="<%= password%>" required="required">
            </div>
            <input type="submit" name="enviar" class="btn btn-success btn-block" value="Guardar">
            <input type="hidden" name="rut" value="<%= rut%>" >
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
            st.executeUpdate("update cliente set rut='" + rut + "',"
                            + " nombre='" + nombre + "',"
                            + "correo='" + correo + "',"
                            + "pass='" + password + "' "
                            + "where rut='"+rut+"';");
            request.getRequestDispatcher("clientes.jsp").forward(request, response);
        } catch (Exception e) {
            out.print(e);
        }
        }
        %>
    </body>
</html>
