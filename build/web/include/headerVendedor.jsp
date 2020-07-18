<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<%
    HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
        response.sendRedirect("../loginVendedor.jsp");
    }
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
%>

<nav class="navbar navbar-light" style="background-color: rgb(86, 61, 124);">
    <div class="container">
      <a class="navbar-brand" style="color:white" href="principal.jsp">BeLife</a>
      <!--MENU DE IZQUIERDA-->
      <form class="form-inline my-0 my-lg-0">
          <a href="clientes.jsp" style="color:white" class="navbar-brand">Clientes</a>
        <a href="seguros.jsp" style="color:white" class="navbar-brand">Seguros</a>
        <a href="compras.jsp" style="color:white" class="navbar-brand">Compras</a>
        <a href="logout.jsp" style="color:white" class="navbar-brand">Cerrar Sesion</a>
      </form>
    </div>
</nav>
