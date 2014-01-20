<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">

<xsl:import href="resource:templates/reST.xsl" />

<xsl:template match="/" name="main">
<html>
  <head>
    <title><xsl:value-of select="/document/@title"/></title>
    <meta name="generator" content="Hovercraft! 1.0 http://regebro.github.com/hovercraft"/>
    <xsl:if test="/document/author"> <!-- Author is a child to the document, everything else become attributes -->
      <meta name="author">
        <xsl:attribute name="content">
          <xsl:value-of select="/document/author" />
        </xsl:attribute>
      </meta>
    </xsl:if>
    <xsl:if test="/document/@description">
      <meta name="description">
        <xsl:attribute name="content">
          <xsl:value-of select="/document/@description" />
        </xsl:attribute>
      </meta>
    </xsl:if>
    <xsl:if test="/document/@keywords">
      <meta name="keywords">
        <xsl:attribute name="content">
          <xsl:value-of select="/document/@keywords" />
        </xsl:attribute>
      </meta>
    </xsl:if>
    
    <xsl:for-each select="/document/templateinfo/header/css">
      <link rel="stylesheet">
        <xsl:copy-of select="@*"/>
      </link>
    </xsl:for-each>
    
    <xsl:if test="/document/@pygments">
        <link rel="stylesheet" media="screen">
            <xsl:attribute name="href">css/pygments/<xsl:value-of select="/document/@pygments" />.css</xsl:attribute>
        </link>
    </xsl:if>

    <xsl:for-each select="/document/templateinfo/header/js">
      <script type="text/javascript">
        <xsl:copy-of select="@*"/>
      </script>
    </xsl:for-each>

  </head>
  <body class="impress-not-supported">
  
    <xsl:for-each select="/document">
      <div id="impress">
        <xsl:if test="@data-transition-duration">
          <xsl:attribute name="data-transition-duration">
            <xsl:value-of select="@data-transition-duration" />
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="@auto-console">
          <xsl:attribute name="auto-console">
            <xsl:value-of select="@auto-console" />
          </xsl:attribute>
        </xsl:if>
        <xsl:for-each select="step">
          <div class="step">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates />
          </div>
        </xsl:for-each>
      </div> 
    </xsl:for-each>
    
    <div id="footer">
        <img width="130" height="35" title="" alt="Six Feet Up Logo" src="data:image/png;base64,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" />
        <p>
            <xsl:value-of select="/document/@title"/>
            <xsl:if test="/document/author">
                -
                <xsl:value-of select="/document/author" />
            </xsl:if>
            <xsl:if test="/document/@event">
                 - <xsl:value-of select="/document/@event" />
            </xsl:if>
        </p>
    </div>
  
    <div id="hovercraft-help">
      <xsl:if test="/document/@skip-help">
        <xsl:attribute name="class">hide</xsl:attribute>
      </xsl:if>
      <table>
        <tr><th>Space</th><td>Forward</td></tr>
        <tr><th>Right, Down, Page Down</th><td>Next slide</td></tr>
        <tr><th>Left, Up, Page Up</th><td>Previous slide</td></tr>
        <tr><th>P</th><td>Open presenter console</td></tr>
        <tr><th>H</th><td>Toggle this help</td></tr>
      </table>
    </div>
    <xsl:for-each select="/document/templateinfo/body/js">
      <script type="text/javascript">
        <xsl:copy-of select="@*"/>
      </script>
    </xsl:for-each>
  
</body>
</html>
</xsl:template>

</xsl:stylesheet>
