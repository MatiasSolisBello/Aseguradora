<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <form>
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
                </div>
            </div>
        </div>
        <a href="vendedor/principal.jsp" class="navbar-brand">Login</a>
        <%@ include file="include/footer.jsp" %> 
    </body>
    
</html>
