<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="../include/headerVendedor.jsp" %>     
        <form class="text-center border border-light p-2">
            <p class="h4 mb-4">Administrador de Usuarios</p>
            <div class="form-row mb-2">
                <div class="col">
                    <input id="entradafilter" type="text" class="form-control" placeholder="Filtrado">
                </div>
                <div>
                    <a href="crearUsuario.jsp" class="btn btn-success">Agregar Usuario</a>
                </div>
            </div>
        </form>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">RUN</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Correo</th>
                    <th scope="col">Pass</th>
                </tr>
            </thead>
            <tbody class="contenidobusqueda">
            <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aseguradora","root","");
                st = con.createStatement();
                rs = st.executeQuery("SELECT * FROM cliente;");
                while (rs.next()) {
            %>
            <tr>
                <th scope="row"><%= rs.getString(1)%></th>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td>
                        <!--BOTONES-->
                        <a href="actUsuario.jsp?rut=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&correo=<%= rs.getString(3)%>&password=<%= rs.getString(4)%>" class="btn btn-secondary">EDITAR
                        </a>
                        <a href="borrarUsuario.jsp?rut=<%= rs.getString(1)%>" class="btn btn-danger">ELIMINAR</a>
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
