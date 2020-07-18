<%@page import="Config.Conexion"%>
<%@page import="Config.Encriptar"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.mysql.jdbc.Connection"%>
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
            <form id="login-form" class="form" action="login.jsp" method="POST">
                <h3 class="text-center text-info">Ingrese</h3>
                <div class="form-group">
                    <label for="correo" class="text-info">Correo:</label><br>
                    <input type="text" name="correo" id="correo" 
                    class="form-control">
                </div>
                <div class="form-group">
                    <label for="password" class="text-info">Contraseña:</label><br>
                    <input type="password" name="pass" id="pass" 
                    class="form-control">
                </div>
                <div class="form-group">
                    <input type="submit" name="login" class="btn btn-info btn-md" 
                    value="Ingrese">
                    <a class="form-inline lg-0" href="cliente/principal.jsp">Recuperacion de Contraseña</a>
                </div>
            </form>
            <%
                
            %>
        </div>
        </div>
        </div>
        </div>
        </div>       
    </body>
</html>
