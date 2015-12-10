{**
 * templates/user/lostPassword.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2000-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Password reset form.
 *
 *}
{strip}
{assign var="pageTitle" value="user.login.resetPassword"}
{include file="theme:public/common/header.tpl"}
{assign var="registerOp" value="register"}
{/strip}
{if !$registerLocaleKey}
	{assign var="registerLocaleKey" value="user.login.registerNewAccount"}
{/if}

<p><span class="instruct">{translate key="user.login.resetPasswordInstructions"}</span></p>

{if $error}
	<p><span class="pkp_form_error">{translate key="$error"}</span></p>
{/if}

<form id="reset" class="form-horizontal" action="{url page="login" op="requestResetPassword"}" method="post">
    <div class="form-group">
        <label for="email1" class="col-lg-3 control-label">{translate key="user.login.registeredEmail"}</label>
        <div class="col-lg-9">
            <input type="text" name="email" value="{$username|escape}" size="30" maxlength="90" class="form-control" />
        </div>
    </div>

    <div class="form-group actions">
        <input type="submit" value="{translate key="user.login.resetPassword"}" class="btn btn-default" /></p>
    </div>

</form>
{if !$hideRegisterLink}
	&#187; <a href="{url page="user" op=$registerOp}">{translate key=$registerLocaleKey}</a>
{/if}

<script type="text/javascript">
<!--
	document.getElementById('reset').email.focus();
// -->
</script>


{include file="theme:public/common/footer.tpl"}
