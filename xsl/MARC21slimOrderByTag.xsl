<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:marc="http://www.loc.gov/MARC21/slim">
    <!-- MARCXML Simple order by @tag number -->
    <xsl:output encoding="UTF-8" method="xml" indent="yes"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//marc:record">
        <xsl:copy>
            <xsl:apply-templates select="*[not(name() = 'marc:datafield')]">             
            </xsl:apply-templates>
            <xsl:apply-templates select="marc:datafield">
                <xsl:sort select="@tag"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>