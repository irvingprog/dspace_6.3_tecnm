<?xml version="1.0" encoding="UTF-8" ?>
<!-- 


    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/
	Developed by DSpace @ Lyncode <dspace@lyncode.com>
	
	> http://www.openarchives.org/OAI/2.0/oai_dc.xsd

 -->
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:doc="http://www.lyncode.com/xoai"
	version="1.0">
	<xsl:output omit-xml-declaration="yes" method="xml" indent="yes" />
	
	<xsl:template match="/">
		<oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 
			xmlns:dc="http://purl.org/dc/elements/1.1/" 
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
			xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
			<!-- dc.title -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element/doc:field[@name='value']">
				<dc:title><xsl:value-of select="." /></dc:title>
			</xsl:for-each>
			<!-- dc.title.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element/doc:element/doc:field[@name='value']">
				<dc:title><xsl:value-of select="." /></dc:title>
			</xsl:for-each>
<!-- dc.creator -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='creator']/doc:element/doc:field[@name='value']">
				<dc:creator>
                    <xsl:variable name="idName" select="." />
                        <xsl:choose>
                        <!-- CVU -->
                            <xsl:when test="contains($idName,'%')">
                                <xsl:attribute name="id">info:eu-repo/dai/mx/cvu/<xsl:value-of select= "substring-after($idName,'%')"/></xsl:attribute>
								<!-- Concatena el nombre -->
								<xsl:variable name="conacytName" select="substring-before($idName,'%')"/>
								<xsl:choose>
									<xsl:when test="contains($conacytName,',')">
										<xsl:variable name="remaining" select="substring-after($conacytName,', ')"/>
										<xsl:variable name="first" select="substring-before($conacytName,', ')"/>
										<xsl:value-of select="$remaining" /> <xsl:text> </xsl:text>
										<xsl:value-of select="$first"/>
									</xsl:when>
									<xsl:otherwise>
                               			<xsl:value-of select="."/>
                            		</xsl:otherwise>   
								</xsl:choose>  
                            </xsl:when>
                        <!-- CURP -->
                            <xsl:when test="contains($idName,'#')">
							<xsl:attribute name="id">info:eu-repo/dai/mx/curp/<xsl:value-of select= "substring-after($idName,'#')"/></xsl:attribute>
								<!-- Concatena el nombre -->
								<xsl:variable name="curpName" select="substring-before($idName,'#')"/>
								<xsl:choose>
									<xsl:when test="contains($curpName,',')">
										<xsl:variable name="remaining" select="substring-after($curpName,', ')"/>
										<xsl:variable name="first" select="substring-before($curpName,', ')"/>
										<xsl:value-of select="$remaining" /> <xsl:text> </xsl:text>
										<xsl:value-of select="$first"/>
									</xsl:when>
									<xsl:otherwise>
                               			<xsl:value-of select="."/>
                            		</xsl:otherwise>   
								</xsl:choose>  
                            </xsl:when>
                        <!-- ORCID -->
                            <xsl:when test="contains($idName,'!')">
							<xsl:attribute name="id">info:eu-repo/dai/mx/orcid/<xsl:value-of select= "substring-after($idName,'!')"/></xsl:attribute>
								<!-- Concatena el nombre -->
								<xsl:variable name="orcid" select="substring-before($idName,'!')"/>
								<xsl:choose>
									<xsl:when test="contains($orcid,',')">
										<xsl:variable name="remaining" select="substring-after($orcid,', ')"/>
										<xsl:variable name="first" select="substring-before($orcid,', ')"/>
										<xsl:value-of select="$remaining" /> <xsl:text> </xsl:text>
										<xsl:value-of select="$first"/>
									</xsl:when>
									<xsl:otherwise>
                               			<xsl:value-of select="."/>
                            		</xsl:otherwise>   
								</xsl:choose>  
                            </xsl:when>
                        </xsl:choose>                               
                </dc:creator>
			</xsl:for-each>
<!-- dc.contributor.advisor -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='advisor']/doc:element/doc:field[@name='value']">
				<dc:contributor>
				<xsl:variable name="idName" select="." />
                        <xsl:choose>
                        <!-- CVU -->
                            <xsl:when test="contains($idName,'%')">
                                <xsl:attribute name="id">info:eu-repo/dai/mx/cvu/<xsl:value-of select= "substring-after($idName,'%')"/></xsl:attribute>
											<xsl:attribute name="rol">asesorTesis</xsl:attribute>
								<!-- Concatena el nombre -->
								<xsl:variable name="conacytName" select="substring-before($idName,'%')"/>
								<xsl:choose>
									<xsl:when test="contains($conacytName,',')">
										<xsl:variable name="remainingA" select="substring-after($conacytName,', ')"/>
										<xsl:variable name="firstA" select="substring-before($conacytName,', ')"/>
										<xsl:value-of select="$remainingA" /> <xsl:text> </xsl:text>
										<xsl:value-of select="$firstA"/>
									</xsl:when>
									<xsl:otherwise>
                               			<xsl:value-of select="."/>
                            		</xsl:otherwise>   
								</xsl:choose>  
                            </xsl:when>
                        <!-- CURP -->
                            <xsl:when test="contains($idName,'#')">
							<xsl:attribute name="id">info:eu-repo/dai/mx/curp/<xsl:value-of select= "substring-after($idName,'#')"/></xsl:attribute>
											<xsl:attribute name="rol">asesorTesis</xsl:attribute>
								<!-- Concatena el nombre -->
								<xsl:variable name="curpName" select="substring-before($idName,'#')"/>
								<xsl:choose>
									<xsl:when test="contains($curpName,',')">
										<xsl:variable name="remainingA" select="substring-after($curpName,', ')"/>
										<xsl:variable name="firstA" select="substring-before($curpName,', ')"/>
										<xsl:value-of select="$remainingA" /> <xsl:text> </xsl:text>
										<xsl:value-of select="$firstA"/>
									</xsl:when>
									<xsl:otherwise>
                               			<xsl:value-of select="."/>
                            		</xsl:otherwise>   
								</xsl:choose>  
                            </xsl:when>
                        <!-- ORCID -->
                            <xsl:when test="contains($idName,'!')">
							<xsl:attribute name="id">info:eu-repo/dai/mx/orcid/<xsl:value-of select= "substring-after($idName,'!')"/></xsl:attribute>
											<xsl:attribute name="rol">asesorTesis</xsl:attribute>
								<!-- Concatena el nombre -->
								<xsl:variable name="orcid" select="substring-before($idName,'!')"/>
								<xsl:choose>
									<xsl:when test="contains($orcid,',')">
										<xsl:variable name="remainingA" select="substring-after($orcid,', ')"/>
										<xsl:variable name="firstA" select="substring-before($orcid,', ')"/>
										<xsl:value-of select="$remainingA" /> <xsl:text> </xsl:text>
										<xsl:value-of select="$firstA"/>
									</xsl:when>
									<xsl:otherwise>
                               			<xsl:value-of select="."/>
                            		</xsl:otherwise>   
								</xsl:choose>  
                            </xsl:when>
                        </xsl:choose> 
				</dc:contributor>
			</xsl:for-each>
	        <!-- dc.contributor.* (!author)>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name!='author']/doc:element/doc:field[@name='value']">
				<dc:contributor><xsl:value-of select="." /></dc:contributor>
			</xsl:for-each>
<- dc.contributor.director -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='director']/doc:element/doc:field[@name='value']">
				<dc:contributor>
				<xsl:variable name="idName" select="." />
                        <xsl:choose>
                        <!-- CVU -->
                            <xsl:when test="contains($idName,'%')">
                                <xsl:attribute name="id">info:eu-repo/dai/mx/cvu/<xsl:value-of select= "substring-after($idName,'%')"/></xsl:attribute>
											<xsl:attribute name="rol">directorTesis</xsl:attribute>
								<!-- Concatena el nombre -->
								<xsl:variable name="conacytName" select="substring-before($idName,'%')"/>
								<xsl:choose>
									<xsl:when test="contains($conacytName,',')">
										<xsl:variable name="remainingA" select="substring-after($conacytName,', ')"/>
										<xsl:variable name="firstA" select="substring-before($conacytName,', ')"/>
										<xsl:value-of select="$remainingA" /> <xsl:text> </xsl:text>
										<xsl:value-of select="$firstA"/>
									</xsl:when>
									<xsl:otherwise>
                               			<xsl:value-of select="."/>
                            		</xsl:otherwise>   
								</xsl:choose>  
                            </xsl:when>
                        <!-- CURP -->
                            <xsl:when test="contains($idName,'#')">
							<xsl:attribute name="id">info:eu-repo/dai/mx/curp/<xsl:value-of select= "substring-after($idName,'#')"/></xsl:attribute>
											<xsl:attribute name="rol">directorTesis</xsl:attribute>
								<!-- Concatena el nombre -->
								<xsl:variable name="curpName" select="substring-before($idName,'#')"/>
								<xsl:choose>
									<xsl:when test="contains($curpName,',')">
										<xsl:variable name="remainingA" select="substring-after($curpName,', ')"/>
										<xsl:variable name="firstA" select="substring-before($curpName,', ')"/>
										<xsl:value-of select="$remainingA" /> <xsl:text> </xsl:text>
										<xsl:value-of select="$firstA"/>
									</xsl:when>
									<xsl:otherwise>
                               			<xsl:value-of select="."/>
                            		</xsl:otherwise>   
								</xsl:choose>  
                            </xsl:when>
                        <!-- ORCID -->
                            <xsl:when test="contains($idName,'!')">
							<xsl:attribute name="id">info:eu-repo/dai/mx/orcid/<xsl:value-of select= "substring-after($idName,'!')"/></xsl:attribute>
											<xsl:attribute name="rol">directorTesis</xsl:attribute>
								<!-- Concatena el nombre -->
								<xsl:variable name="orcid" select="substring-before($idName,'!')"/>
								<xsl:choose>
									<xsl:when test="contains($orcid,',')">
										<xsl:variable name="remainingA" select="substring-after($orcid,', ')"/>
										<xsl:variable name="firstA" select="substring-before($orcid,', ')"/>
										<xsl:value-of select="$remainingA" /> <xsl:text> </xsl:text>
										<xsl:value-of select="$firstA"/>
									</xsl:when>
									<xsl:otherwise>
                               			<xsl:value-of select="."/>
                            		</xsl:otherwise>   
								</xsl:choose>  
                            </xsl:when>
                        </xsl:choose> 
						</dc:contributor>
			</xsl:for-each>
<!-- dc.subject.other -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element[@name='other']/doc:element/doc:field[@name='value']">
				<dc:subject><xsl:value-of select="." /></dc:subject>
			</xsl:for-each>
			
<!-- dc.subject.classification -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element[@name='classification']/doc:element/doc:field[@name='value']">
			
				<xsl:variable name="text" select="." />
				<!-- se hace split sobre la variable y agrega los elementos, max 3 -->
				<xsl:choose>
					<xsl:when test="contains($text, '::')">                
						<dc:subject>info:eu-repo/classification/cti/<xsl:value-of select="substring-before($text,'::')"/></dc:subject>
						<xsl:variable name="campo" select="substring-after($text,'::')"/>
						<xsl:choose>
								<xsl:when test="contains($campo,'::')">
									<dc:subject>info:eu-repo/classification/cti/<xsl:value-of select="substring-before($campo,'::')"/></dc:subject>
									<xsl:variable name="disciplina" select="substring-after($campo,'::')"/>
									<xsl:choose>
										<xsl:when test="'$disciplina' = ''"/>
										<xsl:otherwise>
											<dc:subject>info:eu-repo/classification/cti/<xsl:value-of select="$disciplina"/></dc:subject>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="'$campo' = ''"/>
										<xsl:otherwise>
											<dc:subject>info:eu-repo/classification/cti/<xsl:value-of select="$campo"/></dc:subject>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
						</xsl:choose>	
				
					</xsl:when>
					<xsl:otherwise>
						<dc:subject>info:eu-repo/classification/cti/<xsl:value-of select="."/></dc:subject>
					</xsl:otherwise>
				
				</xsl:choose>

			</xsl:for-each>
			
<!-- dc.identificator 
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identificator']/doc:element/doc:field[@name='value']">
				<dc:subject>info:eu-repo/classification/cti/<xsl:value-of select="." /></dc:subject>
			</xsl:for-each>
			-->
			
<!-- dc.identifier -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element/doc:field[@name='value']">
				<dc:identifier><xsl:value-of select="." /></dc:identifier>
			</xsl:for-each>
<!-- dc.identifier.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element/doc:element/doc:field[@name='value']">
				<dc:identifier><xsl:value-of select="." /></dc:identifier>
			</xsl:for-each>
			<!-- dc.description -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element/doc:field[@name='value']">
				<dc:description><xsl:value-of select="." /></dc:description>
			</xsl:for-each>
			<!-- dc.description.* (not provenance)-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name!='provenance']/doc:element/doc:field[@name='value']">
				<dc:description><xsl:value-of select="." /></dc:description>
			</xsl:for-each>
			<!-- dc.date ->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element/doc:field[@name='value']">
				<dc:date><xsl:value-of select="." /></dc:date>
			</xsl:for-each>
			-->
<!-- dc.date.issued -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='issued']/doc:element/doc:field[@name='value']">
				<dc:date><xsl:value-of select="." /></dc:date>
			</xsl:for-each>
<!-- dc.type -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:field[@name='value']">
				<xsl:variable name="tipo" select="."/>
					<xsl:choose >
						<xsl:when test="contains($tipo,'Maestría')">
							<dc:type>info:eu-repo/semantics/masterThesis</dc:type>
						</xsl:when>
						<xsl:when test="contains($tipo,'Doctoral')">
							<dc:type>info:eu-repo/semantics/doctoralThesis</dc:type>
						</xsl:when>
						<xsl:when test="contains($tipo,'Artículo')">
							<dc:type>info:eu-repo/semantics/article</dc:type>
						</xsl:when>
						<xsl:when test="contains($tipo,'Licenciatura')">
							<dc:type>info:eu-repo/semantics/bachelorThesis</dc:type>
						</xsl:when>
						<xsl:otherwise>
							<dc:type><xsl:value-of select="$tipo"/></dc:type>
						</xsl:otherwise>
					</xsl:choose>
			</xsl:for-each>
			
			<!-- dc.type.conacyt 
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element[@name='conacyt']/doc:element/doc:field[@name='value']">
				<dc:type>info:eu-repo/semantics/<xsl:value-of select="." /></dc:type>
			</xsl:for-each>
			-->
			<!-- dc.type.* 
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:element/doc:field[@name='value']">
				<dc:type><xsl:value-of select="." /></dc:type>
			</xsl:for-each>
			-->
			<!-- dc.identifier
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element/doc:field[@name='value']">
				<dc:identifier><xsl:value-of select="." /></dc:identifier>
			</xsl:for-each>
			 -->
<!-- dc.identifier.citation -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='citation']/doc:element/doc:field[@name='value']">
				<dc:identifier><xsl:value-of select="." /></dc:identifier>
			</xsl:for-each>
			<!-- dc.language -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element/doc:field[@name='value']">
				<dc:language><xsl:value-of select="." /></dc:language>
			</xsl:for-each>
			<!-- dc.language.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element/doc:element/doc:field[@name='value']">
				<dc:language><xsl:value-of select="." /></dc:language>
			</xsl:for-each>
			<!-- dc.relation -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element/doc:field[@name='value']">
				<dc:relation><xsl:value-of select="." /></dc:relation>
			</xsl:for-each>
			<!-- dc.relation.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element/doc:element/doc:field[@name='value']">
				<dc:relation><xsl:value-of select="." /></dc:relation>
			</xsl:for-each>
<!-- dc.rights.uri -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element[@name='uri']/doc:element/doc:field[@name='value']">
				<dc:rights><xsl:value-of select="." /></dc:rights>
			</xsl:for-each>
<!-- dc.rights.access -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element[@name='access']/doc:element/doc:field[@name='value']">
				<xsl:variable name="acceso" select="."/>
				<xsl:choose>
					<xsl:when test="contains($acceso,'Abierto')">
						<dc:rights>info:eu-repo/semantics/openAccess</dc:rights>
					</xsl:when>
					<xsl:when test="contains($acceso,'mbarg')">
						<dc:rights>info:eu-repo/semantics/embargoedAccess</dc:rights>
					</xsl:when>
					<xsl:otherwise>
						<dc:rights>info:eu-repo/semantics/<xsl:value-of select="." /></dc:rights>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
<!-- dc.audience -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='audience']/doc:element/doc:field[@name='value']">
				<dc:audience><xsl:value-of select="." /></dc:audience>
			</xsl:for-each>
			<!-- dc.format -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='format']/doc:element/doc:field[@name='value']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>
			<!-- dc.format.* 
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='format']/doc:element/doc:element/doc:field[@name='value']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>
			-->
			<!-- ? -->
			<xsl:for-each select="doc:metadata/doc:element[@name='bundles']/doc:element[@name='bundle']/doc:field[@name='name'][text()='ORIGINAL']/../doc:element[@name='bitstreams']/doc:element[@name='bitstream']/doc:field[@name='format']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>
			<!-- dc.coverage -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='coverage']/doc:element/doc:field[@name='value']">
				<dc:coverage><xsl:value-of select="." /></dc:coverage>
			</xsl:for-each>
			<!-- dc.coverage.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='coverage']/doc:element/doc:element/doc:field[@name='value']">
				<dc:coverage><xsl:value-of select="." /></dc:coverage>
			</xsl:for-each>
<!-- dc.publisher -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='publisher']/doc:element/doc:field[@name='value']">
				<dc:publisher>Instituto Tecnologico Nacional de México</dc:publisher>
			</xsl:for-each>
			<!-- dc.publisher.* 
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='publisher']/doc:element/doc:element/doc:field[@name='value']">
				<dc:publisher><xsl:value-of select="." /></dc:publisher>
			</xsl:for-each>
			-->
			<!-- dc.source -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='source']/doc:element/doc:field[@name='value']">
				<dc:source><xsl:value-of select="." /></dc:source>
			</xsl:for-each>
			<!-- dc.source.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='source']/doc:element/doc:element/doc:field[@name='value']">
				<dc:source><xsl:value-of select="." /></dc:source>
			</xsl:for-each>
		</oai_dc:dc>
	
	</xsl:template>
	
   
</xsl:stylesheet>
