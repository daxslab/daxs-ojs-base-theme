{**
 * lib/pkp/templates/announcement/list.tpl
 *
 * Copyright (c) 2013 Simon Fraser University Library
 * Copyright (c) 2000-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of announcements without site header or footer.
 *
 *}


{counter start=1 skip=1 assign="count"}

{iterate from=announcements item=announcement}
	{if !$numAnnouncementsHomepage || $count <= $numAnnouncementsHomepage}
    	<article>
        	<div class="row">
                <div class="announcement-data">
                    <header>
                        {if $announcement->getTypeId()}
                            <a href="{url page="announcement" op="view" path=$announcement->getId()}">
                                {$announcement->getAnnouncementTypeName()|escape}: {$announcement->getLocalizedTitle()|escape}
                            </a>
                        {else}
                            <a href="{url page="announcement" op="view" path=$announcement->getId()}">
                                {$announcement->getLocalizedTitle()|escape}
                            </a>
                        {/if}
                    </header>
                    <summary>
                        {$announcement->getLocalizedDescriptionShort()|nl2br}
                    </summary>
                </div>
            </div>
			<footer>
            	<div class="footer-first">
            		<strong>{translate key="announcement.posted"}:</strong> {$announcement->getDatePosted()}.
                </div>
                <div class="footer-second">
                	<a href="{url page="announcement" op="view" path=$announcement->getId()}">{translate key="announcement.viewLink"}...</a>
                </div>
            </footer>
        </article>
	{/if}
	{counter}
{/iterate}

{if $announcements->wasEmpty()}
	<div class="col-xs-12 text-right">
		{translate key="announcement.noneExist"}
    </div>
{/if}

