<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
                <tr>
                    <th>Title</th>
                    <th>Email</th>
                    <th>Name</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="product">
        <xsl:variable name="class">
            <xsl:choose>
                <xsl:when test="@id mod 2 = 0">even</xsl:when>
                <xsl:otherwise>odd</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <tr class="{$class}">
            <td> <!-- Retrieve title of selected product to buy-->
                <a href="product_details.jsp?title={title}">
                    <xsl:value-of select="title"/>
                </a>
            </td>
            <td>
                <xsl:value-of select="email"/> 
            </td>
            <td>
                <xsl:value-of select="author"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
