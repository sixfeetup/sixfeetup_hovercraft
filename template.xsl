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
        <link rel="stylesheet" media="all">
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
        <img class="screen" width="230" height="35" title="" alt="Six Feet Up Logo" src="data:image/png;base64,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" />
        
        <svg
           xmlns:dc="http://purl.org/dc/elements/1.1/"
           xmlns:cc="http://creativecommons.org/ns#"
           xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
           xmlns:svg="http://www.w3.org/2000/svg"
           xmlns="http://www.w3.org/2000/svg"
           xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
           version="1.1"
           class="print"
           width="162.5"
           height="43.75"
           id="svg2"
           xml:space="preserve"><metadata
             id="metadata8"><rdf:RDF><cc:Work
                 rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
                   rdf:resource="http://purl.org/dc/dcmitype/StillImage" /></cc:Work></rdf:RDF></metadata><defs
             id="defs6"><clipPath
               id="clipPath18"><path
                 d="M 0,349.996 0,0 l 1300,0 0,349.996 -1300,0 z"
                 inkscape:connector-curvature="0"
                 id="path20" /></clipPath></defs><g
             transform="matrix(1.25,0,0,-1.25,0,43.75)"
             id="g10"><g
               transform="scale(0.1,0.1)"
               id="g12"><g
                 id="g14"><g
                   clip-path="url(#clipPath18)"
                   id="g16"><path
                     d="m 95.9844,128.984 -25.4649,0.157 c -0.1445,0.871 -0.2656,1.574 -0.3281,2.011 -0.5078,5.227 -1.9883,8.496 -4.4492,9.793 -2.4453,1.313 -8.4219,1.946 -17.8984,1.993 -13.5665,0.089 -20.375,-4.266 -20.418,-13.028 -0.043,-5.984 1.1484,-9.551 3.5273,-10.683 2.3789,-1.129 10.4727,-2.086 24.2539,-2.832 18.586,-1.004 30.6563,-3.512 36.2422,-7.567 5.5899,-4.016 8.3672,-12.246 8.2852,-24.6483 C 99.6641,70.9844 95.8906,61.8359 88.4102,56.7461 80.918,51.7188 67.4961,49.2188 48.1562,49.3164 29.5898,49.4141 16.9062,51.7773 10.1055,56.4336 3.28516,61.0938 -0.0546875,69.7188 0,82.3242 L 0.015625,85.0586 27.0977,84.9102 c -0.4063,-1.5196 -0.6329,-2.7149 -0.7149,-3.6211 -1.1133,-9.5899 6.2734,-14.4258 22.211,-14.5118 16.4296,-0.0976 24.6835,4.6289 24.746,14.168 0.0547,9.1211 -5.0859,13.7344 -15.375,13.7891 -23.3007,0.1094 -38.625,2.3633 -45.9687,6.8206 -7.38672,4.383 -11.042975,13.523 -10.96094,27.351 0.0625,12.403 3.49609,20.762 10.25784,25.117 6.7695,4.356 19.7461,6.465 38.9218,6.383 18.125,-0.101 30.2813,-2.281 36.5313,-6.519 6.2187,-4.297 9.3125,-12.578 9.2383,-24.903"
                     inkscape:connector-curvature="0"
                     id="path22"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 146.879,204.906 -0.121,-21.652 -26.039,0.125 0.117,21.644 26.043,-0.117 z m -0.258,-46.359 -0.551,-108.3439 -26.05,0.1094 0.57,108.3595 26.031,-0.125"
                     inkscape:connector-curvature="0"
                     id="path24"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 261.148,157.949 -31.886,-50.851 34.843,-57.5199 -31.152,0.1563 -21.629,39.4765 -21.453,-39.2304 -31.988,0.1367 35.902,56.8478 -31.113,51.48 31.035,-0.156 17.781,-34.422 18.61,34.258 31.05,-0.176"
                     inkscape:connector-curvature="0"
                     id="path26"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 339.727,49.1992 0.461,88.6328 -15.368,0.078 0.114,19.727 15.339,-0.086 0.086,11.551 c 0.055,13.769 3.063,23.242 9.059,28.472 5.965,5.235 16.77,7.793 32.402,7.723 2.649,-0.024 6.305,-0.16 11.012,-0.399 l -0.113,-20.293 c -3.539,0.84 -6.582,1.293 -9.09,1.293 -11.426,0.047 -17.188,-5.589 -17.238,-16.925 l -0.075,-11.551 27.059,-0.137 -0.098,-19.719 -27.054,0.129 -0.453,-88.6247 -26.043,0.1289"
                     inkscape:connector-curvature="0"
                     id="path28"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 477.77,113.895 -0.11,4.296 c 0.07,8.625 -1.394,14.211 -4.375,16.809 -2.988,2.59 -9.48,3.887 -19.496,3.945 -9.719,0.059 -16.019,-1.465 -18.961,-4.558 -2.933,-3.078 -4.422,-9.817 -4.48,-20.254 l 47.422,-0.238 z m -0.383,-30.7505 26.144,-0.0976 -0.011,-4.2071 c -0.114,-21.1562 -16.075,-31.6523 -47.93,-31.4882 -21.613,0.0976 -35.719,3.832 -42.348,11.2109 -6.64,7.3828 -9.902,22.9102 -9.769,46.6405 0.089,21.074 3.675,35.235 10.691,42.453 6.992,7.215 20.633,10.774 40.859,10.672 19.403,-0.105 32.383,-3.699 38.946,-10.801 6.574,-7.097 9.785,-21.011 9.699,-41.707 l -0.059,-7.9489 -73.566,0.3711 c -0.176,-2.4024 -0.254,-3.9961 -0.254,-4.7461 -0.043,-10.6445 1.551,-17.7656 4.828,-21.3281 3.293,-3.5547 9.856,-5.3711 19.703,-5.4414 9.563,-0.0469 15.774,0.9687 18.668,3.0195 2.891,2.0781 4.356,6.543 4.399,13.3984"
                     inkscape:connector-curvature="0"
                     id="path30"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 595.688,113.289 -0.09,4.309 c 0.039,8.613 -1.422,14.199 -4.399,16.789 -2.996,2.586 -9.484,3.902 -19.496,3.961 -9.699,0.05 -16.027,-1.473 -18.965,-4.547 -2.914,-3.078 -4.402,-9.836 -4.468,-20.278 l 47.418,-0.234 z m -0.391,-30.7226 26.156,-0.125 -0.023,-4.1875 c -0.098,-21.1953 -16.082,-31.6523 -47.914,-31.4961 -21.614,0.1055 -35.739,3.8555 -42.356,11.211 -6.644,7.3437 -9.898,22.8906 -9.773,46.6092 0.093,21.113 3.668,35.258 10.687,42.453 7.004,7.227 20.637,10.789 40.864,10.703 19.41,-0.117 32.41,-3.703 38.96,-10.8 6.563,-7.098 9.778,-21.016 9.684,-41.711 l -0.043,-7.9261 -73.586,0.3672 c -0.156,-2.4414 -0.238,-4.0118 -0.238,-4.7657 -0.059,-10.6406 1.543,-17.7695 4.812,-21.3359 3.293,-3.5664 9.868,-5.3711 19.703,-5.4219 9.547,-0.0468 15.778,0.9688 18.676,3.0313 2.899,2.0508 4.367,6.5195 4.391,13.3945"
                     inkscape:connector-curvature="0"
                     id="path32"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 713.707,155.637 -0.09,-19.719 -41.844,0.203 -0.293,-54.4022 c -0.05,-10.0469 3.77,-15.0782 11.407,-15.1368 8.398,-0.0273 12.656,6.0469 12.722,18.2032 l 0.012,4.2968 22.188,-0.0976 -0.039,-5.4375 c 0,-4.9922 -0.188,-9.2813 -0.508,-12.8164 -1.524,-16.5508 -13.918,-24.7461 -37.207,-24.6446 -23.192,0.1133 -34.711,10.8164 -34.633,32.0391 l 0.305,58.137 -14.106,0.066 0.109,19.727 14.106,-0.071 0.121,24.274 26.031,-0.156 -0.117,-24.254 41.836,-0.211"
                     inkscape:connector-curvature="0"
                     id="path34"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 887.242,155.117 -0.539,-108.3787 -26.043,0.1367 1.57,18.5938 -0.457,0.1054 C 856.598,52.3047 844.898,45.6914 826.625,45.8203 802.008,45.9453 789.742,58.2695 789.867,82.832 l 0.383,72.766 26.023,-0.121 -0.339,-66.5434 c -0.039,-9.1992 1.238,-15.293 3.769,-18.2109 2.578,-2.918 7.91,-4.4219 16.035,-4.4336 16.66,-0.0782 25.047,9.8515 25.164,29.7851 l 0.313,59.1798 26.027,-0.137"
                     inkscape:connector-curvature="0"
                     id="path36"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 964.809,135.535 c -9.942,0.102 -16.434,-2.129 -19.481,-6.57 -3.066,-4.434 -4.629,-13.875 -4.699,-28.301 -0.067,-14.0624 1.516,-23.4062 4.738,-28.0195 3.242,-4.6367 9.863,-6.9687 19.883,-7.0195 10.164,-0.0586 16.777,2.0781 19.812,6.4727 3.047,4.3671 4.61,13.7304 4.7,28.1953 0.078,14.805 -1.407,24.355 -4.473,28.699 -3.039,4.297 -9.863,6.504 -20.48,6.543 m -51.18,19.426 26.473,-0.117 -1.094,-16.094 0.578,-0.117 c 6.336,11.687 18.074,17.48 35.215,17.375 15.847,-0.07 26.739,-4.055 32.639,-11.875 5.9,-7.863 8.81,-22.141 8.71,-42.856 -0.12,-21.5895 -3.16,-36.3864 -9.12,-44.3629 -5.95,-7.9883 -16.917,-11.9414 -32.893,-11.836 -17.071,0.0664 -28.184,5.7891 -33.371,17.1485 l -0.45,0 L 940.004,0 912.828,0.144531 913.629,154.961"
                     inkscape:connector-curvature="0"
                     id="path38"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1096.44,43.6523 c -0.48,9.0235 -0.24,105.9567 -44.45,230.0037 l -0.2,0.66 -0.17,0.918 -0.16,1.371 -0.07,0.95 -0.13,1.433 -0.02,0.883 0.03,0.637 0.06,0.719 c 0,0 6.04,5.707 6.06,5.707 0,0 15,1.429 94.81,18.734 66.16,14.34 100,32.184 129.43,44.059 0.61,0.257 1.05,0 1.05,0 0,0 8.46,-21.813 11.87,-49.395 1.01,-8.207 2.05,-16.855 2.84,-26.637 2.22,-26.961 3.33,-60.035 1.95,-93.91 -1.14,-28.223 0.8,-49.961 -9.36,-88.1639 -0.07,-0.2422 -1.87,-0.7149 -1.87,-0.7149 0,0 -21.08,-9.1796 -75.99,-24.8203 -8.82,-2.5117 -7.92,-1.9062 -18.76,-4.414 -24.5,-5.6563 -96.9,-18.3438 -96.92,-18.0196"
                     inkscape:connector-curvature="0"
                     id="path40"
                     style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1157.37,227.539 c 0.39,-1.039 0.77,-2.07 1.16,-3.098 0.64,0.461 1.28,0.926 1.91,1.387"
                     inkscape:connector-curvature="0"
                     id="path42"
                     style="fill:#4190ab;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1183.89,148.176 c 12.8,12.754 25.15,26.019 36.97,39.758 -17.11,11.64 -34.71,22.558 -52.86,32.695 -1.78,-1.305 -3.6,-2.602 -5.39,-3.926 8.22,-22.445 15.35,-45.324 21.28,-68.527"
                     inkscape:connector-curvature="0"
                     id="path44"
                     style="fill:#438fa4;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1156.97,236.93 c 3.82,-2.032 6.43,-3.047 10.22,-5.133 8.42,5.957 17.71,12.258 26.36,17.848 -11.79,13.457 -24.05,26.523 -36.88,39.101 -4.52,4.426 -10.42,10.379 -15.03,14.68 -4.6,-1.035 -8.36,-1.848 -12.87,-2.758 9.95,-19.715 20.09,-43.188 28.2,-63.738"
                     inkscape:connector-curvature="0"
                     id="path46"
                     style="fill:#5ab2c5;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1238.36,209.617 c 0.27,-0.351 0.51,-0.715 0.78,-1.062 3.41,4.215 6.78,8.472 10.1,12.757 15.9,20.563 33.24,45.032 46.73,67.028 -0.32,3.222 -0.5,4.203 -0.87,7.402 -29.37,-13.539 -60.63,-29.894 -87.95,-47.211 10.83,-12.578 21.27,-25.562 31.21,-38.914"
                     inkscape:connector-curvature="0"
                     id="path48"
                     style="fill:#a8e1df;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1282.45,349.996 c -0.14,0.024 -0.63,-0.172 -0.7,-0.203 -4.86,-2.039 -7.8,-3.289 -11.74,-4.961 -37.89,-16.152 -76.83,-29.598 -117.11,-39.031 17.06,-16.055 33.33,-32.949 48.77,-50.61 28.33,17.969 61.8,35.704 92.22,49.582 -1.89,15.586 -6.09,29.875 -11.13,44.727 -0.04,0.207 -0.14,0.461 -0.31,0.496"
                     inkscape:connector-curvature="0"
                     id="path50"
                     style="fill:#b3e6e4;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1176.85,142.305 c -4.8,19.215 -10.4,38.277 -16.85,57.09 -1.45,4.234 -2.96,8.449 -4.5,12.636 -25.02,-18.574 -48.46,-38.496 -70.92,-60.234 0.35,-1.934 0.83,-4.375 1.16,-6.309 19.85,-10.468 38.75,-21.64 57.58,-33.957 11.48,9.914 22.67,20.149 33.53,30.774"
                     inkscape:connector-curvature="0"
                     id="path52"
                     style="fill:#214860;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1082.95,160.562 c 7.74,7.407 20.27,19.286 38.59,34.465 10.41,8.633 21.07,16.922 31.92,24.934 -1.33,3.551 -2.66,7.109 -4.06,10.644 -2.99,1.563 -5.99,3.172 -9,4.704 -28.7,14.535 -58.33,27.746 -88.44,38.253 8.47,-23.347 20.66,-61.257 30.99,-113"
                     inkscape:connector-curvature="0"
                     id="path54"
                     style="fill:#33728c;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1145.84,240.781 c -7.62,18.789 -16.92,39.949 -26.07,57.965 -8.94,-1.75 -50.09,-10.207 -62.46,-11.844 -0.98,-0.656 -2.27,-1.566 -3.14,-2.375 -1.13,-1.074 -1.84,-2.043 -2.82,-3.277 32.23,-11.176 64.07,-24.844 94.49,-40.469"
                     inkscape:connector-curvature="0"
                     id="path56"
                     style="fill:#4695b1;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1278.55,160.816 c 6.58,6.551 13.94,13.465 20.78,19.782 1.24,34.523 0.65,51.586 -0.86,77.742 -0.28,5.121 -0.74,11 -1.18,16.082 -15.71,-24.988 -33.45,-49.867 -52.15,-72.824 7.57,-10.371 14.87,-20.914 21.86,-31.664 3.88,-2.985 7.72,-6.047 11.55,-9.118"
                     inkscape:connector-curvature="0"
                     id="path58"
                     style="fill:#9fded9;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1188.73,77.4102 c 0.92,-0.7227 1.85,-1.4649 2.79,-2.1875 -2.99,19.2578 -6.75,38.4183 -11.31,57.4333 -9.81,-9.511 -19.88,-18.683 -30.18,-27.597 13.2,-8.7817 26.1,-17.9809 38.7,-27.6488"
                     inkscape:connector-curvature="0"
                     id="path60"
                     style="fill:#245066;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1249.84,175.328 c -3.82,5.578 -7.7,11.082 -11.68,16.567 -1.43,-1.731 -2.87,-3.422 -4.33,-5.133 5.39,-3.754 10.74,-7.551 16.01,-11.434"
                     inkscape:connector-curvature="0"
                     id="path62"
                     style="fill:#4fa4ae;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1193.63,61.7266 c -0.18,1.25 -0.56,3.6718 -0.74,4.9218 -15.24,11.9922 -31.87,24.1602 -48.07,34.9136 -15.92,-13.5347 -32.37,-26.3589 -49.33,-38.4253 0.39,-6.5156 0.65,-13.0586 0.86,-19.582 3.22,0.3984 6.43,0.7695 9.65,1.2109 28.8,3.9571 87.18,16.3203 87.63,16.961"
                     inkscape:connector-curvature="0"
                     id="path64"
                     style="fill:#224055;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1284.78,155.41 c 4.46,-3.652 9.14,-7.715 13.52,-11.465 0.66,8.575 0.58,17.547 0.72,26.184 -5.16,-4.832 -9.23,-9.746 -14.24,-14.719"
                     inkscape:connector-curvature="0"
                     id="path66"
                     style="fill:#52a0a6;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1225.75,194.609 c 1.86,2.188 3.69,4.434 5.53,6.641 -10.49,14.199 -21.55,27.992 -33.08,41.422 -8.07,-5.207 -15.64,-10.293 -23.48,-15.813 11.99,-6.785 23.45,-14.164 35.08,-21.656 5.37,-3.457 10.67,-7.004 15.95,-10.594"
                     inkscape:connector-curvature="0"
                     id="path68"
                     style="fill:#52a2b2;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1094.89,72.5586 c 15.37,11.0742 30.03,22.5586 44.48,34.8124 -6.99,4.555 -14.03,9.016 -21.21,13.332 -10.26,6.172 -20.67,11.981 -31.19,17.617 3.54,-21.855 6.4,-43.6325 7.92,-65.7614"
                     inkscape:connector-curvature="0"
                     id="path70"
                     style="fill:#173348;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1258.5,160.184 c -9.49,7.3 -19.16,14.351 -29.02,21.183 -12.75,-14.851 -26.13,-29.187 -40.09,-43 4.27,-17.371 7.96,-34.949 10.92,-52.6522 0.8,-4.8554 1.54,-9.707 2.26,-14.5742 0.02,-0.0195 0.04,-0.0468 0.08,-0.0781 19.63,26.6797 41.1,52.0355 64.29,75.8325 -2.77,4.46 -5.57,8.886 -8.44,13.289"
                     inkscape:connector-curvature="0"
                     id="path72"
                     style="fill:#43859b;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1293.07,104.277 c -5.98,11.055 -14.32,26.289 -20.86,37.039 -9.7,-10 -18.95,-20.425 -28.06,-30.996 -12.17,-14.0973 -26.15,-30.7028 -37.11,-45.613 1.87,0.2539 56.64,15.9375 82.89,26.8086 1.52,5.3321 2.01,7.0196 3.14,12.7614"
                     inkscape:connector-curvature="0"
                     id="path74"
                     style="fill:#438293;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1279.68,149.797 c -0.28,-0.317 -0.03,-0.102 -0.31,-0.402 5.49,-9.004 11.63,-19.493 16.73,-28.711 0.58,4.746 1.19,9.406 1.61,14.207 -5.47,4.757 -12.4,10.312 -18.03,14.906"
                     inkscape:connector-curvature="0"
                     id="path76"
                     style="fill:#4d959f;fill-opacity:1;fill-rule:nonzero;stroke:none" /></g></g></g></g></svg>
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
