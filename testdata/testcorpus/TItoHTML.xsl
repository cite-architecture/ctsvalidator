<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:dc="http://purl.org/dc/elements/1.1"
    xmlns:ti="http://chs.harvard.edu/xmlns/cts3/ti"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param
        name="collections">no</xsl:param>
    <xsl:template
        match="/">
        <html>
            <head>
                <title>Browse Text Inventory</title>
                <link
                    href="ti.css"
                    rel="stylesheet"
                    type="text/css"/>
            </head>
            <body>
                <h1>Browse Text Inventory</h1>
                <xsl:if
                    test="/ti:TextInventory/@tiid">
                    <xsl:variable
                        name="tiid">
                        <xsl:value-of
                            select="ti:TextInventory/@tiid"/>
                    </xsl:variable>
                    <xsl:if
                        test="/ti:TextInventory/ti:ctsnamespace[@abbr = $tiid]">
                        <div class="symbolkey">
                            <p>This inventory is the canonical source for ID values in the <code><xsl:value-of
                                    select="$tiid"/></code> CTS namespace (= <code><xsl:value-of
                                    select="/ti:TextInventory/ti:ctsnamespace[@abbr = $tiid]/@ns"/></code>)
                                .</p>
                        </div>
                    </xsl:if>
                </xsl:if>
                <h2>References</h2>
                <div
                    class="symbolkey">
                    <xsl:if
                        test="/ti:TextInventory/ti:ctsnamespace">
                        <p><strong>CTS namespaces</strong> used in this inventory</p>
                        <ul>
                            <xsl:apply-templates
                                select="/ti:TextInventory/ti:ctsnamespace"/>
                        </ul>
                    </xsl:if>
                    <xsl:if
                        test="/ti:TextInventory/ti:citationSchemes">
                        <p><strong>Named citation schemes</strong> used in this inventory</p>
                        <ul>
                            <xsl:apply-templates
                                select="/ti:TextInventory/ti:citationSchemes/ti:scheme"/>
                        </ul>
                    </xsl:if>
                    <xsl:if
                        test="/ti:TextInventory/ti:collection">
                        <p><strong>Analytical groups or projects</strong> (‘text collections’) used
                            in this inventory</p>
                        <ul>
                            <xsl:apply-templates
                                select="/ti:TextInventory/ti:collection"/>
                        </ul>
                    </xsl:if>
                </div>
                <h2>Texts (alphabetically by first title listed)</h2>
                <p>Contents: <xsl:value-of
                        select="count(//ti:textgroup)"/>
                    <xsl:text> groups containing </xsl:text>
                    <xsl:value-of
                        select="count(//ti:work)"/>
                    <xsl:text> works.</xsl:text>
                </p>
                <xsl:apply-templates
                    select="/ti:TextInventory/ti:textgroup">
                    <xsl:sort
                        select="ti:groupname"/>
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    <xsl:template
        match="ti:collection">
        <li>collection: <xsl:value-of
                select="dc:title"/></li>
    </xsl:template>
    <xsl:template
        match="ti:textgroup">
        <div
            class="textgroup">
            <h3>
                <xsl:value-of
                    select="ti:groupname[1]"/>
                <span
                    class="metadata"> = text group <xsl:call-template
                        name="formatValue">
                        <xsl:with-param
                            name="str">
                            <xsl:value-of
                                select="./@projid"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </span>
            </h3>
            <p>
                <xsl:if
                    test="count(ti:groupname) > 1"> Alternate names: <xsl:for-each
                        select="ti:groupname">
                        <xsl:if
                            test="position() > 1">
                            <xsl:value-of
                                select="."/>
                            <span
                                class="metadata"> [ <xsl:value-of
                                    select="./@xml:lang"/> ] </span>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:choose>
                    <xsl:when
                        test="count(ti:work) = 1"> Contains 1 work. </xsl:when>
                    <xsl:when
                        test="count(ti:work) > 1"> Contains <xsl:value-of
                            select="count(ti:work)"/> works. </xsl:when>
                </xsl:choose>
            </p>
            <xsl:apply-templates
                select="ti:work">
                <xsl:sort
                    select="./@projid"/>
            </xsl:apply-templates>
        </div>
    </xsl:template>
    <xsl:template
        match="ti:work">
        <div
            class="work">
            <h4>
                <em
                    class="title">
                    <xsl:value-of
                        select="ti:title[1]"/>
                </em>
                <span
                    class="metadata"> = work <xsl:call-template
                        name="formatValue">
                        <xsl:with-param
                            name="str">
                            <xsl:value-of
                                select="./@projid"/>
                        </xsl:with-param>
                    </xsl:call-template></span>
            </h4>
            <p>
                <xsl:if
                    test="count(ti:title) > 1"> Alternate titles: <xsl:for-each
                        select="ti:title">
                        <xsl:if
                            test="position() > 1">
                            <em
                                class="title">
                                <xsl:value-of
                                    select="."/>
                            </em>
                            <span
                                class="metadata"> [ <xsl:value-of
                                    select="./@xml:lang"/> ] </span>
                            <xsl:if
                                test="position() != last()">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </p>
            <xsl:if
                test="ti:edition">
                <ul>
                    <xsl:apply-templates
                        select="ti:edition"/>
                </ul>
            </xsl:if>
            <xsl:if
                test="ti:translation">
                <ul>
                    <xsl:apply-templates
                        select="ti:edition"/>
                </ul>
            </xsl:if>
        </div>
    </xsl:template>
    <xsl:template
        match="ti:edition">
        <li><strong>Edition</strong>: <xsl:value-of
                select="./@label"/>
            <span
                class="metadata"> = <xsl:call-template
                    name="formatValue">
                    <xsl:with-param
                        name="str">
                        <xsl:value-of
                            select="./@projid"/>
                    </xsl:with-param>
                </xsl:call-template></span>
            <xsl:apply-templates
                select="ti:online"/>
        </li>
    </xsl:template>
    <xsl:template
        match="ti:translation">
        <li><strong>Translation</strong>: <xsl:value-of
                select="./@label"/>
            <span
                class="metadata">= <xsl:call-template
                    name="formatValue">
                    <xsl:with-param
                        name="str">
                        <xsl:value-of
                            select="./@projid"/>
                    </xsl:with-param>
                </xsl:call-template></span>. <xsl:apply-templates
                select="ti:online"/>
        </li>
    </xsl:template>
    <xsl:template
        match="ti:online"> online: validates against <xsl:value-of
            select="ti:validate/@schema"/>, citation scheme <xsl:element
            name="a">
            <xsl:attribute
                name="href">
                <xsl:text>#</xsl:text>
                <xsl:value-of
                    select="ti:citationScheme/@schemaId"/>
            </xsl:attribute>
            <xsl:value-of
                select="ti:citationScheme/@schemaId"/>
        </xsl:element>, citation mapping: <xsl:apply-templates
            select="ti:citationMapping/ti:citation"/>
    </xsl:template>
    <xsl:template
        match="ti:citation">
        <xsl:value-of
            select="./@label"/> mapped to <xsl:value-of
            select="./@xpath"/> in context <xsl:value-of
            select="./@scope"/>
        <xsl:apply-templates
            select="ti:citation"/>
    </xsl:template>
    <xsl:template
        name="formatValue">
        <xsl:param
            name="str"/>
        <xsl:choose>
            <xsl:when
                test="contains(str,':')">
                <xsl:value-of
                    select="$str"/>
            </xsl:when>
            <xsl:when
                test="/ti:TextInventory/ti:ctsnamespace[@isdefault = 'yes']">
                <xsl:value-of
                    select="/ti:TextInventory/ti:ctsnamespace[@isdefault = 'yes']/@abbr"/>
                <xsl:text>:</xsl:text>
                <xsl:value-of
                    select="$str"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template
        match="ti:ctsnamespace">
        <li><code>
                <xsl:value-of
                    select="./@abbr"/>
            </code> : <xsl:value-of
                select="./@ns"/></li>
    </xsl:template>
    <xsl:template
        match="ti:scheme">
        <li>
            <code>
                <xsl:element
                    name="a">
                    <xsl:attribute
                        name="name">
                        <xsl:value-of
                            select="./@projid"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:value-of
                    select="./@projid"/>
            </code> : <xsl:value-of
                select="ti:label"/> = <xsl:value-of
                select="ti:description"/>
        </li>
    </xsl:template>
    <xsl:template
        match="ti:collection">
        <li><code>
                <xsl:value-of
                    select="./@id"/>
            </code> : <xsl:text>“</xsl:text><xsl:value-of
                select="dc:title"/><xsl:text>” = </xsl:text>
            <xsl:value-of
                select="dc:description"/>
        </li>
    </xsl:template>
</xsl:stylesheet>
