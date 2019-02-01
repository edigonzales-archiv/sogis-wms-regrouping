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
    <xsl:copy copy-namespaces="no"/>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="wms:Request">
    <xsl:copy-of copy-namespaces="no" select="."/>  
  </xsl:template>

  <xsl:template match="wms:Exception">
    <xsl:copy-of copy-namespaces="no" select="."/>  
  </xsl:template>

  <xsl:template match="sld:UserDefinedSymbolization">
    <xsl:copy-of copy-namespaces="no" select="."/>  
  </xsl:template>

  <xsl:template match="wms:Layer">
    <xsl:copy copy-namespaces="no"/>
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
