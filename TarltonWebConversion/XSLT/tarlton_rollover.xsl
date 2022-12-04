<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs tei xhtml"
    version="2.0">
    
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
        method="xhtml" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>
    
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="return2">
        <xsl:text>&#10;</xsl:text>
    </xsl:variable>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:TEI">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <xsl:comment>This document is generated from a TEI Master--do not edit!</xsl:comment>
                <title><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></title>
                <link rel="stylesheet" type="text/css" href="../CSS/tarlton_style.css"/>
                <style type="text/css">
                    @import url("../CSS/tarlton_style.css");
                </style>
            </head>
            
            <body>
                
                
                <xsl:apply-templates select="tei:text/tei:body"/>
            </body>
        </html>
    </xsl:template>
    
    
<!--    <xsl:template match="tei:head">
        <h1 xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </h1>
    </xsl:template>-->

    <xsl:template match="tei:div[@type='section']/tei:head/tei:title">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='old']/tei:head/tei:title">
        <h3 align="left">
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    
    <xsl:template match="tei:byline">
        <hr/>
        <h5>
            <xsl:text>Edited by: </xsl:text>
            <xsl:apply-templates/>
        </h5>
        <br />
    </xsl:template>
    
    <xsl:template match="tei:dateline">
        <em xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </em>
        
        <br xmlns="http://www.w3.org/1999/xhtml"/>
    </xsl:template>
    
    
    <xsl:template match="tei:l">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="tei:p">
        <p xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <br xmlns="http://www.w3.org/1999/xhtml"/>
    </xsl:template>
    
    <xsl:template match="tei:del">
        <strike>
            <xsl:apply-templates/>
        </strike>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='superscript']"> 
        <sup xmlns="http://www.w3.org/1999.xhtml">
            <xsl:apply-templates/>
        </sup>
    </xsl:template>
    
    <xsl:template match="tei:persName[@type] | tei:placeName[@type] | tei:orgName[@type] | tei:objectName[@type] | tei:stait[@type] | tei:trait[@type]">
        <span class="hovertext" data-hover="{@type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    
<!--    <xsl:template match="tei:name[@type='event']">
        <font color="orange">
            <xsl:apply-templates/>
        </font>
    </xsl:template>-->
    
    
    <xsl:template match="tei:ref">
        <a>
            <xsl:attribute name="href"><xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <xsl:template match="tei:div/tei:corresp">
        <a href="{@xml:id}">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    
</xsl:stylesheet>

