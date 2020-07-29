<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.Encriptar" %>
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
          <form id="theForm" action="crearUsuario.jsp" method="POST" onsubmit="return validateUsuario()">
          <br>
          <h1>Registre usuario</h1>
          <br>
            <div class="form-group">
                <p>RUN:</p>
                <input type="text" name="rut" class="form-control" 
                placeholder="Rut(Solo numeros, k reemplace por 1)" 
                autofocus required="required" minlength="9" maxlength="9">
            </div>
            <div class="form-group">
                <p>Nombre y Apellidos</p>
                <input type="text" name="nombre" class="form-control" 
                placeholder="Nombres" autofocus required="required">
            </div>
            <div class="form-group">
                <p>Correo:</p>
                <input type="email" name="correo" class="form-control" 
                placeholder="Correo" autofocus required="required">
            </div>

            <div class="form-group">
                <p>Contraseña:</p>
              <input type="password" name="password" class="form-control" 
                placeholder="Password (min. 8 caracteres)" autofocus required="required" minlength="8">
            </div>
            <input type="submit" name="enviar" class="btn btn-success btn-block" value="Guardar">
          </form>
        </div>
        </div>
        <%
            Encriptar enc=new Encriptar();
            if (request.getParameter("enviar") != null) {
                String rut = request.getParameter("rut");
                String nombre = request.getParameter("nombre");
                String correo = request.getParameter("correo");
                String password = request.getParameter("password");
                try {                    
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/aseguradora","root","");
                    st=con.createStatement();
                    st.executeUpdate("insert into cliente (rut,nombre,correo,pass) values('"+rut+"','"+nombre+"','"+correo+"','"+enc.getMD5(password)+"');");
                    request.getRequestDispatcher("clientes.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
