{**
 * templates/common/navbar.tpl
 *
 * Copyright (c) 2015 Gennhy Riveron
 * Copyright (c) 2005 Carlos Cesar Caballero Diaz
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Navigation Bar
 *
 *}
 
 <nav id="mainmenu" class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <!--a class="navbar-brand" href="{url page="index"}">{if $siteTitle}
        {$siteTitle}
    {else}
        {$applicationName}
    {/if}</a-->
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
                <li role="presentation" id="home"><a href="{url page="index"}" class="awesome-home"> {translate key="navigation.home"}</a></li>
                
                {if $enableAnnouncements}
                    <li role="presentation" id="announcements"><a class="awesome-file-o" href="{url page="announcement"}"> {translate key="announcement.announcements"}</a></li>
                {/if}{* enableAnnouncements *}
            
                {if $currentJournal && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
                    <li role="presentation" id="current"><a class="awesome-bookmark" href="{url page="issue" op="current"}"> {translate key="navigation.current"}</a></li>
                    <li role="presentation" id="archives"><a class="awesome-book" href="{url page="issue" op="archive"}"> {translate key="navigation.archives"}</a></li>
                {/if}
            
                {if $siteCategoriesEnabled}
                    <li role="presentation" id="categories"><a href="{url journal="index" page="search" op="categories"}"> {translate key="navigation.categories"}</a></li>
                {/if}{* $categoriesEnabled *}
            
                {call_hook name="Templates::Common::Header::Navbar::CurrentJournal"}
            
                {foreach from=$navMenuItems item=navItem key=navItemKey}
                    {if $navItem.url != '' && $navItem.name != ''}
                        <li role="presentation" class="navItem" id="navItem-{$navItemKey|escape}"><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{$baseUrl}{$navItem.url|escape}{/if}"> {if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</a></li>
                    {/if}
                {/foreach}
                
                <li role="presentation" id="about"><a class="awesome-info-circle" href="{url page="about"}"> {translate key="navigation.about"}</a></li>
                
            </ul>
    
    <ul class="nav navbar-nav navbar-right">
        <li class="dropdown user-dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-search"></i></a>
            <ul class="dropdown-menu">
                <li role="presentation">
                    <form method="post" id="searchForm" action="{url page="search"}" class="navbar-form" role="search">
                        <div class="form-group">
                            <input type="text" id="query" name="query" value="{$query|escape}" class="form-control" placeholder="{translate key="common.search"}">
                        </div>
                    </form>                    
                </li>
                <li role="presentation" class="divider"></li>
                {if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
                <li role="presentation"><a href="{url page="search"}" title="{translate key="navigation.search"}">Búsqueda avanzada</a></li>
                {/if}
            </ul>
        </li>
        <li class="dropdown user-dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> {if $isUserLoggedIn}{$loggedInUsername}{else}{translate key="user.login"}{/if} <b class="caret"></b></a>
            {if $isUserLoggedIn}
            <ul class="dropdown-menu">
                <li role="presentation"><a href="{url journal="index" page="user"}">{translate key="navigation.userHome"}</a></li>
                <li role="presentation" class="divider"></li>
                <li role="presentation"><a href="{url page="user" op="profile"}">{translate key="plugins.theme.daxsBase.user.myProfile"}</a></li>
                <li role="presentation"><a href="{url page="login" op="signOut"}">{translate key="plugins.theme.daxsBase.user.logout"}</a></li>
                {if $userSession->getSessionVar('signedInAs')}
                    <li role="presentation"><a href="{url page="login" op="signOutAsUser"}">{translate key="plugins.theme.daxsBase.user.signOutAsUser"}</a></li>
                {/if}
            </ul>
            {else}
            <ul class="dropdown-menu">
                <li role="presentation" id="login"><a href="{url page="login"}"><i class="icon icon-off glyphicon glyphicon-off"></i> {translate key="navigation.login"}</a></li>
                <li class="divider"></li>
                <li role="presentation" id="register"><a href="{url page="user" op="register"}"><i class="icon icon-user glyphicon glyphicon-user"></i> {translate key="navigation.register"}</a></li>
                <li role="presentation"><a href="{url page="login" op="lostPassword"}"><i class="icon icon-lock glyphicon glyphicon-lock"></i> {translate key="user.login.forgotPassword"}</a></li>
            </ul>
            {/if}
        </li>
      
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>

