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
        <div class="row h-50 justify-content-center align-items-center">
        <form action="crearVenta.jsp" method="POST">
            <br>
            <h1>Registre Venta</h1>
            <br>
            <input type="submit" name="enviar" class="btn btn-success btn-block" value="Guardar">
        </form>
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
                st.executeUpdate("insert into venta (rut, seguro) values('"+rut+"','"+seguro+"');");
                request.getRequestDispatcher("clientes.jsp").forward(request, response);
            } catch (Exception e) {
                out.print(e);
            }
        }
        %>
    </body>
</html>
