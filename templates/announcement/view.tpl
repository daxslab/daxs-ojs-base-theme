{**
 * view.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2000-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * View full announcement text.
 *
 *}
{strip}
{assign var="pageTitleTranslated" value=$announcementTitle}
{assign var="pageId" value="announcement.view"}
{include file="theme:public/common/header.tpl"}
{/strip}

        <div id="announcementDescription">
            {$announcement->getLocalizedDescription()|nl2br}
        </div>

{include file="theme:public/common/footer.tpl"}

