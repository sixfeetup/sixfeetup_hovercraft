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
        <img class="screen" width="130" height="35" title="" alt="Six Feet Up Logo" src="data:image/png;base64,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" />
        
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
