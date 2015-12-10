{**
 * templates/article/footer.tpl
 *
 * Copyright (c) 2015 Carlos Cesar Caballero Diaz
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article View -- Footer component.
 *}

{if $sharingEnabled}
<!-- start AddThis -->
	{if isset($sharingDropDownMenu)}
		{if isset($sharingUserName)}
			<script type="text/javascript">
				var addthis_pub = '{$sharingUserName}';
			</script>
		{/if}
		<br />
		<br />
		<div class="addthis_container">
			<a href="http://www.addthis.com/bookmark.php"
				onmouseover="return addthis_open(this, '', '{$sharingArticleURL|escape:"javascript"}', '{$sharingArticleTitle|escape:"javascript"}')"
				onmouseout="addthis_close()" onclick="return addthis_sendto()">
					<img src="{$sharingButtonUrl}" width="{$sharingButtonWidth}" height="{$sharingButtonHeight}" border="0" alt="Bookmark and Share" style="border:0;padding:0" />
			</a>
			<script type="text/javascript" src="http://s7.addthis.com/js/200/addthis_widget.js"></script>
		</div>
	{else}
		<a href="http://www.addthis.com/bookmark.php"
			onclick="window.open('http://www.addthis.com/bookmark.php?pub={$sharingUserName|escape:"url"}&amp;url={$sharingRequestURL|escape:"url"}&amp;title={$sharingArticleTitle|escape:"url"}', 'addthis',
			                     'scrollbars=yes,menubar=no,width=620,height=520,resizable=yes,toolbar=no,location=no,status=no');
			         return false;"
			title="Bookmark using any bookmark manager!" target="_blank">
				<img src="{$sharingButtonUrl}" width="{$sharingButtonWidth}" height="{$sharingButtonHeight}" border="0" alt="Bookmark and Share" style="border:0;padding:0" />
		</a>
	{/if}
<!-- end AddThis -->
{/if}


            </div> <!-- main-content -->

        {call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
        {call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
        {if $leftSidebarCode || $rightSidebarCode}
            {if $rightSidebarCode}
                    <div id="rightSidebar" class="sidebar col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            {$rightSidebarCode}
                    </div>
            {/if}
            {if $leftSidebarCode}
                    <div id="leftSidebar">
                            {$leftSidebarCode}
                    </div>
            {/if}
        {/if}

        </div><!-- content -->
        </div><!-- main row -->
{*    </div><!-- container -->*}
    
        {if $displayCreativeCommons}
                {translate key="common.ccLicense"}
        {/if}
        {call_hook name="Templates::Common::Footer::PageFooter"}
        {if $pageFooter}
                
                <div id="pageFooter">{$pageFooter}</div>
        {/if}
        
        {if $defineTermsContextId}
        <script type="text/javascript">
        {literal}
        <!--
                // Open "Define Terms" context when double-clicking any text
                function openSearchTermWindow(url) {
                        var term;
                        if (window.getSelection) {
                                term = window.getSelection();
                        } else if (document.getSelection) {
                                term = document.getSelection();
                        } else if(document.selection && document.selection.createRange && document.selection.type.toLowerCase() == 'text') {
                                var range = document.selection.createRange();
                                term = range.text;
                        }
                        if (term != ""){
                                if (url.indexOf('?') > -1) openRTWindowWithToolbar(url + '&defineTerm=' + term);
                                else openRTWindowWithToolbar(url + '?defineTerm=' + term);
                        }
                }

                if(document.captureEvents) {
                        document.captureEvents(Event.DBLCLICK);
                }

                // Make sure to only open the reading tools when double clicking within the galley	
                if (document.getElementById('inlinePdfResizer')) {
                        context = document.getElementById('inlinePdfResizer');	
                }
                else if (document.getElementById('content')) {
                        context = document.getElementById('content');	
                }
                else {
                        context = document;
                }

                context.ondblclick = new Function("openSearchTermWindow('{/literal}{url page="rt" op="context" path=$articleId|to_array:$galleyId:$defineTermsContextId escape=false}{literal}')");
        // -->
        {/literal}
        </script>
        {/if}
        
        <script>
        {literal}    
        function scroll_if_anchor(href) {
            href = typeof(href) == "string" ? href : $(this).attr("href");

            var fromTop = 50;    

            if(href.indexOf("#") == 0) {
                var $target = $(href);

                if($target.length) {
                    $('html, body').animate({ scrollTop: $target.offset().top - fromTop });
                    if(history && "pushState" in history) {
                        history.pushState({}, document.title, window.location.pathname + href);
                        return false;
                    }
                }
            }
        };    

        scroll_if_anchor(window.location.hash);

        $("body").on("click", "a", scroll_if_anchor);
        {/literal}
        </script>

        {get_debug_info}
        {if $enableDebugStats}{include file=$pqpTemplate}{/if}

       
</body>
</html>