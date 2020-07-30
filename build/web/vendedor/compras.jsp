<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--Borramos elementos innecesarios para el pdf-->
        <style> 
            @media print{
                .col, .btn-reporte{
                    display:none;
                }
            }
        </style>
    </head>
    <body>
         <%@ include file="../include/headerVendedor.jsp" %>  
        
        <form class="text-center border border-light p-2">
            <p class="h4 mb-4">Administrador de Ventas</p>
            <div class="form-row mb-2">
                <div class="col">
                    <input id="entradafilter" type="text" class="form-control" placeholder="Filtrado">
                </div>
                <div class="btn-reporte">
                    <a href="#" onclick="print()" class="btn btn-success">GENERAR REPORTE</a>
                </div>
            </div>
        </form>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Cliente</th>
                    <th scope="col">Seguro</th>
                </tr>
            </thead>
            <tbody class="contenidobusqueda">
            <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aseguradora","root","");
                st = con.createStatement();
                rs = st.executeQuery("SELECT v.id, c.nombre, s.nombre FROM venta v INNER Join cliente c on c.rut = v.rut INNER JOIN seguro s on s.id = v.seguro;");
                while (rs.next()) {
            %>
            <tr>
                <th scope="row"><%= rs.getString(1)%></th>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    
                </tr>                                    
                <%
                    }
                    } catch (Exception e) {
                        out.print("error mysql " + e);
                    }
                %>
            </tbody>
        </table>
        <%@ include file="../include/footer.jsp" %> 
    </body>
</html>
