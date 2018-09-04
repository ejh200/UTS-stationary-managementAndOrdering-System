

<%@page import="uts.sep.Managers"%>
<%@page import="uts.sep.Manager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Successful</title>
        <!-- Bootstrap core CSS -->
        <link href="/assignment/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template -->
        <link href="/assignment/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
        <!-- Custom styles for this template -->
        <link href="/assignment/bootstrap/custom-css/clean-blog.min.css" rel="stylesheet">
    </head>
    <%  //JavaBean: Assign directory and file paths
        String directory = application.getRealPath("WEB-INF");
        String productsFilepath = "/products.xml";
        String managersFilepath = "/managers.xml";
    %>
    <jsp:useBean id="productApp" class="uts.sep.ProductApplication" scope="application">
        <jsp:setProperty name="productApp" property="directory" value="<%=directory%>"/>
        <jsp:setProperty name="productApp" property="productsFilepath" value="<%=productsFilepath%>"/>
        <jsp:setProperty name="productApp" property="managersFilepath" value="<%=managersFilepath%>"/>
    </jsp:useBean>

    <%  //Create new manager
        Manager manager = new Manager(username, name, email, password, dob);
        session.setAttribute("manager", manager);
        Managers managers = productApp.getManagers();
    %>
    <%! //Initliase values for new manager
        String username;
        String name;
        String email;
        String password;
        String dob;
                    %>
    <%  //Store values from user input
        username = request.getParameter("username");
        name = request.getParameter("name");
        email = request.getParameter("email");
        password = request.getParameter("password");
        dob = request.getParameter("dob");

    %>
    <% //Set new manager information
        manager.setName(name);
        manager.setUsername(username);
        manager.setEmail(email);
        manager.setPassword(password);
        manager.setDOB(dob);
    %>
    <body>
        <!-- Bootstrap navigation -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">Text Product Orders</a>
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
                            <a class="nav-link" href="register.jsp">Register</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Bootstrap header -->
        <header class="masthead" style="background-image: url('img/home-bg.jpg')">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="site-heading">
                            <h1>Registration Successful</h1>
                            <h2>User: <%=manager.getName()%> has been registered!</h2>
                            <span class="subheading"><a style="color: white !important;" href="index.jsp">Go To Main</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <h2>Registration Information</h2>
                    <table>
                        <!--Display information for new manager: -->
                        <tr><td>Name:</td><td><%=name%></td></tr>
                        <tr><td>Email:</td><td><%=email%></td></tr>
                        <tr><td>Password:</td><td><%=password%></td></tr>
                        <tr><td>Username:</td><td><%=username%></td></tr>
                        <tr><td>DOB:</td><td><%=dob%></td></tr>


                    </table>

                </div>
            </div>
        </div>





    </body>
</html>
