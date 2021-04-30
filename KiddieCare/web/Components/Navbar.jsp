<%-- 
    Document   : Navbar
    Created on : Mar 29, 2021, 5:06:22 AM
    Author     : Senani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <jsp:include page="Links/Links.jsp"/>
 <style>
     a{color: white}
     .navbar{
         background-color: blueviolet;
     }
 </style>

<div class="bs-example">
    <nav class="navbar navbar-expand-md  ">
        <a href="#" class="navbar-brand">Kiddie Care</a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span style="color: black" class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav">
                <a href="#" class="nav-item nav-link active">Home</a>
            </div>
            <div class="navbar-nav ml-auto">
                <a href="<%= request.getContextPath()%>/UserPanel/Login.jsp" class="nav-item nav-link">Login</a>
            </div>
        </div>
    </nav>
</div>

</html>
