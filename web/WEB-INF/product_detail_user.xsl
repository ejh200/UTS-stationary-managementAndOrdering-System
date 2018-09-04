<?xml version="1.0" encoding="UTF-8"?>



<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:sep="http://www.uts.edu.au/31284/sep-products" exclude-result-prefixes="sep"
                version="1.0">
    <xsl:output method="html"/>
    <!-- TODO customize transformation rules syntax recommendation http://www.w3.org/TR/xslt -->
    
    <xsl:template match="/">
        <head>
            <style>
                table.product { border: solid 1px black; border-collapse: collapse; }
                table.product td {border: solid 1px #999;}
                .artist {font-style: italic; margin-bottom: 20px;}
                .even {background:#fff;}
                .odd {background:#f2f2f2;}
            </style>
        </head>
        <table class="product">
            <thead>
                <tr> <!-- Headings displayed for Product Details: -->
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Stock</th>
                    <th>Price</th>
                    <th>Seller</th>
                    <th>Order?</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="sep:product">
        <xsl:variable name="class">
            <xsl:choose>
                <xsl:when test="@id mod 2 = 0">even</xsl:when>
                <xsl:otherwise>odd</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <tr class="{class}">
            <td>
                <xsl:value-of select="id"/>
            </td>
            <td> <!-- Shows title of selected product: -->
                <xsl:value-of select="productName"/>
            </td>
            <td> <!-- Shows author of selected product: -->
                <xsl:value-of select="description"/> 
            </td>
            <td> <!-- Shows category of selected product: -->
                <xsl:value-of select="stock"/>
            </td>
            <td> <!-- Shows abtext of selected product: -->
                <xsl:value-of select="price"/>
            </td>
            <td> <!-- Shows manager of selected product: -->
                <xsl:value-of select="manager-username"/>
            </td>
            <td> 
                <!-- Check if product is orderd before reserving: -->
                <xsl:choose>
                    <xsl:when test="status='Orderd'">N/A</xsl:when>
                    <!-- Carries ID of product to be orderd: -->
                    <xsl:otherwise>
                        <a href="order_product.jsp?order={id}">Buy</a>
                    </xsl:otherwise>
                </xsl:choose>
                
                
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>