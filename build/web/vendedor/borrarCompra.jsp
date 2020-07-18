<%-- 
    Document   : borrarCompra
    Created on : 17-jul-2020, 21:59:01
    Author     : matia
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            Connection con = null;
            Statement st = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aseguradora","root","");
                st = con.createStatement();
                st.executeUpdate("delete FROM seguro where id='"+request.getParameter("id") +"';");
                request.getRequestDispatcher("compras.jsp").forward(request, response);
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
