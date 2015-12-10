{**
 * templates/user/login.tpl
 *
 * Copyright (c) 2013 Simon Fraser University Library
 * Copyright (c) 2000-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}
{strip}
{assign var="pageTitle" value="user.login"}
{include file="theme:public/common/header.tpl"}
{/strip}

{if !$registerOp}
	{assign var="registerOp" value="register"}
{/if}
{if !$registerLocaleKey}
	{assign var="registerLocaleKey" value="user.login.registerNewAccount"}
{/if}

{if $loginMessage}
	<span class="instruct">{translate key="$loginMessage"}</span>
	<br />
	<br />
{/if}

{if $implicitAuth}
	<a id="implicitAuthLogin" href="{url page="login" op="implicitAuthLogin"}">Login</a>
{else}
	<form id="signinForm" method="post" action="{$loginUrl}" class="form-horizontal" role="form">
{/if}

{if $error}
	<span class="pkp_form_error">{translate key="$error" reason=$reason}</span>
	<br />
	<br />
{/if}

<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}" />

{if ! $implicitAuth}
    
    <div class="form-group">
        <label for="loginUsername" class="col-lg-3 control-label">{translate key="user.username"}:</label>
        <div class="col-lg-9">
            <input type="text" class="form-control" id="loginUsername" name="username" value="{$username|escape}">
        </div>
    </div>

    <div class="form-group">
        <label for="loginPassword" class="col-lg-3 control-label">{translate key="user.password"}:</label>
        <div class="col-lg-9">
            <input type="password" class="form-control" id="loginPassword" name="password" value="{$password|escape}">
        </div>
    </div>


{if $showRemember}
    
    <div class="form-group">
    <div class="col-lg-offset-2 col-lg-10">
      <div class="checkbox">
        <label>
          <input type="checkbox" id="loginRemember" name="remember" value="1"{if $remember} checked="checked"{/if}> {translate key="user.login.rememberUsernameAndPassword"}
        </label>
      </div>
    </div>
  </div>
{/if}{* $showRemember *}

    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">
            <input type="submit" value="{translate key="user.login"}" class="btn btn-default" />
        </div>
    </div>


<p>
    {if !$hideRegisterLink}&#187; <a href="{url page="user" op=$registerOp}">{translate key=$registerLocaleKey}</a><br />{/if}
    &#187; <a href="{url page="login" op="lostPassword"}">{translate key="user.login.forgotPassword"}</a>
</p>
{/if}{* !$implicitAuth *}

<script type="text/javascript">
<!--
	document.getElementById('{if $username}loginPassword{else}loginUsername{/if}').focus();
// -->
</script>
</form>

{include file="theme:public/common/footer.tpl"}