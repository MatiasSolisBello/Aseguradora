<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
        
        <form class="text-center border border-light p-2">
            <p class="h4 mb-4">Administrador de mis Seguros</p>
            <div class="form-row mb-2">
                <div class="col">
                    <input id="entradafilter" type="text" class="form-control" placeholder="Filtrado">
                </div>
               
            </div>
        </form>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Seguro</th>
                    <th scope="col">Acciones</th>
                </tr>
            </thead>
            <tbody class="contenidobusqueda">
            <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aseguradora","root","");
                st = con.createStatement();
                rs = st.executeQuery("SELECT v.id, c.nombre, s.nombre "
                        + "FROM venta v INNER Join cliente c on c.rut = v.rut "
                        + "INNER JOIN seguro s on s.id = v.seguro  "
                        + "WHERE correo='" + sesion.getAttribute("correo") + "';");
                while (rs.next()) {
            %>
            <tr>
                <th scope="row"><%= rs.getString(1)%></th>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td>
                        <!--BOTONES-->
                        <a href="#" class="btn btn-danger">ELIMINAR SEGURO</a>
                    </td>
                </tr>                                    
                <%
                        }
                    } 
                    catch (Exception e) {
                        out.print("error mysql "+e);
                    }
                %>
            </tbody>
        </table>
        <%@ include file="../include/footer.jsp" %> 
    </body>
</html>
