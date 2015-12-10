{**
 * controllers/extrasOnDemand.tpl
 *
 * Copyright (c) 2015 Carlos Cesar Caballero Diaz
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Basic markup for extras on demand widget.
 *}
 
 
<div class="accordion" id="accordion2">
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
				{translate key=$moreDetailsText}
			</a>
		</div>
		<div id="collapseOne" class="accordion-body collapse out">
			<div class="accordion-inner">
				{$extraContent}
			</div>
	</div>
</div>
</div>