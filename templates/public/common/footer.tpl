{**
 * templates/common/footer.tpl
 *
 * Copyright (c) 2015 Carlos Cesar Caballero Diaz
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site footer.
 *
 *}
 
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
        {if $pageFooter}
                
                <div id="pageFooter">{$pageFooter}</div>
        {/if}
        {call_hook name="Templates::Common::Footer::PageFooter"}


        {get_debug_info}
        {if $enableDebugStats}{include file=$pqpTemplate}{/if}

        

<script>
    $('.popover-default').popover();
</script>
</body>
</html>
