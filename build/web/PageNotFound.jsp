

<%@page import="uts.sep.Manager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>404 - Not Found</title>
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

        <%
            //Check if manager is logged in, display details if logged in
            Manager manager = (Manager) session.getAttribute("manager");
            String log;
            if (manager == null) {
                log = "You are not logged in";

            } else {
                log = manager.getName() + " &lt " + manager.getEmail() + " &gt";
            }
        %>

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

        <% }%>                
        <!-- Display fun image when page not found: -->
        <header class="masthead" style="background-image: url('img/home-bg.jpg')">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="site-heading">
                            <h1>404</h1>
                            <h2>Page Not Found</h2>
                            <span class="subheading"> / <a style="color: white !important;" href="index.jsp">Home</a> / Page Not Found / </span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <img src="img/spaceX.jpg" width="auto" height="auto">
                </div>
            </div>
        </div>

    </body>
</html>
