<!-- Re-usable JavaBean Class: -->
<% //Assign directory and file paths
    String directory = application.getRealPath("WEB-INF");
    String productsFilepath = "/products.xml";
    String managersFilepath = "/managers.xml";
    String ordersFilepath = "/orders.xml";
%>
<!-- ProductApplication.java as JavaBean productApp -->
<jsp:useBean id="productApp" class="uts.sep.ProductApplication" scope="application">
    <jsp:setProperty name="productApp" property="directory" value="<%=directory%>"/>
    <jsp:setProperty name="productApp" property="productsFilepath" value="<%=productsFilepath%>"/>
    <jsp:setProperty name="productApp" property="managersFilepath" value="<%=managersFilepath%>"/>
    <jsp:setProperty name="productApp" property="ordersFilepath" value="<%=ordersFilepath%>"/>
</jsp:useBean>