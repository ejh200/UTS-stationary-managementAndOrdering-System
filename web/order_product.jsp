
<%@page import="java.net.URLEncoder"%>
<%@page import="uts.sep.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Product</title>
        <!-- Bootstrap core CSS -->
        <link href="/assignment/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template -->
        <link href="/assignment/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
        <!-- Custom styles for this template -->
        <link href="/assignment/bootstrap/custom-css/clean-blog.min.css" rel="stylesheet">
    </head>
    <%  //Carry Product ID from Reserve link and store in reserveID
        int reserveID = Integer.parseInt(request.getParameter("reserve"));
        ///JavaBean: Assign directory and file paths
        String directory = application.getRealPath("WEB-INF");
        String productsFilepath = "/products.xml";
        String managersFilepath = "/managers.xml";
        String ordersFilepath = "/orders.xml";
    %>
    <jsp:useBean id="productApp" class="uts.sep.ProductApplication" scope="application">
        <jsp:setProperty name="productApp" property="directory" value="<%=directory%>"/>
        <jsp:setProperty name="productApp" property="productsFilepath" value="<%=productsFilepath%>"/>
        <jsp:setProperty name="productApp" property="managersFilepath" value="<%=managersFilepath%>"/>
        <jsp:setProperty name="productApp" property="ordersFilepath" value="<%=ordersFilepath%>"/>
    </jsp:useBean>

    <body>

        <%
            //Retreive product by reserveID
            Products products = productApp.getProducts();
            Product product = products.getProductByID(reserveID);
            //Check if manager is logged in, display details if logged in
            Manager manager = (Manager) session.getAttribute("manager");
            String log;
            if (manager == null) {
                log = "You are not logged in";
            } else {
                log = manager.getName() + " &lt " + manager.getEmail() + " &gt";
            }
        %>
        <!-- Display form for users (not logged in) -->
        <%if (manager == null) {%>
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
                            <a class="nav-link" href="register.jsp">Manager Register</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Manager Log In</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <%} else {%>    

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
        <!-- Product Order Form: -->
        <header class="masthead" style="background-image: url('img/home-bg.jpg')">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="site-heading">
                            <h1>Reserve Product</h1>
                            <h2>Make a product order</h2>
                            <span class="subheading"> / <a style="color: white !important;" href="index.jsp">Main</a> / <a style="color: white !important;" href="index.jsp?<%=URLEncoder.encode(product.getTitle(), "UTF-8").replace(" ", "%20")%>">Product Details / <%=product.getTitle()%></a> / Reserve Product / </span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <form action="orderAction.jsp?reserve=<%=reserveID%>" method="post">
                        <table>
                            <tr><td>Name:</td><td><input type="name" name="user" required/></td></tr>
                            <tr><td>Email:</td><td><input type="email" name="email" required/></td></tr>
                            <tr><td></td><td><input type="submit" value="Reserve"/></td></tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
