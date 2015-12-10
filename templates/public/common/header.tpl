{**
 * header.tpl
 *
 * Copyright (c) 2015 Carlos Cesar Caballero Diaz
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site header.
 *}
{strip}
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{if $pageCrumbTitle}
	{translate|assign:"pageCrumbTitleTranslated" key=$pageCrumbTitle}
{elseif !$pageCrumbTitleTranslated}
	{assign var="pageCrumbTitleTranslated" value=$pageTitleTranslated}
{/if}
{/strip}
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<title>{$pageTitleTranslated}</title>
        <meta charset="utf-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="{$metaSearchDescription|escape}" />
	<meta name="keywords" content="{$metaSearchKeywords|escape}" />
	<meta name="generator" content="{$applicationName} {$currentVersionString|escape}" />
	{$metaCustomHeaders}
	{if $displayFavicon}<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />{/if}
	
        <link rel="stylesheet" href="{$pluginUrl}/css/journal.css" type="text/css" />

        

	{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
	{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
	{*if $leftSidebarCode || $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/sidebar.css" type="text/css" />{/if}
	{if $leftSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/leftSidebar.css" type="text/css" />{/if}
	{if $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/rightSidebar.css" type="text/css" />{/if}
	{if $leftSidebarCode && $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/bothSidebars.css" type="text/css" />{/if*}

	{foreach from=$stylesheets item=cssUrl}
		<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
	{/foreach}
        
        <script type="text/javascript" src="{$pluginUrl}/js/jquery.min.js"></script>
        <script type="text/javascript" src="{$pluginUrl}/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="{$pluginUrl}/js/bootstrap.min.js"></script>
        <!--script type="text/javascript" src="{$pluginUrl}/js/bootstrap-tagsinput.min.js"></script-->

	<!-- Default global locale keys for JavaScript -->
	{include file="common/jsLocaleKeys.tpl" }

	<!-- Compiled scripts -->
	{if $useMinifiedJavaScript}
		<script type="text/javascript" src="{$baseUrl}/js/pkp.min.js"></script>
	{else}
		{include file="common/minifiedScripts.tpl"}
	{/if}

	<!-- Form validation -->
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/validate/jquery.validate.js"></script>
	<script type="text/javascript">
		<!--
		// initialise plugins
		{literal}
		$(function(){
			jqueryValidatorI18n("{/literal}{$baseUrl}{literal}", "{/literal}{$currentLocale}{literal}"); // include the appropriate validation localization
			{/literal}{if $validateId}{literal}
				$("form[name={/literal}{$validateId}{literal}]").validate({
					errorClass: "error",
					highlight: function(element, errorClass) {
						$(element).parent().parent().addClass(errorClass);
					},
					unhighlight: function(element, errorClass) {
						$(element).parent().parent().removeClass(errorClass);
					}
				});
			{/literal}{/if}{literal}
			/*$(".tagit").live('click', function() {
				$(this).find('input').focus();
			});*/
		});
		// -->
		{/literal}
	</script>

	{if $hasSystemNotifications}
		{url|assign:fetchNotificationUrl page='notification' op='fetchNotification' escape=false}
		<script type="text/javascript">
			$(function(){ldelim}
				$.get('{$fetchNotificationUrl}', null,
					function(data){ldelim}
						var notifications = data.content;
						var i, l;
						if (notifications && notifications.general) {ldelim}
							$.each(notifications.general, function(notificationLevel, notificationList) {ldelim}
								$.each(notificationList, function(notificationId, notification) {ldelim}
									console.log(notification);
									$.pnotify(notification);
								{rdelim});
							{rdelim});
						{rdelim}
				{rdelim}, 'json');
			{rdelim});
		</script>
	{/if}{* hasSystemNotifications *}

	{$additionalHeadData}
</head>
<body id="pkp-{$pageTitle|replace:'.':'-'}">
{*    <div id="container">*}

        <div id="header">
            <div id="headerTitle">
                <h1>
                {if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
                    <img class="img-logo" src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" class="img-responsive" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
                {/if}
                {if $displayPageHeaderTitle && is_array($displayPageHeaderTitle)}
                    <img class="img-title" src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" class="img-responsive" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} />
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
        {*            {include file="common/breadcrumbs.tpl"}*}
                    {include file="theme:public/common/breadcrumbs.tpl"}

                     <h2>{$pageTitleTranslated}</h2>

                     {if $pageSubtitle && !$pageSubtitleTranslated}{translate|assign:"pageSubtitleTranslated" key=$pageSubtitle}{/if}
                     {if $pageSubtitleTranslated}
                             <h3>{$pageSubtitleTranslated}</h3>
                     {/if}
                </div>