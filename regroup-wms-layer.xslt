<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.opengis.net/wms" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:wms="http://www.opengis.net/wms" xmlns:sld="http://www.opengis.net/sld"  version="3.0">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="wms:WMS_Capabilities">
    <xsl:copy/>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="wms:Service">
    <xsl:copy-of copy-namespaces="no" select="."/>  
  </xsl:template>

  <xsl:template match="wms:Capability">
    <xsl:copy copy-namespaces="no">
      <xsl:copy-of copy-namespaces="no" select="wms:Request"/>
      <xsl:copy-of copy-namespaces="no" select="wms:Exception"/>
      <xsl:copy-of copy-namespaces="no" select="sld:UserDefinedSymbolization"/>

      <xsl:copy copy-namespaces="no" select="wms:Layer">
        <xsl:copy-of select="@*"/>
        <xsl:copy-of copy-namespaces="no" select="wms:Name"/>
        <xsl:copy-of copy-namespaces="no" select="wms:Title"/>
        <xsl:copy-of copy-namespaces="no" select="wms:CRS"/>
        <xsl:copy-of copy-namespaces="no" select="wms:EX_GeographicBoundingBox"/>
        <xsl:copy-of copy-namespaces="no" select="wms:BoundingBox"/>
        <xsl:for-each-group select="/wms:WMS_Capabilities/wms:Capability/wms:Layer/wms:Layer" group-by="substring(wms:Name, 1, 9)">
          <Layer queryable="1">
            <Name><xsl:value-of select="substring(wms:Name, 1, 9)"/></Name>
            <Title><xsl:value-of select="upper-case(substring(wms:Name, 7, 3))"/></Title>

            <xsl:for-each select="current-group()">
              <xsl:copy-of copy-namespaces="no" select="."/>
              <!--<xsl:copy-of copy-namespaces="no" select="wms:Layer"/>-->
              <!--
              <xsl:text>   
              </xsl:text>
              <xsl:value-of select="wms:Name"/> <xsl:value-of select="count(ancestor::*)"/><xsl:text>   
              </xsl:text>
  -->

            </xsl:for-each>
          </Layer>
        </xsl:for-each-group>

      </xsl:copy>


    </xsl:copy>
  </xsl:template>



</xsl:stylesheet>
