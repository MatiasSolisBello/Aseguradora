<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="include/header_nologin.jsp" %> 
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form method="post" action="loginVendedor.jsp">
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" class="form-control" name="correo" placeholder="Humano pon tu usuario">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Humano pon tu password">
                        </div>
                        <button type="submit" class="btn btn-primary" name="login" >Login</button>
                    </form>
                    <%
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        if (request.getParameter("login") != null) {
                            String correo = request.getParameter("correo");
                            String password = request.getParameter("password");
                            HttpSession sesion = request.getSession();
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aseguradora","root","");
                                st = con.createStatement();
                                rs = st.executeQuery(" SELECT * FROM vendedor where correo='" + correo + "' and pass='" + password + "'; ");
                                while (rs.next()) {
                                    sesion.setAttribute("logueado", "1");
                                    sesion.setAttribute("correo", rs.getString("correo"));
                                    sesion.setAttribute("rut", rs.getString("rut"));
                                    response.sendRedirect("vendedor/principal.jsp");
                                }
                                out.print(" <div class=\"alert alert-danger\" role=\"alert\"> Usuario no valido </div>");
                            } catch (Exception e) {
                            }
                        }
                    %>
                </div>
            </div>
        </div>
        <%@ include file="include/footer.jsp" %> 
    </body>
</html>
