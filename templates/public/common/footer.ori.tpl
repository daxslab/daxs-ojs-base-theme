{**
 * templates/common/footer.tpl
 *
 * Copyright (c) 2013 Simon Fraser University Library
 * Copyright (c) 2000-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site footer.
 *
 *}
                 </div><!-- main -->

            </section><!-- content -->
            
            <footer>
            
            	<section id="footer-first">
                    
                	<aside id="footer-first-1">
                    	<h4>Envíos on-line...</h4>
                        <ul>
                            <li><a href="{url page="about" op="submissions" anchor="onlineSubmissions"}">{translate key="about.onlineSubmissions"}</a></li>
                            <li><a href="{url page="about" op="editorialPolicies" anchor="sectionPolicies"}">{translate key="about.sectionPolicies"}</a></li>
                            <li><a href="{url page="about" op="submissions" anchor="authorGuidelines"}">{translate key="about.authorGuidelines"}</a></li>
                            <li><a href="{url page="about" op="submissions" anchor="copyrightNotice"}">{translate key="about.copyrightNotice"}</a></li>
                            <li><a href="{url page="about" op="submissions" anchor="privacyStatement"}">{translate key="about.privacyStatement"}</a></li>
                        </ul>
                    </aside>
                    
                	<aside id="footer-first-2">
                    	<h4>{translate key="plugins.block.information.link"}...</h4>
                        <ul>
                            <li><a href="{url page="information" op="readers"}">A lectores</a></li>
                            <li><a href="{url page="information" op="authors"}">A autores</a></li>
                            <li><a href="{url page="information" op="librarians"}">A bibliotecarios</a></li>
                            <li><a href="{url page="about" op="statistics"}">Estadisticas</a></li>
                            <li><a href="{url page="about" op="editorialTeam"}">{translate key="about.editorialTeam"}</a></li>
                        </ul>
                    </aside>

                 	<aside id="footer-first-3">
                    	<h4>Encuéntranos en...</h4>
                        <ul>
                        	<li><a target="_blank" href="http://scholar.google.com.cu/scholar?hl=es&q=Revista+Finlay&btnG=Buscar&lr=&as_sdt=0%2C5">Google Scholar</a></li>
                            <li><a target="_blank" href="http://www.doaj.org/doaj?func=openurl&issn=22212434&genre=journal&uiLanguage=en">DOAJ</a></li>
                            <li><a target="_blank" href="http://www.bvscuba.sld.cu/php/level.php?lang=es&component=56&item=63">BVS Cuba</a></li>
                            <li><a target="_blank" href="http://www.latindex.unam.mx/buscador/ficRev.html?opcion=1&folio=20073">Latindex</a></li>
                            <li><a target="_blank" href="http://new.medigraphic.com/cgi-bin/publicaciones.cgi?IDREVISTA=294">MediGraphic</a></li>
                        </ul>
                    </aside>
                                        
                	<aside id="footer-first-4">
                    	<h4>{translate key="navigation.about"}...</h4>
                        <ul>
                            <li><a href="{url page="about" op="history"}">{translate key="about.history"}</a></li>                     
                            <li><a href="{url page="about" op="journalSponsorship"}">Patrocinadores</a></li>
                            <li><a href="{url page="about" op="siteMap"}">{translate key="about.siteMap"}</a></li>
                            <li><a href="{url page="about" op="aboutThisPublishingSystem"}">Sistema de publicación</a></li>
                            <li><a href="{url page="about" op="contact"}">{translate key="about.contact"}</a></li>
                        </ul>
                    </aside>
                                
                </section>
                
                <section id="footer-second">
                
                	<aside id="footer-second-1">
                        <a href="http://www.hon.ch/HONcode/Conduct.html?HONConduct255925" target="_blank" class="col-xs-12" title="{translate key="certification.hodcode.00"}">
                            <img src="{$baseUrl}/templates/images/sellos/honcode.gif" width="33" height="50" hspace="5" alt="{translate key="certification.hodcode.00"}" />
                        </a>
                        <div class="col-xs-12 text-center">
                            {translate key="certification.hodcode.01"}
                            <a href="http://www.hon.ch/HONcode/Conduct_sp.html" target="_blank" class="external">{translate key="certification.hodcode.02"}</a> {translate key="certification.hodcode.03"}:<br />
                            <a href="http://www.hon.ch/" target="_blank" class="external">{translate key="certification.hodcode.04"}</a>.<br />
                            <a href="http://www.hon.ch/HONcode/Conduct.html?HONConduct255925" target="_blank" class="external">{translate key="certification.hodcode.05"}</a>
                        </div>
                    </aside>
                    
                	<aside id="footer-second-2">
                        <a href="http://wma.comb.es/seal.php?INTWMA=1262&amp;idi=esp" target="_blank" class="col-xs-12" title="{translate key="certification.wma.00"}">
                        	<img src="{$baseUrl}/templates/images/sellos/wma.gif" width="70px" height="50px" hspace="5px" alt="{translate key="certification.wma.00"}" longdesc="http://wma.comb.es/esp/presentacio.htm" />
                        </a>
                        <div class="col-xs-12 text-center">
                            {translate key="certification.wma.01"}
                            <a href="http://wma.comb.es/esp/codi.htm" target="_blank" class="external">{translate key="certification.wma.02"}</a> {translate key="certification.wma.03"}:<br />
                            <a href="http://wma.comb.es/" target="_blank" class="external">{translate key="certification.wma.04"}</a><br />
                            <a href="http://wma.comb.es/seal.php?INTWMA=1262&amp;idi=esp" target="_blank" class="external">{translate key="certification.wma.05"}</a>
                        </div>                    
                    </aside>
                    
                	<aside id="footer-second-3">
                        <a href="http://www.portalesmedicos.com/web_interes_sanitario/100145.htm" target="_blank" class="col-xs-12" title="{translate key="certification.wis.00"}" >
                        	<img src="{$baseUrl}/templates/images/sellos/wis.jpg" width="70" height="50" hspace="5" alt="{translate key="certification.wis.00"}" />
                        </a>
                        <div class="col-xs-12 text-center">
                            {translate key="certification.wis.01"} 
                            {translate key="certification.wis.02"}:<br />
                            <a href="http://www.portalesmedicos.com/" target="_blank" class="external">{translate key="certification.wis.03"}</a><br />
                            <a href="http://www.portalesmedicos.com/web_interes_sanitario/100145.htm" target="_blank" class="external">{translate key="certification.wis.04"}</a>
                        </div>                      
                    </aside>
                    
                	<aside id="footer-second-4">
                        <a href="http://www.pwmc.org/pwmcdetalle.php?par=741" target="_blank" class="col-xs-12" title="{translate key="certification.wmc.00"}">
                        	<img src="{$baseUrl}/templates/images/sellos/wmc.gif" width="91px" height="50px" hspace="5px" alt="{translate key="certification.wmc.00"}" />
                        </a>
                        <div class="col-xs-12 text-center">
                            {translate key="certification.wmc.01"} <a href="http://www.pwmc.org/codigopwmc.htm" target="_blank" class="external">{translate key="certification.wmc.02"}</a> 
                            {translate key="certification.wmc.03"}:<br />
                            <a href="http://www.pwmc.org/index.htm" target="_blank" class="external">{translate key="certification.wmc.04"}</a><br />
                            <a href="http://www.pwmc.org/pwmcdetalle.php?par=741" target="_blank" class="external">{translate key="certification.wmc.05"}</a>
                        </div>                                             
                    </aside>
                    
                </section>
                
                <section id="footer-third">
                	<aside id="footer-third-1">
                    	Copyright © 2014 - {if $siteTitle}{$siteTitle}{else}{$applicationName}{/if} | Todos los derechos reservados.
                    </aside>
                </section>
                
                <section id="footer-fourth">
                    {if $displayCreativeCommons} {translate key="common.ccLicense"} {/if}
                    {if $pageFooter} {$pageFooter} {/if}
                    {call_hook name="Templates::Common::Footer::PageFooter"}
                </section>
                
            </footer>
            
            {get_debug_info}
            {if $enableDebugStats}{include file=$pqpTemplate}{/if}
        
        </div><!-- container -->
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <!-- script type="text/javascript" src="{$baseUrl}/lib/pkp/templates/js/jquery.min.js"></script -->
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script type="text/javascript" src="{$baseUrl}/plugins/themes/finlay/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="{$baseUrl}/plugins/themes/finlay/js/bootstrap-theme.js"></script>
    </body>
</html>
