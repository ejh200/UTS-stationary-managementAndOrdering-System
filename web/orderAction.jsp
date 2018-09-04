
<%@page import="uts.sep.*"%>
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
    <%  //Carry ID of product to be reserved
        int reserveID = Integer.parseInt(request.getParameter("reserve"));
        //JavaBean: Assign directory and file paths
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

    <%
        //Retreive product to be reserved
        Products products = productApp.getProducts();
        Product product = products.getProductByID(reserveID);
        session.setAttribute("product", product);
        Manager manager = (Manager) session.getAttribute("manager");
        //Create new order
        Orders orders = productApp.getOrders();
        Order order = new Order(id, productID, title, user, email, managerusername);
    %>
    <%! ///Initliase values for new order
        int id;
        int productID;
        String title;
        String user;
        String email;
        String managerusername;
                    %>
    <% //Set new order information
        id = orders.getNextOrderID();
        productID = product.getID();
        title = product.getTitle();
        user = request.getParameter("user");
        email = request.getParameter("email");
        managerusername = product.getManager();
    %>
    <%  //Set new order information
        order.setId(id);
        order.setProductID(productID);
        order.setTitle(title);
        order.setUser(user);
        order.setEmail(email);
        order.setManagerusername(managerusername);

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
                            <h1>Order Successful</h1>
                            <h2>Product: <%=product.getProductName()%> has been reserved!</h2>
                            <span class="subheading"><a style="color: white !important;" href="index.jsp">Go To Main</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <h2>Order Information</h2>
                    <table>
                        <tr><td>Order ID:</td><td><%=order.getId()%></td></tr>
                        <tr><td>Title:</td><td><%=product.getProductName()%></td></tr>
                        <tr><td>Name:</td><td><%=order.getUser()%></td></tr>
                        <tr><td>Email:</td><td><%=order.getEmail()%></td></tr>
                        <tr><td>Manager:</td><td><%=order.getManagerusername()%></td></tr>
                    </table>

                </div>
            </div>
        </div>

        <!--Add order to  list of orders-->
        <% orders.addOrder(order); %>
        <!--Set status to Reserved-->
        <% product.setStatus("Reserved"); %>
        <!-- Update orders.xml-->
        <% productApp.updateXML();%>

    </body>
</html>

