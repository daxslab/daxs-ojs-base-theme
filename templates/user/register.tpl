{**
 * templates/user/register.tpl
 *
 * Copyright (c) 2013 Simon Fraser University Library
 * Copyright (c) 2003-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User registration form.
 *
 *}
{strip}

	{assign var="pageTitle" value="user.register"}
    
    {* Hides the lateral bars if they are active *}
        {assign var="leftSidebarDisabled" 	value=1}   
        {assign var="rightSidebarDisabled" 	value=1}
        
	{include file="theme:public/common/header.tpl"}
    
{/strip}

<form id="register" class="form-horizontal" method="post" action="{url op="registerUser"}" role="form">

<p>{translate key="user.register.completeForm"} <span class="label label-warning">{translate key="common.requiredField"}</span></p>

{if !$implicitAuth}
    {if !$existingUser}
        {url|assign:"url" page="user" op="register" existingUser=1}
        <p>{translate key="user.register.alreadyRegisteredOtherJournal" registerUrl=$url}</p>
    {else}
        {url|assign:"url" page="user" op="register"}
        <p>{translate key="user.register.notAlreadyRegisteredOtherJournal" registerUrl=$url}</p>
        <input type="hidden" name="existingUser" value="1"/>
    {/if}

    <h3>{translate key="user.profile"}</h3>

    {include file="common/formErrors.tpl"}

    {if $existingUser}
        <p>{translate key="user.register.loginToRegister"}</p>
    {/if}
{/if}{* !$implicitAuth *}

{if $source}
    <input type="hidden" name="source" value="{$source|escape}" />
{/if}

{*if count($formLocales) > 1 && !$existingUser}
    <div class="form-group">
        {fieldLabel name="formLocale" key="form.formLanguage" class="col-lg-3 control-label"}
        <div class="col-lg-9">
            {url|assign:"userRegisterUrl" page="user" op="register" escape=false}
            {form_language_chooser form="register" url=$userRegisterUrl}
            {theme_form_language_chooser form="register" url=$userRegisterUrl}
            <p class="help-block">{translate key="form.formLanguage.description"}</p>
            
        </div>
            
    </div>
{/if*}


{* count($formLocales) > 1 && !$existingUser *}

{if !$implicitAuth}
    <div class="form-group">
        {fieldLabel name="username" required="true" key="user.username" class="col-lg-3 control-label"}
        {if !$existingUser}
            <div class="col-lg-9">
                <input type="text" name="username" value="{$username|escape}" id="username" size="20" maxlength="32" class="form-control" />
                <p class="help-block">{translate key="user.register.usernameRestriction"}</p>            
            </div>
        {else}
                <input type="text" name="username" value="{$username|escape}" id="username" size="20" maxlength="32" class="form-control" />
        {/if}{* !$existingUser *}
    </div>
    
    <div class="form-group">
        {fieldLabel name="password" required="true" key="user.password" class="col-lg-3 control-label"}
        {if !$existingUser}
            <div class="col-lg-9">
                <input type="password" name="password" value="{$password|escape}" id="password" size="20" maxlength="32" class="form-control" />
                <p class="help-block">{translate key="user.register.passwordLengthRestriction" length=$minPasswordLength}</p>   
            </div>
        {else}
            <input type="password" name="password" value="{$password|escape}" id="password" size="20" maxlength="32" class="form-control" />
        {/if}{* !$existingUser *}
    </div>
    
    {if !$existingUser}
        <div class="form-group">
            {fieldLabel name="password2" required="true" key="user.repeatPassword" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <input type="password" name="password2" id="password2" value="{$password2|escape}" size="20" maxlength="32" class="form-control" />
            </div>
        </div>
        
        {if $captchaEnabled}
            
                {if $reCaptchaEnabled}
                    {fieldLabel name="recaptcha_challenge_field" required="true" key="common.captchaField"}</td>
                    {$reCaptchaHtml}
                {else}
                    <div class="form-group col-sm-6">
                        {fieldLabel name="captcha" required="true" key="common.captchaField"}
                        <img src="{url page="user" op="viewCaptcha" path=$captchaId}" alt="{translate key="common.captchaField.altText"}" /><br />
                        <div class="input-group">
                            <input name="captcha" id="captcha" value="" size="20" maxlength="32" />
                            <span class="input-group-btn">
                                <button class="btn btn-default" data-container="body" data-content='{translate key="common.captchaField.description"}' data-original-title='{translate key="common.captchaField"}' data-placement="left" data-toggle="popover" title="" type="button"><i class="awesome-info-circle"></i></button>        
                            </span>
                            <input type="hidden" name="captchaId" value="{$captchaId|escape:"quoted"}" />
                        </div>
                    </div>
                {/if}
            <!--/tr-->
        {/if}{* $captchaEnabled *}
        
        <hr class="col-xs-12" />
        
        <div class="form-group">
            {fieldLabel name="salutation" key="user.salutation" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <input type="text" name="salutation" id="salutation" value="{$salutation|escape}" size="20" maxlength="40" class="form-control" />
            </div>        
        </div>           

        <div class="form-group">
            {fieldLabel name="gender-m" key="user.gender" class="col-lg-3 control-label"}
            <div class="col-lg-9">
            <select name="gender" id="gender" size="1" class="selectMenu form-control">
                {html_options_translate options=$genderOptions selected=$gender}
            </select>
            </div>
        </div>

        <div class="form-group">
            {fieldLabel name="initials" key="user.initials" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <input type="text" id="initials" name="initials" value="{$initials|escape}" size="5" maxlength="5" class="form-control" />
                <p class="help-block">{translate key="user.initialsExample"}</p>
            </div>
        </div>           

        <div class="form-group">
            {fieldLabel name="firstName" required="true" key="user.firstName" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <input type="text" id="firstName" name="firstName" value="{$firstName|escape}" size="20" maxlength="40" class="form-control" />
            </div>
        </div>     

        <div class="form-group">
            {fieldLabel name="middleName" key="user.middleName" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <input type="text" id="middleName" name="middleName" value="{$middleName|escape}" size="20" maxlength="40" class="form-control" />
            </div>   
        </div>           

        <div class="form-group">
            {fieldLabel name="lastName" required="true" key="user.lastName" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <input type="text" id="lastName" name="lastName" value="{$lastName|escape}" size="20" maxlength="40" class="form-control" />
            </div>
        </div>
        
        <div class="form-group">
            {fieldLabel name="email" required="true" key="user.email" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <input type="text" id="email" name="email" value="{$email|escape}" size="30" maxlength="90" class="form-control" />
                {if $privacyStatement}
                    <a class="btn btn-default" data-toggle="modal" data-target="#privacyStatement"><i class="glyphicon glyphicon-info-sign"></i></a>       
                {/if}
            </div>
        </div>
        
        <div class="form-group">
            {fieldLabel name="confirmEmail" required="true" key="user.confirmEmail" class="col-lg-3 control-label"}
            <div class="col-lg-9 form">
                <input type="text" id="confirmEmail" name="confirmEmail" value="{$confirmEmail|escape}" size="30" maxlength="90" class="form-control" />
            </div>
        </div>
        
        <div class="form-group">
            {fieldLabel name="userUrl" key="user.url" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <input type="text" id="userUrl" name="userUrl" value="{$userUrl|escape}" size="30" maxlength="90" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            {fieldLabel name="biography" key="user.biography" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <textarea name="biography[{$formLocale|escape}]" id="biography" rows="5" cols="40" class="textArea form-control">{$biography[$formLocale]|escape}</textarea>
                <p class="help-block">{translate key="user.biography.description"}</p>
            </div>
        </div>

        <div class="form-group">
            {fieldLabel name="signature" key="user.signature" class="col-lg-3 control-label"}            
            <div class="col-lg-9">
                <textarea name="signature[{$formLocale|escape}]" id="signature" class="form-control" rows="5" cols="40">{$signature[$formLocale]|escape}</textarea>
            </div>
        </div>
        
        <hr class="col-xs-12" />

        <div class="form-group">
            {fieldLabel name="affiliation" key="user.affiliation" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <textarea id="affiliation" class="textArea form-control" name="affiliation[{$formLocale|escape}]" rows="5" cols="40" >{$affiliation[$formLocale]|escape}</textarea>
                <p class="help-block">{translate key="user.affiliation.description"}</p>
            </div>
        </div>

        <div class="form-group">
            {fieldLabel name="phone" key="user.phone" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <input type="text" name="phone" id="phone" value="{$phone|escape}" size="15" maxlength="24" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            {fieldLabel name="fax" key="user.fax" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <input type="text" name="fax" id="fax" value="{$fax|escape}" size="15" maxlength="24" class="form-control" />
            </div>  
        </div>  
        
        <div class="form-group">
            {fieldLabel name="mailingAddress" key="common.mailingAddress" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <textarea name="mailingAddress" id="mailingAddress" class="form-control" rows="3" cols="40">{$mailingAddress|escape}</textarea>
            </div> 
        </div> 
        
        <div class="form-group">
            {fieldLabel name="country" key="common.country" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <select name="country" id="country" class="form-control">
                    <option value=""></option>
                    {html_options options=$countries selected=$country}
                </select>
            </div> 
        </div>
        
        <hr class="col-xs-12" />
        
        <div class="form-group">
           {fieldLabel name="sendPassword" key="user.sendPassword" class="col-lg-3 control-label"}
            <div class="col-lg-9">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="sendPassword" id="sendPassword" value="1"{if $sendPassword} checked="checked"{/if} />
                        <label for="sendPassword">{translate key="user.sendPassword.description"}</label>
                    </label>
                </div>
            </div>  
        </div>  

        

        {if count($availableLocales) > 1}
            
             <div class="form-group">
                 <label class="col-lg-3 control-label">{translate key="user.workingLanguages"}</label>
                 <div class="col-lg-9">
                     {foreach from=$availableLocales key=localeKey item=localeName}
                         <div class="checkbox">
                            <label class="checkbox-inline">
                               <input type="checkbox" name="userLocales[]" id="userLocales-{$localeKey|escape}" value="{$localeKey|escape}"{if in_array($localeKey, $userLocales)} checked="checked"{/if} /> 
                               <label for="userLocales-{$localeKey|escape}">{$localeName|escape}</label>
                           </label>
                         </div>
                    {/foreach}
                 </div>
             </div>
            
        {/if}{* count($availableLocales) > 1 *}                              
    {/if}{* !$existingUser *}
{/if}{* !$implicitAuth *}



{if $allowRegReader || $allowRegReader === null || $allowRegAuthor || $allowRegAuthor === null || $allowRegReviewer || $allowRegReviewer === null || ($currentJournal && $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $enableOpenAccessNotification)}
    

    <div class="form-group">
        {fieldLabel suppressId="true" name="registerAs" key="user.register.registerAs" class="col-lg-3 control-label"}
         <div class="col-lg-9">
            {if $allowRegReader || $allowRegReader === null}
            <div class="checkbox">                
                <label>
                    <input type="checkbox" name="registerAsReader" id="registerAsReader" value="1"{if $registerAsReader} checked="checked"{/if} />
                    <label for="registerAsReader">{translate key="user.role.reader"}</label>:
                </label>
                &nbsp;{translate key="user.register.readerDescription"}
            </div>
            {/if}
            {if $currentJournal && $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $enableOpenAccessNotification}
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="openAccessNotification" id="openAccessNotification" value="1"{if $openAccessNotification} checked="checked"{/if} /> 
                    <label for="openAccessNotification">{translate key="user.role.reader"}</label>:
                    &nbsp;{translate key="user.register.openAccessNotificationDescription"}
                </label>
            </div>
            {/if}
            {if $allowRegAuthor || $allowRegAuthor === null}
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="registerAsAuthor" id="registerAsAuthor" value="1"{if $registerAsAuthor} checked="checked"{/if} /> 
                    <label for="registerAsAuthor">{translate key="user.role.author"}</label>:
                    &nbsp;{translate key="user.register.authorDescription"}
                </label>
            </div>
            {/if}
            {if $allowRegReviewer || $allowRegReviewer === null}
                <div class="checkbox">
                <label>
                    <input type="checkbox" name="registerAsReviewer" id="registerAsReviewer" value="1"{if $registerAsReviewer} checked="checked"{/if} />
                    <label for="registerAsReviewer">{translate key="user.role.reviewer"}</label>:
                    &nbsp;{if $existingUser}{translate key="user.register.reviewerDescriptionNoInterests"}
                    {else}{translate key="user.register.reviewerDescription"}{/if} 
                </label>
                <br/><br/>{translate key="user.register.reviewerInterests"}
                {include file="form/interestsInput.tpl" FBV_interestsKeywords=$interestsKeywords FBV_interestsTextOnly=$interestsTextOnly}
            </div>
            {/if}
         </div>  
     </div>     
       
    
{/if}

<div class="form-group actions">
        <input type="submit" value="{translate key="user.register"}" class="btn btn-success" />
        <input type="button" value="{translate key="common.cancel"}" class="btn btn-danger" onclick="document.location.href='{url page="index" escape=false}'" />
    
</div>



{if $privacyStatement}
    <!-- Modal: Privacy Statement - BEGIN -->
    <div class="modal modal-sm primary fade" id="privacyStatement" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                	<h4 class="modal-title" id="myModalLabel">{translate key="user.register.privacyStatement"}</h4>
                 </div>
                <div class="modal-body">
                    {$privacyStatement|nl2br}
                </div>
                <div class="modal-footer"><button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button></div>
            </div>
        </div>
    </div>
    <!-- Modal: Privacy Statement - END -->
{/if}

</form>
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

{include file="theme:public/common/footer.tpl"}
