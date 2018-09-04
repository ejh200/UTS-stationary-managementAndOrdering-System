<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="managers">
        <html>
            <head>
                <style>
                    table.tracklist { border: solid 1px black; border-collapse: collapse; }
                    table.tracklist td {border: solid 1px #999;}
                    .artist {font-style: italic; margin-bottom: 20px;}
                    .even {background:#fff;}
                    .odd {background:#f2f2f2;}
                </style>
            </head>
            <body>
                <xsl:apply-templates/>
                
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>