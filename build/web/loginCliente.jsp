<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="Config.Encriptar" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <%@ include file="include/header_nologin.jsp" %>  
        <br><br><br><br>
        <div id="login">
        <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
        <div id="login-column" class="col-md-6">
        <div id="login-box" class="col-md-12">
            <form id="login-form" class="form" action="loginCliente.jsp" method="POST">
                <h3 class="text-center text-info">Ingrese</h3>
                <div class="form-group">
                    <label for="correo" class="text-info">Correo:</label><br>
                    <input type="text" name="correo" id="correo" 
                    class="form-control">
                </div>
                <div class="form-group">
                    <label for="password" class="text-info">Contraseña:</label><br>
                    <input type="password" name="password" id="password" 
                    class="form-control">
                </div>
                <div class="form-group">
                    <input type="submit" name="login" class="btn btn-info btn-md" 
                    value="Ingrese">
                </div>
            </form>
            <%
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;
                
                Encriptar enc=new Encriptar();
                if (request.getParameter("login") != null) {
                    String correo = request.getParameter("correo");
                    String password = request.getParameter("password");
                    HttpSession sesion = request.getSession();
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aseguradora","root","");
                        st = con.createStatement();
                        rs = st.executeQuery(" SELECT * FROM cliente where correo='" + correo + "' and pass='" + enc.getMD5(password) + "'; ");
                        while (rs.next()) {
                            sesion.setAttribute("logueado", "1");
                            sesion.setAttribute("correo", rs.getString("correo"));
                            sesion.setAttribute("rut", rs.getString("rut"));
                            response.sendRedirect("cliente/principal.jsp");
                        }
                        out.print(" <div class=\"alert alert-danger\" role=\"alert\"> Usuario no valido </div>");
                    } catch (Exception e) {
                    }
                }
            %>
        </div>
        </div>
        </div>
        </div>
        </div>       
    </body>
</html>