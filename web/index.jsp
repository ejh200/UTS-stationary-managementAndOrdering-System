

<%@page import="java.net.URLEncoder"%>
<%@page import="uts.sep.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stationary Store</title>
        <!-- Bootstrap core CSS -->
        <link href="/assignment/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template -->
        <link href="/assignment/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
        <!-- Custom styles for this template -->
        <link href="/assignment/bootstrap/custom-css/clean-blog.min.css" rel="stylesheet">

    </head>
    <body>

        <%  //Check if manager is logged in, display details if logged in
            Manager manager = (Manager) session.getAttribute("manager");
            String log;
            if (manager == null) {
                log = "You are not logged in";

            } else {
                log = manager.getName() + " &lt " + manager.getEmail() + " &gt";
            }
        %>
         <!-- Run following when not logged in-->
        <%if (manager == null) {%>
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">UTS Stationary Store</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fa fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="registerX.jsp">Manager Registration</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Manager Login</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>

        <header class="masthead" style="background-image: url('img/home-bg.jpg')">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="site-heading">
                            <h1>Stationary</h1>
                            <h2>Available For Purchase</h2>
                            <span class="subheading"> / Home / </span>
                        </div>
                    </div>
                </div>
            </div>
        </header>


        <% //XML and XSL filepaths -- shows all products when user is not logged in
            String xml = "http://localhost:8080/assignment/rest/productApp/products?unique=true";//application.getRealPath("./WEB-INF/products.xml");
            String xsl = "WEB-INF/products.xsl";//application.getRealPath("./WEB-INF/products.xsl");
        %>


        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <!-- Replace the URL value with the location of movies.xml on your PC-->
                    <c:set var="xml" value="<%= xml%>"/>
                    <c:set var="xsl" value="<%= xsl%>"/>

                    <c:import url="${xml}" var="document" />

                    <!-- Replace the URL value with the location of movies.xsl on your PC-->
                    <c:import url="${xsl}" var="stylesheet" />


                    <!-- Transform xml inputDoc using stylesheet -->
                    <x:transform xml="${document}" xslt="${stylesheet}">        
                        <x:param name="bgColor"  value="lightgreen" />
                    </x:transform>
                </div>
            </div>
        </div>
        <!-- Run following when logged in: -->
        <%} else {%>    

        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">UTS Stationary Store</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fa fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Main</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Welcome, <%=log%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout.jsp">Logout</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>

        <header class="masthead" style="background-image: url('img/home-bg.jpg')">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="site-heading">
                            <h1>My Listed Products</h1>
                            <h2>Add or Remove Your Products</h2>
                            <span class="subheading"> / Home / </span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <% //XML and XSL filepaths -- when logged in, only shows products listed by logged in manager
            String xml = "http://localhost:8080/assignment/rest/productApp/products?username=" + URLEncoder.encode(manager.getUsername(), "UTF-8").replace("+", "%20");
            String xsl = "WEB-INF/product_detail.xsl"; //XSL displayed when logged in
        %>

        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <!-- Set XML and display XSL: -->
                    <c:set var="xml" value="<%= xml%>"/>
                    <c:set var="xsl" value="<%= xsl%>"/>
                    <!-- Import products.xml-->
                    <c:import url="${xml}" var="document" />

                    <!-- Import products.xsl-->
                    <c:import url="${xsl}" var="stylesheet" />

                    <!-- Transform xml inputDoc using stylesheet -->
                    <x:transform xml="${document}" xslt="${stylesheet}">        
                        <x:param name="bgColor"  value="lightgreen" />
                    </x:transform>

                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <h3>Add Product</h3>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <!-- For for Adding products: -->
                    <form action="addProductAction.jsp" method="post">
                        <table>
                            <tr><td>Product Name: </td><td><input type="text" name="productName"/></tr>
                            <tr><td>Description: </td><td><input type="text" name="description"/></tr>
                            <tr><td>Stock </td><td><input type="text" name="stock"/></td></tr>
                            <tr><td>Price </td><td><input type="text" name="price"/></td></tr>
                            <tr><td></td><td><input type="submit" value="Add Product To Store"/></td></tr>
                        </table>
                    </form>

                </div>
            </div>
        </div>

        <% }%>

    </body>
</html>