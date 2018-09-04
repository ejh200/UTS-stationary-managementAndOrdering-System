
<%@page import="uts.sep.Products"%>

<%@page import="uts.sep.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stationary Store</title>
    </head>
    <%  //JavaBean: Assign directory and file paths
        String directory = application.getRealPath("WEB-INF");
        String productsFilepath = "/products.xml";
        String managersFilepath = "/managers.xml";
        String ordersFilepath = "/orders.xml";
        //Carry ID of product to be deleted
        int deleteID = Integer.parseInt(request.getParameter("delete"));
    %>
    <jsp:useBean id="productApp" class="uts.sep.ProductApplication" scope="application">
        <jsp:setProperty name="productApp" property="directory" value="<%=directory%>"/>
        <jsp:setProperty name="productApp" property="productsFilepath" value="<%=productsFilepath%>"/>
        <jsp:setProperty name="productApp" property="managersFilepath" value="<%=managersFilepath%>"/>
        <jsp:setProperty name="productApp" property="ordersFilepath" value="<%=ordersFilepath%>"/>
    </jsp:useBean>

    <%
        //Retreive product to be deleted by ID
        Products products = productApp.getProducts();
        Product product = products.getProductByID(deleteID);
        session.setAttribute("product", product);
    %>

    <body>

        <!-- Remove product from list of products-->
        <% products.removeProduct(product); %>
        <!-- Update products.xml -->
        <% productApp.updateXML();%>
        <!-- redirect back -->
        <% response.sendRedirect("index.jsp");%>

    </body>
</html>
