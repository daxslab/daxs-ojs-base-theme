<?php

/**
 * @file plugins/themes/daxsBase/DaxsBaseThemePlugin.inc.php
 *
 * Copyright (c) 2013 Simon Fraser University Library
 * Copyright (c) 2003-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class DaxsBaseThemePlugin
 * @ingroup plugins_themes_uncommon
 *
 * @brief "Custom" theme plugin
 */

import('classes.plugins.ThemePlugin');
import('lib.pkp.classes.form.Form');

class DaxsBaseThemePlugin extends ThemePlugin {
	/**
	 * Register the plugin, if enabled; note that this plugin
	 * runs under both Journal and Site contexts.
	 * @param $category string
	 * @param $path string
	 * @return boolean
	 */
	function register($category, $path) {		
		if (parent::register($category, $path)) {
			HookRegistry::register('TemplateManager::display', array(&$this, 'setCustomTemplate'));
			$this->addLocaleData();
			return true;
		}
		return false;
	}

	/*
	 * register a "theme" resource and replace a callback template 
	 * if it exists in the plugin templates folder. 
	 */
	function setCustomTemplate($hookName, $args) {
		
		$TemplateManager = $args[0];
		
		// regiter a filter for icons changes
//		$TemplateManager->register_outputfilter(array('DaxsBaseThemePlugin', 'replaceIcons'));

		$TemplateManager->register_resource('theme', array(
			array(&$this, 'smartyResourceThemeGetTemplate'),
			array(&$this, 'smartyResourceThemeGetTimestamp'),
			array(&$this, 'smartyResourceThemeGetSecure'),
			array(&$this, 'smartyResourceThemeGetTrusted')
		));
                
                // register user an session vars
                if (!defined('SESSION_DISABLE_INIT')) {
			$session =& Request::getSession();
			$TemplateManager->assign_by_ref('userSession', $session);
			$TemplateManager->assign('loggedInUsername', $session->getSessionVar('username'));
			$loginUrl = Request::url(null, 'login', 'signIn');
			if (Config::getVar('security', 'force_login_ssl')) {
				$loginUrl = String::regexp_replace('/^http:/', 'https:', $loginUrl);
			}
			$TemplateManager->assign('themeLoginUrl', $loginUrl);
		}
                
                $TemplateManager->assign('pluginUrl', $this->getPluginBaseUrl());
                $TemplateManager->register_function('theme_form_language_chooser', array(&$this, 'themeFormLanguageChooser'));

		$themeTemplateFile = $this->getTemplatePath().'templates'. DIRECTORY_SEPARATOR . $args[1];
		$themeTemplateFile = str_replace('file:/', '/', $themeTemplateFile);

//		if(file_get_contents($themeTemplateFile)){
//			$args[1] = $themeTemplateFile;
//		}
//                echo $themeTemplateFile;
                if(file_exists($themeTemplateFile)){
			$args[1] = $themeTemplateFile;
		}/*else{
                    $TemplateManager->addStyleSheet($this->getStylesPath().'custom.css');
                }*/
                

		return false;
	}

	/**
	 * Resource function to get a "theme" template.
	 * @param $template string
	 * @param $templateSource string reference
	 * @param $smarty Smarty
	 * @return boolean
	 */
	function smartyResourceThemeGetTemplate($template, &$templateSource, &$smarty) {
		$templateFile = $this->getTemplatePath().'templates'. DIRECTORY_SEPARATOR . $template;
		$templateFile = str_replace('file:/', '/', $templateFile);
		$templateSource = file_get_contents($templateFile);
		return ($templateSource !== false);
	}

	/**
	 * Resource function to get the timestamp of a "theme"
	 * template.
	 * @param $template string
	 * @param $templateTimestamp int reference
	 * @return boolean
	 */
	function smartyResourceThemeGetTimestamp($template, &$templateTimestamp, &$smarty) {
		$templateFile = $this->getTemplatePath().'templates'. DIRECTORY_SEPARATOR . $template;
		$templateFile = str_replace('file:/', '/', $templateFile);
		$templateSource = $templateFile;
		if (!file_exists($templateSource)) return false;
		$templateTimestamp = filemtime($templateSource);
		return true;
	}

	/**
	 * Resource function to determine whether a "theme" template
	 * is secure.
	 * @return boolean
	 */
	function smartyResourceThemeGetSecure($template, &$smarty) {
		return true;
	}

	/**
	 * Resource function to determine whether a "theme" template
	 * is trusted.
	 */
	function smartyResourceThemeGetTrusted($template, &$smarty) {
		// From <http://www.smarty.net/docsv2/en/plugins.resources.tpl>:
		// "This function is used for only for PHP script components
		// requested by {include_php} tag or {insert} tag with the src
		// attribute. However, it should still be defined even for
		// template resources."
		// a.k.a. OK not to implement.
	}

	/**
	 * Get the name of this plugin. The name must be unique within
	 * its category.
	 * @return String name of plugin
	 */
	function getName() {
		return 'DaxsBaseThemePlugin';
	}

	function getDisplayName() {
		return __('plugins.theme.daxsBase.name');
	}

	function getDescription() {
		return __('plugins.theme.daxsBase.description');
	}

	function getStylesheetFilename() {
                //return none;
		return $this->getStylesPath() . 'custom.css';
	}

    /**
    * Get the template path for this plugin.
    */
    function getStylesPath() {
        return 'css/';
    }
    
    function getPluginBaseUrl(){
        return Request::getBaseUrl().'/plugins/themes/daxsBase';
    }

    function getImagesPath() {
        return $this->getPluginBaseUrl().'/images/';
    }
    
    /*
     * Languaje chooser without button
     */
    function themeFormLanguageChooser($params, &$smarty) {
        $returner = '';
        $form = new Form();        
        
        // Print back all non-current language field values so that they
        // are not lost.
        $formLocale = $form->getFormLocale();
        
        foreach ($form->getLocaleFieldNames() as $field) {
                $values = $form->getData($field);
                if (!is_array($values)) continue;
                foreach ($values as $locale => $value) {
                        if ($locale != $formLocale) $returner .= $form->_decomposeArray($field, $value, array($locale));
                }
        }

        // Display the language selector widget.
        $returner .= '<div id="languageSelector"><select size="1" name="formLocale" id="formLocale" onchange="changeFormAction(\'' . htmlentities($params['form'], ENT_COMPAT, LOCALE_ENCODING) . '\', \'' . htmlentities($params['url'], ENT_QUOTES, LOCALE_ENCODING) . '\')" class="selectMenu">';
        foreach ($form->supportedLocales as $locale => $name) {
                $returner .= '<option ' . ($locale == $formLocale?'selected="selected" ':'') . 'value="' . htmlentities($locale, ENT_COMPAT, LOCALE_ENCODING) . '">' . htmlentities($name, ENT_COMPAT, LOCALE_ENCODING) . '</option>';
        }
        $returner .= '</select></div>';
        
        return $returner;
    }
        
        

    /**
     * Extend the {url ...} smarty to support this plugin.
     */
    function smartyPluginUrl($params, &$smarty) {
        $path = array($this->getCategory(), $this->getName());
        if (is_array($params['path'])) {
                $params['path'] = array_merge($path, $params['path']);
        } elseif (!empty($params['path'])) {
                $params['path'] = array_merge($path, array($params['path']));
        } else {
                $params['path'] = $path;
        }

        if (!empty($params['id'])) {
                $params['path'] = array_merge($params['path'], array($params['id']));
                unset($params['id']);
        }
        return $smarty->smartyUrl($params, $smarty);
    }

}

?>
