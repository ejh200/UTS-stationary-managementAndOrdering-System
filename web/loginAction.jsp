

<%@page import="uts.sep.User"%>
<%@page import="uts.sep.Users"%>
<%@page import="uts.sep.Manager"%>
<%@page import="uts.sep.Managers"%>
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
    <body>
        <%  //Retrieve values for email and password entered by user
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            //If email and password match, retrieve details of logged in user
            if (productApp.loginMatches(email, password)) {
                Managers managers = productApp.getManagers();
                Manager manager = managers.login(email, password);
                session.setAttribute("manager", manager);
        %> 
        <!-- Redirect back to main page -->
        <% response.sendRedirect("index.jsp"); %>
        <%} else {%>
        <p>Password incorrect. Click <a href="login.jsp"><u>here</u></a> to try again.</p>
                    <% }%>
    </body> 
</html>
