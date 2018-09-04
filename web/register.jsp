
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
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

        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="index.html">UTS Stationary Store</a>
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
                            <a class="nav-link" href="login.jsp">Log In</a>
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
                            <h1>Registration</h1>
                            <h2>Please enter your details to register</h2>
                            <span class="subheading"> / <a style="color: white !important;" href="index.jsp">Main</a> / Register / </span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <form action="registerAction.jsp" method="post">
                        <table> <!--Form to register new user: -->
                            <tr><td>Username: </td><td><input type="text" name="username"/></tr>
                            <tr><td>Name: </td><td><input type="text" name="name"/></tr>
                            <tr><td>Email:</td><td><input type="text" name="email"/></td></tr>
                            <tr><td>Password</td><td><input type="password" name="password"/></td></tr>
                            <tr><td>Date of Birth</td><td><input type="text" name="dob"/></td></tr>
                            <tr><td></td><td><input type="submit" value="Register"/></td></tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>


    </body>
</html>