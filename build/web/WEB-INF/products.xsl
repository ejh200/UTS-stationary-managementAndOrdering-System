<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : products.xsl
    Author     : james
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:sep="http://www.uts.edu.au/31284/sep-products" exclude-result-prefixes="sep"
    version="1.0">
    <xsl:output method="html"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    
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
                <tr> <!-- Headings for main product attributes: -->
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Stock</th>
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
        <tr class="{$class}">
            <td>
                <a href="product_details.jsp?productName={productName}">
                    <xsl:value-of select="productName"/>
                </a>

            </td>
            <td> <!-- Show product description -->
                <xsl:value-of select="description"/> 
            </td>
            <td> <!-- Show product price -->
                <xsl:value-of select="price"/>
            </td>
            <td> <!-- Number of products  -->
                <xsl:value-of select="stock"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>