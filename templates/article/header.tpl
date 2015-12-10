{**
 * templates/article/header.tpl
 *
 * Copyright (c) 2015 Carlos Cesar Caballero Diaz
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article View -- Header component.
 *}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}">
<head>
	<title>{$article->getLocalizedTitle()|strip_tags|escape} | {$article->getFirstAuthor(true)|strip_tags|escape} | {$currentJournal->getLocalizedTitle()|strip_tags|escape}</title>
	<meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<meta name="description" content="{$article->getLocalizedTitle()|strip_tags|escape}" />
	{if $article->getLocalizedSubject()}
		<meta name="keywords" content="{$article->getLocalizedSubject()|escape}" />
	{/if}

	{if $displayFavicon}<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />{/if}

	{include file="article/dublincore.tpl"}
	{include file="article/googlescholar.tpl"}
	{call_hook name="Templates::Article::Header::Metadata"}

	<link rel="stylesheet" href="{$pluginUrl}/css/journal.css" type="text/css" />
	{if $journalRt && $journalRt->getEnabled()}
		<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/rtEmbedded.css" type="text/css" />
	{/if}

	{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
	{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
	
	{foreach from=$stylesheets item=cssUrl}
		<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
	{/foreach}
        
        <script type="text/javascript" src="{$pluginUrl}/js/jquery.min.js"></script>
        <script type="text/javascript" src="{$pluginUrl}/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="{$pluginUrl}/js/bootstrap.min.js"></script>
        <!--script type="text/javascript" src="{$pluginUrl}/js/bootstrap-tagsinput.min.js"></script-->

	
	<!-- Compiled scripts -->
	{if $useMinifiedJavaScript}
		<script type="text/javascript" src="{$baseUrl}/js/pkp.min.js"></script>
	{else}
		{include file="common/minifiedScripts.tpl"}
	{/if}

	{$additionalHeadData}
</head>
<body id="pkp-{$pageTitle|replace:'.':'-'}">
        <div id="header">
            <div id="headerTitle">
                <h1>
                {if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
                        <img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" class="img-responsive" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
                {/if}
                {if $displayPageHeaderTitle && is_array($displayPageHeaderTitle)}
                        <img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" class="img-responsive" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} />
                {elseif $displayPageHeaderTitle}
                        {$displayPageHeaderTitle}
                {elseif $alternatePageHeader}
                        {$alternatePageHeader}
                {elseif $siteTitle}
                        {$siteTitle}
                {else}
                        {$applicationName}
                {/if}
                </h1>
            </div>
        </div>




    {include file="theme:public/common/navbar.tpl"}


    <div id="main-container" class="container-fluid">
        <div id="content" class="row">
            <div id="main-content" class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                <div id="content-header">
                    
                    <ol class="breadcrumb">
                        <li><a href="{url page="index"}" target="_parent">{translate key="navigation.home"}</a></li>
                        {if $issue}<li><a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}" target="_parent">{$issue->getIssueIdentification(false,true)|escape}</a></li>{/if}
                        <li><a href="{url page="article" op="view" path=$articleId|to_array:$galleyId}" class="current" target="_parent">{$article->getFirstAuthor(true)|escape}</a></li>
                    </ol>
                
                </div>