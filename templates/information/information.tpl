{**
 * templates/information/information.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2003-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Journal information page.
 *
 *}
{strip}
{include file="theme:public/common/header.tpl"}
{/strip}
<div id="journalInfo">
<p>{$content|nl2br}</p>
</div>
{include file="theme:public/common/footer.tpl"}