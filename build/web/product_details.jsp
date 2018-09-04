

<%@page import="uts.sep.Manager"%>
<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>


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
                            <h1>Product Details</h1>
                            <h2>Buy a Product</h2>
                            <span class="subheading">/ <a style="color: white !important;" href="index.jsp">Home</a> / Product Details / <%=request.getParameter("productName")%> </span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <%
            //String xml = "WEB-INF/products.xml";//application.getRealPath("./WEB-INF/products.xml");
            String xml = "http://localhost:8080/assignment/rest/productApp/products?productName=" + URLEncoder.encode(request.getParameter("productName"), "UTF-8").replace("+", "%20");
            String xsl = "WEB-INF/product_detail_user.xsl";//application.getRealPath("./WEB-INF/products.xsl");
        %>                

        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
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

    </body>
</html>
