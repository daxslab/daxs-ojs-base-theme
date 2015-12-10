{**
 * view.tpl
 *
 * Copyright (c) 2003-2010 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * View issue -- This displays the issue TOC or title page, as appropriate,
 * *without* header or footer HTML (see viewPage.tpl)
 *
 * $Id$
 *}
{if $issueId}
	{url|assign:"currentUrl" page="issue" op="view" path=$issueId|to_array:"showToc"}
{else}
	{url|assign:"currentUrl" page="issue" op="current" path="showToc"}
{/if}
<H4><a href="{$currentUrl}">{translate key="issue.toc"}</H4>

{if $coverPagePath}<div id="issueCoverImage"><a href="{$currentUrl}"><img src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $coverPageAltText != ''} alt="{$coverPageAltText|escape}"{else} alt="{translate key="issue.coverPage.altText"}"{/if} width="148" height="120" style="float:left;padding-right:10px;"/></a>
<div id="issueCoverDescription" style="text-align:justify;">{$issue->getLocalizedCoverPageDescription()|strip_unsafe_html|nl2br}</div>
</div>{/if}