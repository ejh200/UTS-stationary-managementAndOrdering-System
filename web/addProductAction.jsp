

<%@page import="uts.sep.Manager"%>
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
    %>
    <jsp:useBean id="productApp" class="uts.sep.ProductApplication" scope="application">
        <jsp:setProperty name="productApp" property="directory" value="<%=directory%>"/>
        <jsp:setProperty name="productApp" property="productsFilepath" value="<%=productsFilepath%>"/>
        <jsp:setProperty name="productApp" property="managersFilepath" value="<%=managersFilepath%>"/>
    </jsp:useBean>

    <%  //Create new product object
        Product product = new Product(id, productName, stock, price, description, managerusername);
        session.setAttribute("product", product);
        Products products = productApp.getProducts();
        Manager manager = (Manager) session.getAttribute("manager");
    %>
    <%! //Initalialise values
        int id;
        String productName;
        String stock;
        String price;
        String description;
        String managerusername;
    %>
    <%  //Store values from user input
        id = products.getNextProductID();
        productName = request.getParameter("productName");
        stock = request.getParameter("stock");
        price = request.getParameter("price");
        description = request.getParameter("description");
        managerusername = manager.getUsername();

    %>
    <%  //Set values for new product  
        product.setID(id);
        product.setProductName(productName);
        product.setStock(stock);
        product.setPrice(price);
        product.setDescription(description);
        product.setManager(managerusername);

    %>

    <body>
        <!--Add product to List of Products-->
        <% products.addProduct(product); %>
        <!--Update products.xml-->
        <% productApp.updateXML(); %>
        <!--Redirect back to main page-->
        <% response.sendRedirect("index.jsp");%>
    </body>
</html>
