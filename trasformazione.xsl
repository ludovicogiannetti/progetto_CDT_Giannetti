<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="tei xs">

    <xsl:output method="html" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" 
                doctype-system="about:legacy-compat"
                html-version="5"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <!-- Variabili globali -->
    <xsl:variable name="doc-title" select="'Edizione Digitale - Giovanni Verga'"/>
    
    <!-- Template principale -->
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="$doc-title"/></title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" href="style.css" />
                <script src="script.js"></script>
            </head>
            <body>
                <nav>
                    <div class="navbar">

                        <div class="logo_container">
                            <img src="img/stemma_unipi.svg.png" alt="Logo Unipi"/>
                        </div>
                        
                        <ul class="sec_container">
                            <li>
                                <a href="#articolo_1">L'inchiesta agraria</a>
                            </li>
                            <li>
                                <a href="#articolo_2">La roba</a>
                            </li>
                            <li>
                                <a href="#bibliografia">Bibliografia</a>
                            </li>
                            <li>
                                <a href="#notizie">Notizie</a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <h1>LA RASSEGNA SETTIMANALE DI POLITICA, SCIENZE, LETTERE ED ARTI in versione digitale</h1>
                
                <hr/>
                
                <xsl:variable name="articolo1" select="/tei:TEI/tei:text//tei:div[@type='article'][1]"/>
                <xsl:variable name="articolo2" select="/tei:TEI/tei:text//tei:div[@type='article'][2]"/>
                <xsl:variable name="bibliografia" select="/tei:TEI/tei:text//tei:div[@type='bibliography']"/>
                <xsl:variable name="notizie" select="/tei:TEI/tei:text//tei:div[@type='news']"/>

                <!-- PRIMO ARTICOLO: Inchiesta Agraria (pg1, pg2) -->
                <div class="containers">
                    <!-- BANNER DEI FILTRI -->
                    <div class="filter-banner">
                        <h3>Evidenzia per categoria:</h3>
                        
                        <div class="filter-group">
                            <button class="main-filter-btn active" data-filter="all">Rimuovi filtri</button>
                        </div>
                        
                        <!-- Filtri principali -->
                        <div class="filter-buttons">
                            <div class="filter-group">
                                <h4>Natura e ambiente</h4>
                                <button class="main-filter-btn" data-filter="natural">Elementi Naturali</button>
                                <button class="main-filter-btn" data-filter="fauna">Animali</button>
                                <button class="main-filter-btn" data-filter="agriculture">Agricoltura</button>
                            </div>
                            <div class="filter-group">
                                <h4>Società e cultura</h4>
                                <button class="main-filter-btn" data-filter="person">Persone</button>
                                <button class="main-filter-btn" data-filter="place">Luoghi</button>
                                <button class="main-filter-btn" data-filter="organization">Organizzazioni</button>
                                <button class="main-filter-btn" data-filter="occupation">Mestieri</button>
                                <button class="main-filter-btn" data-filter="activity">Attività</button>
                                <button class="main-filter-btn" data-filter="literary">Letteratura</button>
                                <button class="main-filter-btn" data-filter="discipline">Disciplina</button>
                            </div>
                            <div class="filter-group">
                                <h4>Economia e ricchezza</h4>
                                <button class="main-filter-btn" data-filter="wealth">La Roba</button>
                                <button class="main-filter-btn" data-filter="currency">Valuta</button>
                            </div>
                            <div class="filter-group">
                                <h4>Tempo e numeri</h4>
                                <button class="main-filter-btn" data-filter="time">Tempo</button>
                                <button class="main-filter-btn" data-filter="date">Date</button>
                                <button class="main-filter-btn" data-filter="number">Numeri</button>
                            </div>
                            <div class="filter-group">
                                <h4>Testo e discorso</h4>
                                <button class="main-filter-btn" data-filter="dialogue">Discorsi diretti</button>
                                <button class="main-filter-btn" data-filter="correction">Correzioni</button>
                                <button class="main-filter-btn" data-filter="inquiry">Inchiesta</button>
                            </div>
                            <div class="filter-group">
                                <h4>Cibo</h4>
                                <button class="main-filter-btn" data-filter="food-drink">Cibo e Bevande</button>
                            </div>
                            
                        </div>
                        <div id="subfilter-banner" class="subfilter-banner" style="display: none;">
                            <h4 id="subfilter-title"></h4>
                            <div id="subfilter-buttons" class="subfilter-buttons"></div>
                        </div>
                    </div>
                    <div id="articolo_1" class="main-container" data-article="1">
                        <div class="article-title" id="articolo_1_title">
                            <h2><xsl:value-of select="$articolo1/tei:head"/></h2>
                        </div> 
                        <div class="page-navigation" data-article="1">
                        
                            <div class="styled-wrapper">
                                <button class="button nav-prev" data-article="1" data-target-page="1">
                                    <div class="button-box">
                                        <span class="button-elem">
                                            <svg
                                                viewBox="0 0 24 24"
                                                xmlns="http://www.w3.org/2000/svg"
                                                class="arrow-icon"
                                                >
                                                <path
                                                    fill="black"
                                                    d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"
                                                    ></path>
                                            </svg>
                                        </span>
                                        <span class="button-elem">
                                            <svg
                                                fill="black"
                                                viewBox="0 0  24 24"
                                                xmlns="http://www.w3.org/2000/svg"
                                                class="arrow-icon"
                                                >
                                                <path
                                                    d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"
                                                    ></path>
                                            </svg>
                                        </span>
                                    </div>
                                </button>
                                <span class="naviga">
                                    <p>Naviga tra le pagine</p>
                                </span>
                                <button class="button nav-next" data-article="1" data-target-page="2">
                                    <div class="button-box">
                                        <span class="button-elem right">
                                            <svg
                                                viewBox="0 0 24 24"
                                                xmlns="http://www.w3.org/2000/svg"
                                                class="arrow-icon"
                                                >
                                                <path
                                                    fill="black"
                                                    d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"
                                                    ></path>
                                            </svg>
                                        </span>
                                        <span class="button-elem right">
                                            <svg
                                                fill="black"
                                                viewBox="0 0  24 24"
                                                xmlns="http://www.w3.org/2000/svg"
                                                class="arrow-icon"
                                                >
                                                <path
                                                    d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"
                                                    ></path>
                                            </svg>
                                        </span>
                                    </div>
                                </button>
                            </div>
                        </div>

                        <div class="page-container">
                            
                            <div class="left-column">
                                <xsl:for-each select="$articolo1/tei:pb">
                                    <xsl:variable name="pb-num" select="@n"/>
                                    <xsl:variable name="surface-id" select="concat('pg', $pb-num)"/>
                                    <xsl:variable name="surface" select="/tei:TEI/tei:facsimile/tei:surface[@xml:id = $surface-id]"/>
                                    
                                    <div class="image-container {if(position()=1) then 'active' else ''}"
                                         data-surface="{$surface-id}"
                                         data-page="{position()}">
                                        <xsl:call-template name="render-surface">
                                            <xsl:with-param name="surface" select="$surface"/>
                                        </xsl:call-template>
                                    </div>
                                </xsl:for-each>
                            </div>
                            
                            <div class="right-column">
                                <xsl:for-each select="$articolo1/tei:pb">
                                    <xsl:variable name="currentPb" select="."/>
                                    <xsl:variable name="pageNum" select="position()"/>
                                    <xsl:variable name="nextPb" select="following-sibling::tei:pb[1]"/>
                                    
                                    <xsl:variable name="pageContent" 
                                        select="following-sibling::node()
                                            [not(self::tei:pb) and not(self::tei:head)]
                                            [following-sibling::tei:pb[1] = $nextPb
                                                or (not($nextPb) and preceding-sibling::tei:pb[1] = $currentPb)]"/>
                                    
                                    <div class="text-container" data-page="{$pageNum}">
                                        <div class="text-block-nav">
                                            <button class="nav-block-prev" title="Paragrafo precedente">↑</button>
                                            <span class="block-counter">
                                                <span class="info-block">
                                                    <p>Naviga tra i paragrafi</p>
                                                </span>
                                            </span>
                                            <button class="nav-block-next" title="Paragrafo successivo">↓</button>
                                        </div>
                                        
                                        <div class="contenuto-testo" data-page="{$pageNum}">
                                            
                                            <xsl:apply-templates select="$pageContent"/>
                                        </div>

                                    </div>
                                    
                                </xsl:for-each>
                            </div>

                        </div>
                    </div>
                    
                    <hr/>
                    
                    <!-- SECONDO ARTICOLO: La Roba (pg3, pg4) -->
                    <div id="articolo_2" class="main-container" data-article="2">
                        <div class="article-title" id="art1icolo_2_title">
                            <h2><xsl:value-of select="$articolo2/tei:head"/></h2>
                        </div>
                        
                        <div class="page-navigation" data-article="2">
                            
                            <div class="styled-wrapper">
                                <button class="button nav-prev" data-article="2" data-target-page="1">
                                    <div class="button-box">
                                        <span class="button-elem">
                                            <svg
                                                viewBox="0 0 24 24"
                                                xmlns="http://www.w3.org/2000/svg"
                                                class="arrow-icon"
                                                >
                                                <path
                                                    fill="black"
                                                    d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"
                                                    ></path>
                                            </svg>
                                        </span>
                                        <span class="button-elem">
                                            <svg
                                                fill="black"
                                                viewBox="0 0  24 24"
                                                xmlns="http://www.w3.org/2000/svg"
                                                class="arrow-icon"
                                                >
                                                <path
                                                    d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"
                                                    ></path>
                                            </svg>
                                        </span>
                                    </div>
                                </button>
                                <span class="naviga">
                                    <p>Naviga tra le pagine</p>
                                </span>
                                <button class="button nav-next" data-article="2" data-target-page="2">
                                    <div class="button-box">
                                        <span class="button-elem right">
                                            <svg
                                                viewBox="0 0 24 24"
                                                xmlns="http://www.w3.org/2000/svg"
                                                class="arrow-icon"
                                                >
                                                <path
                                                    fill="black"
                                                    d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"
                                                    ></path>
                                            </svg>
                                        </span>
                                        <span class="button-elem right">
                                            <svg
                                                fill="black"
                                                viewBox="0 0  24 24"
                                                xmlns="http://www.w3.org/2000/svg"
                                                class="arrow-icon"
                                                >
                                                <path
                                                    d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"
                                                    ></path>
                                            </svg>
                                        </span>
                                    </div>
                                </button>
                            </div>
                        </div>
                        
                        <div class="page-container">
                            <div class="left-column">
                                <xsl:for-each select="$articolo2/tei:pb">
                                    <xsl:variable name="pb-num" select="@n"/>
                                    <xsl:variable name="surface-id" select="concat('pg', $pb-num)"/>
                                    <xsl:variable name="surface" select="/tei:TEI/tei:facsimile/tei:surface[@xml:id = $surface-id]"/>
                                    
                                    <div class="image-container {if(position()=1) then 'active' else ''}"
                                         data-surface="{$surface-id}"
                                         data-page="{position()}">
                                        <xsl:call-template name="render-surface">
                                            <xsl:with-param name="surface" select="$surface"/>
                                        </xsl:call-template>
                                    </div>
                                </xsl:for-each>
                            </div>
                            
                            <div class="right-column">
                                <xsl:for-each select="$articolo2/tei:pb">
                                    <xsl:variable name="currentPb" select="."/>
                                    <xsl:variable name="pageNum" select="position()"/>
                                    <xsl:variable name="nextPb" select="following-sibling::tei:pb[1]"/>
                                    
                                    <xsl:variable name="pageContent" 
                                        select="following-sibling::node()
                                            [not(self::tei:pb) and not(self::tei:head)]
                                            [following-sibling::tei:pb[1] = $nextPb
                                                or (not($nextPb) and preceding-sibling::tei:pb[1] = $currentPb)]"/>
                                    
                                    <div class="text-container" data-page="{$pageNum}">
                                        <div class="text-block-nav">
                                            <button class="nav-block-prev" title="Paragrafo precedente">↑</button>
                                            <span class="block-counter">
                                                <span class="info-block">
                                                    <p>Naviga tra i paragrafi</p>
                                                </span>
                                            </span>
                                            <button class="nav-block-next" title="Paragrafo successivo">↓</button>
                                        </div>
                                        
                                        <div class="contenuto-testo" data-page="{$pageNum}">
                                            <xsl:apply-templates select="$pageContent"/>
                                        </div>

                                    </div>
                                </xsl:for-each>
                            </div>
                        </div>
                    </div> 
                    <hr/>

                    <!-- BIBLIOGRAFIA -->
                    <div id="bibliografia" class="main-container" data-article="3">
                        <div style="display: none;">
                            <div id="bib-head-1">
                                <xsl:apply-templates select="$bibliografia//tei:div[@type='biblItem'][1]/tei:head[@type='bibliography-title']"/>
                            </div>
                            <div id="bib-head-2">
                                <xsl:apply-templates select="$bibliografia//tei:div[@type='biblItem'][2]/tei:head[@type='bibliography-title']"/>
                            </div>
                        </div>
                        
                        <div class="page-navigation" data-article="3">
                            <div class="styled-wrapper">
                                <button class="button nav-prev" data-article="3" data-target-page="1">
                                    <div class="button-box">
                                        <span class="button-elem">
                                            <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="arrow-icon">
                                                <path fill="black" d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"></path>
                                            </svg>
                                        </span>
                                        <span class="button-elem">
                                            <svg fill="black" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="arrow-icon">
                                                <path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"></path>
                                            </svg>
                                        </span>
                                    </div>
                                </button>
                                <span class="naviga">
                                    <p>Naviga tra le pagine</p>
                                </span>
                                <button class="button nav-next" data-article="3" data-target-page="2">
                                    <div class="button-box">
                                        <span class="button-elem right">
                                            <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="arrow-icon">
                                                <path fill="black" d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"></path>
                                            </svg>
                                        </span>
                                        <span class="button-elem right">
                                            <svg fill="black" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="arrow-icon">
                                                <path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"></path>
                                            </svg>
                                        </span>
                                    </div>
                                </button>
                            </div>
                        </div>
                        
                        <div class="page-container">
                            <div class="left-column">
                                <xsl:for-each select="$bibliografia//tei:pb">
                                    <xsl:variable name="pb-num" select="@n"/>
                                    <xsl:variable name="surface-id" select="concat('pg', $pb-num)"/>
                                    <xsl:variable name="surface" select="/tei:TEI/tei:facsimile/tei:surface[@xml:id = $surface-id]"/>
                                    
                                    <div class="image-container {if(position()=1) then 'active' else ''}"
                                         data-surface="{$surface-id}"
                                         data-page="{position()}">
                                        <xsl:call-template name="render-surface">
                                            <xsl:with-param name="surface" select="$surface"/>
                                        </xsl:call-template>
                                    </div>
                                </xsl:for-each>
                            </div>
                            
                            <div class="right-column">
                                <xsl:for-each select="$bibliografia//tei:pb">
                                    <div class="text-container" data-page="{position()}">
                                        <div class="text-block-nav">
                                            <button class="nav-block-prev" title="Paragrafo precedente">↑</button>
                                            <span class="block-counter">
                                                <span class="info-block">
                                                    <p>Naviga tra i paragrafi</p>
                                                </span>
                                            </span>
                                            <button class="nav-block-next" title="Paragrafo successivo">↓</button>
                                        </div>
                                        <div class="contenuto-testo" data-page="{position()}">
                                        
                                            <xsl:variable name="currentPb" select="."/>
                                            
                                            <xsl:for-each select="$currentPb/parent::tei:p[@part='Y']">
                                                <div class="text-block" id="{substring-after(@corresp, '#')}-cont" data-continued-from="{substring-after(@corresp, '#')}">
                                                    <xsl:apply-templates select="node()[. &gt;&gt; $currentPb]"/>
                                                </div>
                                            </xsl:for-each>
                                            
                                            <xsl:for-each select="key('p-by-pb', generate-id($currentPb))">
                                                <xsl:choose>
                                                    <xsl:when test="@part='Y'">
                                                        <div class="text-block" id="{substring-after(@corresp, '#')}">
                                                            <xsl:variable name="innerPb" select="tei:pb[1]"/>
                                                            <xsl:apply-templates select="node()[. &lt;&lt; $innerPb]"/>
                                                        </div>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <div class="text-block" id="{substring-after(@corresp, '#')}">
                                                            <xsl:apply-templates select="node()"/>
                                                        </div>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:for-each>
                                        </div>
                                    </div>
                                </xsl:for-each>
                                <div style="display: none;">
                                    <div id="bib-note-z30">
                                        <xsl:apply-templates select="$bibliografia//tei:div[@type='biblItem'][2]/tei:note[@place='foot']"/>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <hr/>
                    
                    <!-- NOTIZIE -->
                    <div id="notizie" class="main-container" data-article="4">
                        <div class="article-title" id="notizie_title">
                            <h2><xsl:value-of select="$notizie/tei:head"/></h2>
                        </div>
                        
                        <div class="page-navigation" data-article="4">
                            <div class="styled-wrapper">
                                <button class="button nav-prev" data-article="4" data-target-page="1">
                                    <div class="button-box">
                                        <span class="button-elem">
                                            <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="arrow-icon">
                                                <path fill="black" d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"></path>
                                            </svg>
                                        </span>
                                        <span class="button-elem">
                                            <svg fill="black" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="arrow-icon">
                                                <path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"></path>
                                            </svg>
                                        </span>
                                    </div>
                                </button>
                                <span class="naviga">
                                    <p>Naviga tra le pagine</p>
                                </span>
                                <button class="button nav-next" data-article="4" data-target-page="2">
                                    <div class="button-box">
                                        <span class="button-elem right">
                                            <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="arrow-icon">
                                                <path fill="black" d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"></path>
                                            </svg>
                                        </span>
                                        <span class="button-elem right">
                                            <svg fill="black" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="arrow-icon">
                                                <path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"></path>
                                            </svg>
                                        </span>
                                    </div>
                                </button>
                            </div>
                        </div>
                        
                        <div class="page-container">
                            <div class="left-column">
                                <xsl:for-each select="$notizie//tei:pb">
                                    <xsl:variable name="pb-num" select="@n"/>
                                    <xsl:variable name="surface-id" select="concat('pg', $pb-num)"/>
                                    <xsl:variable name="surface" select="/tei:TEI/tei:facsimile/tei:surface[@xml:id = $surface-id]"/>
                                    
                                    <div class="image-container {if(position()=1) then 'active' else ''}"
                                         data-surface="{$surface-id}"
                                         data-page="{position()}">
                                        <xsl:call-template name="render-surface">
                                            <xsl:with-param name="surface" select="$surface"/>
                                        </xsl:call-template>
                                    </div>
                                </xsl:for-each>
                            </div>
                            
                            <div class="right-column">
                                
                                <xsl:variable name="pbNum" select="$notizie//tei:pb[1]/@n"/>
                                <xsl:variable name="surface" select="/tei:TEI/tei:facsimile/tei:surface[@xml:id = concat('pg', $pbNum)]"/>
                                <xsl:variable name="zones" select="$surface/tei:zone"/>
                                
                                <!-- Un unico contenitore per tutti gli elementi (una sola pagina) -->
                                <div class="text-container" data-page="1">
                                    <div class="text-block-nav">
                                        <button class="nav-block-prev" title="Paragrafo precedente">↑</button>
                                        <span class="block-counter">
                                            <span class="info-block">
                                                <p>Naviga tra i paragrafi</p>
                                            </span>
                                        </span>
                                        <button class="nav-block-next" title="Paragrafo successivo">↓</button>
                                    </div>
                                    
                                    <div class="contenuto-testo" data-page="1">
                                        <xsl:apply-templates select="$notizie/tei:head"/>

                                        <xsl:for-each select="$notizie/tei:list[@type='news_items']/tei:item">
                                            <xsl:variable name="pos" select="position()"/>
                                            
                                            <xsl:variable name="zoneId" select="$zones[$pos]/@xml:id"/>
                                            <div class="text-block" id="{$zoneId}">
                                                <xsl:apply-templates select="node()"/>
                                            </div>
                                        </xsl:for-each>
                                        
                                        <xsl:if test="$notizie/tei:div[@type='imprint']">
                                                <xsl:apply-templates select="$notizie/tei:div[@type='imprint']"/>
                                        </xsl:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sezione informativa sul progetto -->
                <div class="project-info">
                    <!-- Titolo, pubblicazione e responsabile -->
                    <div class="info-header">
                        <h3>Informazioni sul progetto</h3>
                        <div class="project-meta">
                            <span class="project-title">
                                <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                            </span>
                            
                            <span class="project-resp">
                                <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:resp"/>
                                <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:persName"/>
                            </span>
                            <span claproject-puss="b">
                                <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher"/>
                                , <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:pubPlace"/>
                                (<xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>)
                            </span>
                        </div>
                    </div>
                    
                    <!-- Descrizione del progetto -->
                    <div class="info-section">
                        <h4>Descrizione del progetto</h4>
                        <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:encodingDesc/tei:projectDesc/tei:p"/>
                    </div>
                    
                    <!-- Pratiche editoriali -->
                    <div class="info-section">
                        <h4>Pratiche editoriali</h4>
                        <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:encodingDesc/tei:editorialDecl/*"/>
                    </div>
                    
                    <!-- Div laterale con l'elenco dei tag usati -->
                    <div class="tags-list">
                        <h3>Tag TEI utilizzati</h3>
                        <ul>
                            <xsl:for-each select="/tei:TEI/tei:teiHeader/tei:encodingDesc/tei:tagsDecl/tei:namespace/tei:tagUsage">
                                <li>
                                    <strong><code>&lt;<xsl:value-of select="@gi"/>&gt;</code></strong>
                                    <span class="tag-desc"><xsl:value-of select="."/></span>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    
                    <!-- Fonte -->
                    <div class="info-section">
                        <h4>Fonte</h4>
                        <div class="source-content">
                            <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct"/>
                        </div>
                    </div>

                </div>
            </body>
        </html>
    </xsl:template>
    
    
    
    <xsl:template match="tei:lb">
        <br/>
        <sup class="line-number" title="Linea {@n}">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>]</xsl:text>
        </sup>
    </xsl:template>
    
    <xsl:template match="tei:head[@type='bibliography-title']">
        <h3 class="bib-title" id="head-{../@xml:id}" style="display:none">
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='article']//tei:p">
        <xsl:choose>
            <xsl:when test="@part='Y'">
                
                <xsl:variable name="pb" select="tei:pb[1]"/>
                
                <!-- Testo prima del pb -->
                <div class="text-block" id="{substring-after(@corresp, '#')}">
                    <xsl:apply-templates select="node()[. &lt;&lt; $pb]"/>
                </div>
                
                <!-- Testo dopo il pb -->
                <div class="text-block" id="{substring-after(@corresp, '#')}-cont"
                     data-continued-from="{substring-after(@corresp, '#')}">
                    <xsl:apply-templates select="node()[. &gt;&gt; $pb]"/>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="text-block" id="{substring-after(@corresp, '#')}">
                    <xsl:apply-templates/>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend='italic'"><i><xsl:apply-templates/></i></xsl:when>
            <xsl:when test="@rend='bold'"><b><xsl:apply-templates/></b></xsl:when>
            <xsl:otherwise><span><xsl:apply-templates/></span></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:ref">
        <a href="{@target}" target="_blank"><xsl:apply-templates/></a>
    </xsl:template>
    
    
    <xsl:key name="persone" match="tei:person" use="@xml:id"/>
    <xsl:key name="luoghi" match="tei:place" use="@xml:id"/>
    <xsl:key name="organizzazioni" match="tei:org" use="@xml:id"/>
    <xsl:key name="p-by-pb" match="tei:p" use="generate-id(preceding::tei:pb[1])" />
    
    <xsl:template match="tei:persName">
        <xsl:variable name="person-id" select="substring-after(@corresp, '#')"/>
        
        <xsl:choose>
            <xsl:when test="$person-id != ''">
                <xsl:variable name="person" select="key('persone', $person-id)"/>
                
                <xsl:choose>
                    <xsl:when test="$person">
                        
                        <xsl:variable name="isFictional">
                            <xsl:choose>
                                <xsl:when test="$person/@type='fictional' or contains($person/tei:persName/tei:forename, 'Mazzarò')">true</xsl:when>
                                <xsl:otherwise>false</xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="nome">
                            <xsl:value-of select="concat($person/tei:persName/tei:forename, ' ', $person/tei:persName/tei:surname)"/>
                        </xsl:variable>
                        
                        <xsl:variable name="tooltip">
                            <xsl:value-of select="$nome"/>
                            <xsl:if test="$person/tei:birth or $person/tei:death">
                                <xsl:text> (</xsl:text>
                                <xsl:if test="$person/tei:birth">
                                    <xsl:if test="$person/tei:birth/tei:placeName">
                                        <xsl:value-of select="$person/tei:birth/tei:placeName"/>
                                        <xsl:text>, </xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select="$person/tei:birth/@when"/>
                                </xsl:if>
                                <xsl:if test="$person/tei:birth and $person/tei:death">
                                    <xsl:text> - </xsl:text>
                                </xsl:if>
                                <xsl:if test="$person/tei:death">
                                    <xsl:if test="$person/tei:death/tei:placeName">
                                        <xsl:value-of select="$person/tei:death/tei:placeName"/>
                                        <xsl:text>, </xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select="$person/tei:death/@when"/>
                                </xsl:if>
                                <xsl:text>)</xsl:text>
                            </xsl:if>
                            <xsl:if test="$person/tei:note">
                                <xsl:text> - </xsl:text>
                                <xsl:value-of select="normalize-space($person/tei:note)"/>
                            </xsl:if>
                        </xsl:variable>
                        
                        <xsl:choose>
                            
                            <xsl:when test="$isFictional='true'">
                                <span class="person fictional" data-info="{$tooltip}">
                                    <xsl:apply-templates/>
                                </span>
                            </xsl:when>
                            
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="$person/tei:ptr">
                                        <a href="{$person/tei:ptr/@target}" 
                                           target="_blank" 
                                           rel="noopener noreferrer"
                                           class="person historical has-wiki"
                                           data-category="person"
                                           data-role="{@role}"
                                           data-info="{$tooltip}"
                                           data-wiki="{$person/tei:ptr/@target}">
                                            <xsl:apply-templates/>
                                        </a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <span class="person historical no-wiki" data-info="{$tooltip}" data-category="person" data-role="{@role}">
                                            <xsl:apply-templates/>
                                        </span>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    
                    <xsl:otherwise>
                        <span class="person warning" title="Personaggio non trovato nel back">
                            <xsl:apply-templates/>
                        </span>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            
            <xsl:otherwise>
                <span class="person generic" 
                      data-info="{if (@role) then concat('Ruolo: ', @role) else 'Personaggio'}">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:placeName">
        <xsl:variable name="place-id" select="substring-after(@corresp, '#')"/>
        
        <xsl:choose>
            <xsl:when test="$place-id != ''">
                <xsl:variable name="luogo" select="key('luoghi', $place-id)"/>
                
                <xsl:choose>
                    <xsl:when test="$luogo">
                        
                        <xsl:variable name="tooltip">
                            <xsl:value-of select="$luogo/tei:placeName"/>
                            <xsl:if test="$luogo/tei:country or $luogo/tei:region or $luogo/tei:settlement">
                                <xsl:text> (</xsl:text>
                                <xsl:if test="$luogo/tei:settlement">
                                    <xsl:value-of select="$luogo/tei:settlement"/>
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <xsl:if test="$luogo/tei:region">
                                    <xsl:value-of select="$luogo/tei:region"/>
                                    <xsl:if test="$luogo/tei:region and $luogo/tei:country">
                                        <xsl:text>, </xsl:text>
                                    </xsl:if>
                                </xsl:if>
                                <xsl:value-of select="$luogo/tei:country"/>
                                <xsl:text>)</xsl:text>
                            </xsl:if>
                            <xsl:if test="$luogo/tei:note">
                                <xsl:text> – </xsl:text>
                                <xsl:value-of select="normalize-space($luogo/tei:note)"/>
                            </xsl:if>
                        </xsl:variable>
                        
                        <xsl:choose>
                            <xsl:when test="$luogo/tei:ptr">
                                <a href="{$luogo/tei:ptr/@target}" 
                                   target="_blank" 
                                   rel="noopener noreferrer"
                                   class="place has-wiki"
                                   data-category="place"
                                   data-type="{@type}"
                                   data-info="{$tooltip}"
                                   data-place-id="{$place-id}">
                                    <xsl:apply-templates/>
                                </a>
                            </xsl:when>
                            <xsl:otherwise>
                                <span class="place no-wiki" 
                                      data-info="{$tooltip}"
                                      data-category="place"
                                      data-type="{@type}"
                                      data-place-id="{$place-id}">
                                    <xsl:apply-templates/>
                                </span>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    
                    <xsl:otherwise>
                        <span class="place warning" title="Luogo non trovato nel back">
                            <xsl:apply-templates/>
                        </span>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            
            <xsl:otherwise>
                <span class="place" 
                      data-info="{if (@type) then concat('Luogo: ', @type) else 'Località'}">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Numeri (tag tei:num) -->
    <xsl:template match="tei:num">
        <span class="number filterable" 
              data-type="{@type}" 
              data-value="{@value}"
              data-category="number"
              title="Numero: {@value}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- Discorsi diretti (tag tei:q) -->
    <xsl:template match="tei:q">
        <q class="dialogue filterable" 
           data-type="spoken"
           data-category="dialogue"
           title="Discorso diretto">
            <xsl:apply-templates/>
        </q>
    </xsl:template>
    
    <xsl:template match="tei:date">
        <span class="date filterable" 
              data-category="date"
              data-value="{@when}"
              data-period="{@period}"
              title="Data: {@when}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- Template unico per tei:term e tei:rs -->
    <xsl:template match="tei:term | tei:rs">
        <xsl:variable name="type" select="@type"/>
        <xsl:variable name="subtype" select="@subtype"/>
        
        
        <xsl:variable name="category">
            <xsl:choose>
                <xsl:when test="$subtype = 'wealth'">wealth</xsl:when>
                <xsl:when test="$subtype = 'agriculture'">agriculture</xsl:when>
                <xsl:when test="$subtype = 'literary'">literary</xsl:when>
                <xsl:when test="$type = 'literary'">literary</xsl:when>
                <xsl:when test="$type = 'natural'">natural</xsl:when>
                <xsl:when test="$type = 'fauna'">fauna</xsl:when>
                <xsl:when test="$type = 'occupation'">occupation</xsl:when>
                <xsl:when test="$type = 'activity'">activity</xsl:when>
                <xsl:when test="$type = 'time'">time</xsl:when>
                <xsl:when test="$type = 'food_drink'">food-drink</xsl:when>
                <xsl:when test="$type = 'currency'">currency</xsl:when>
                <xsl:when test="$type = 'discipline'">discipline</xsl:when>
                <xsl:when test="$type = 'inquiry'">inquiry</xsl:when>
                <xsl:otherwise>term</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="tooltip">
            <xsl:choose>
                <xsl:when test="$subtype">
                    <xsl:value-of select="$subtype"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$type"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <span class="term filterable {$category}" 
              data-type="{$type}"
              data-subtype="{$subtype}"
              data-category="{$category}"
              data-info="{$tooltip}"
              title="{$tooltip}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:choice">
        <xsl:variable name="tipo">
            <xsl:choose>
                <xsl:when test="tei:orig">Normalizzazione</xsl:when>
                <xsl:when test="tei:sic">Correzione</xsl:when>
                <xsl:when test="tei:abbr">Abbreviazione</xsl:when>
                <xsl:otherwise>Variante</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="originale">
            <xsl:choose>
                <xsl:when test="tei:orig"><xsl:value-of select="tei:orig"/></xsl:when>
                <xsl:when test="tei:sic"><xsl:value-of select="tei:sic"/></xsl:when>
                <xsl:when test="tei:abbr"><xsl:value-of select="tei:abbr"/></xsl:when>
                <xsl:otherwise><xsl:apply-templates select="*[1]"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="moderno">
            <xsl:choose>
                <xsl:when test="tei:reg"><xsl:value-of select="tei:reg"/></xsl:when>
                <xsl:when test="tei:corr"><xsl:value-of select="tei:corr"/></xsl:when>
                <xsl:when test="tei:expan"><xsl:value-of select="tei:expan"/></xsl:when>
                <xsl:otherwise><xsl:value-of select="$originale"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <span class="choice-area filterable" 
              data-category="correction"
              data-orig="{$originale}" 
              data-reg="{$moderno}"
              data-tipo="{$tipo}"
              title="{$tipo}: {$originale} → {$moderno}">
            
            <xsl:apply-templates select="tei:abbr|tei:orig|tei:sic|*[1]"/>
        </span>
    </xsl:template>
    
    
    
    <!-- Firma -->
    <xsl:template match="tei:signed">
        <div class="signature" style="display: none">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Template per orgName con link Wikipedia sul nome -->
    <xsl:template match="tei:orgName">
        <xsl:variable name="org-id" select="substring-after(@corresp, '#')"/>
        
        <xsl:choose>
            <xsl:when test="$org-id != ''">
                <xsl:variable name="org" select="key('organizzazioni', $org-id)"/>
                
                <xsl:choose>
                    <xsl:when test="$org">
                        <xsl:variable name="tooltip">
                            <xsl:value-of select="$org/tei:orgName"/>
                            <xsl:if test="$org/tei:desc">
                                <xsl:text> – </xsl:text>
                                <xsl:value-of select="normalize-space($org/tei:desc)"/>
                            </xsl:if>
                        </xsl:variable>
                        
                        <xsl:choose>
                            <xsl:when test="$org/tei:ptr">
                                <a href="{$org/tei:ptr/@target}" 
                                   target="_blank" 
                                   rel="noopener noreferrer"
                                   class="organization has-wiki filterable" 
                                   data-category="organization"
                                   data-type="{@type}"
                                   data-subtype="{@subtype}"
                                   data-info="{$tooltip}"
                                   data-org-id="{$org-id}">
                                    <xsl:apply-templates/>
                                </a>
                            </xsl:when>
                            <xsl:otherwise>
                                <span class="organization no-wiki filterable" 
                                      data-category="organization"
                                      data-type="{@type}"
                                      data-subtype="{@subtype}"
                                      data-info="{$tooltip}"
                                      data-org-id="{$org-id}">
                                    <xsl:apply-templates/>
                                </span>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    
                    <xsl:otherwise>
                        <span class="organization warning filterable" 
                              data-category="organization"
                              title="Organizzazione non trovata nel back">
                            <xsl:apply-templates/>
                        </span>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            
            <xsl:otherwise>
                <span class="organization filterable" 
                      data-category="organization"
                      data-type="{@type}"
                      data-subtype="{@subtype}"
                      data-info="Istituzione: {@subtype}">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:measure">
        <xsl:variable name="tooltip">
            <xsl:choose>
                <xsl:when test="@unit and @quantity">
                    <xsl:value-of select="concat(@quantity, ' ', @unit)"/>
                </xsl:when>
                <xsl:when test="@unit">
                    <xsl:value-of select="@unit"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'Misura'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <span class="measure filterable" 
              data-category="measure"
              data-type="{@type}"
              data-unit="{@unit}"
              data-quantity="{@quantity}"
              data-info="{$tooltip}"
              title="{$tooltip}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    
    
    <xsl:template match="tei:measure[@type='currency']">
        <xsl:variable name="tooltip">
            <xsl:choose>
                <xsl:when test="@unit and @quantity">
                    <xsl:value-of select="concat(@quantity, ' ', @unit)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'Valuta'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <span class="measure currency filterable" 
              data-category="currency"
              data-type="currency"
              data-unit="{@unit}"
              data-quantity="{@quantity}"
              data-info="{$tooltip}"
              title="{$tooltip}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:title">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    <!-- Lista notizie -->
    <xsl:template match="tei:list[@type='news_items']">
        <ul class="news-list">
            <xsl:apply-templates select="tei:item"/>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <div class="text-block" id="{@xml:id}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Voce bibliografica -->
    <xsl:template match="tei:bibl">
        <div class="bibl-entry">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Nota a piè di pagina -->
    <xsl:template match="tei:note[@place='foot']">
        <div class="footnote" id="footnote-{@n}">
            <hr class="footnote-divider"/>
            <sup><xsl:value-of select="@n"/></sup>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Colofone / imprint -->
    <xsl:template match="tei:div[@type='imprint']">
        <div class="imprint">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Riferimento a rivista/giornale nelle notizie -->
    <xsl:template match="tei:ref[@type='journal']">
        <cite class="journal-ref">
            <xsl:apply-templates/>
        </cite>
    </xsl:template>
    
    <xsl:template match="tei:*">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Template per renderizzare una surface -->
    <xsl:template name="render-surface">
        <xsl:param name="surface" as="element(tei:surface)"/>
        
        <xsl:variable name="imgWidth" select="number(translate($surface/tei:graphic/@width, 'px', ''))"/>
        <xsl:variable name="imgHeight" select="number(translate($surface/tei:graphic/@height, 'px', ''))"/>
        
        <div class="image-wrapper" style="position: relative;">
            <img src="{$surface/tei:graphic/@url}" alt="Pagina {$surface/@xml:id}" style="width: 100%; height: auto; display: block;"/>
            
            <div class="zone-overlay" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                <xsl:for-each select="$surface/tei:zone">
                    <xsl:variable name="left" select="(@ulx div $imgWidth) * 100"/>
                    <xsl:variable name="top" select="(@uly div $imgHeight) * 100"/>
                    <xsl:variable name="width" select="((@lrx - @ulx) div $imgWidth) * 100"/>
                    <xsl:variable name="height" select="((@lry - @uly) div $imgHeight) * 100"/>
                    
                    <xsl:variable name="target-id">
                        <xsl:choose>
                            <xsl:when test="contains(@xml:id, '.')">
                                <xsl:value-of select="substring-before(@xml:id, '.')"/>
                            </xsl:when>
                            <xsl:when test="contains(@xml:id, '-cont')">
                                <xsl:value-of select="substring-before(@xml:id, '-cont')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@xml:id"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="group-id">
                        <xsl:choose>
                            <xsl:when test="contains(@xml:id, '.')">
                                <xsl:value-of select="substring-before(@xml:id, '.')"/>
                            </xsl:when>
                            <xsl:when test="contains(@xml:id, '-cont')">
                                <xsl:value-of select="substring-before(@xml:id, '-cont')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@xml:id"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="is-part-of-group">
                        <xsl:choose>
                            <xsl:when test="contains(@xml:id, '.') or contains(@xml:id, '-cont')">true</xsl:when>
                            <xsl:otherwise>false</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <div class="zone"
                         data-zone-id="{@xml:id}"
                         data-target="{$target-id}"
                         data-group="{$group-id}"
                         data-is-partial="{$is-part-of-group}"
                         style="position: absolute; left: {$left}%; top: {$top}%; width: {$width}%; height: {$height}%;"
                         title="Zona {@xml:id} -> Mostra paragrafo {$target-id}"/>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:biblStruct">
        <div class="bibl-struct">
            <!-- Monografia (rivista) -->
            <div class="bibl-monogr">
                <div class="bibl-title">
                    <xsl:value-of select="tei:monogr/tei:title"/>
                    <xsl:if test="tei:monogr/tei:imprint/tei:date/@when">
                        <span class="bibl-date"> (<xsl:value-of select="tei:monogr/tei:imprint/tei:date/@when"/>)</span>
                    </xsl:if>
                </div>
                <div class="bibl-details">
                    <xsl:if test="tei:monogr/tei:imprint/tei:publisher">
                        <span class="bibl-publisher"><xsl:value-of select="tei:monogr/tei:imprint/tei:publisher"/></span>
                    </xsl:if>
                    <xsl:if test="tei:monogr/tei:imprint/tei:pubPlace">
                        <span class="bibl-place"><xsl:value-of select="tei:monogr/tei:imprint/tei:pubPlace"/></span>
                    </xsl:if>
                    <xsl:if test="tei:monogr/tei:biblScope[@unit='volume']">
                        <span class="bibl-volume">Vol. <xsl:value-of select="tei:monogr/tei:biblScope[@unit='volume']"/></span>
                    </xsl:if>
                    <xsl:if test="tei:monogr/tei:biblScope[@unit='issue']">
                        <span class="bibl-issue">n. <xsl:value-of select="tei:monogr/tei:biblScope[@unit='issue']"/></span>
                    </xsl:if>
                </div>
                <xsl:if test="tei:monogr/tei:respStmt">
                    <div class="bibl-resp">
                        <xsl:value-of select="tei:monogr/tei:respStmt/tei:resp"/>:
                        <xsl:for-each select="tei:monogr/tei:respStmt/tei:name">
                            <xsl:value-of select="."/>
                            <xsl:if test="position() != last()">, </xsl:if>
                        </xsl:for-each>
                    </div>
                </xsl:if>
            </div>
            
            <!-- Articoli analitici -->
            <xsl:if test="tei:analytic">
                <div class="bibl-analytics">
                    <h5>Articoli contenuti nel fascicolo:</h5>
                    <ul>
                        <xsl:for-each select="tei:analytic">
                            <li>
                                <span class="bibl-analytic-title"><xsl:value-of select="tei:title"/></span>
                                <xsl:variable name="analyt-id" select="@xml:id"/>
                                <xsl:for-each select="../tei:monogr/tei:biblScope[@corresp = $analyt-id]">
                                    <span class="bibl-analytic-pages">, pp. <xsl:value-of select="."/></span>
                                </xsl:for-each>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
            </xsl:if>
        </div>
    </xsl:template>
    
</xsl:stylesheet>