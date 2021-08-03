<cfoutput>
<div class="row lazy">
	<div class="col-md-2 hidden-sm"></div>
	<div class="col-md-8 col-sm-12 post">
		<cfif rc.page.status eq "ok">
			<div class="mb-3">
				<p class="h2">#rc.page.title#</p>
			</div>
			#rc.html#
		</cfif>
	</div>
	<div class="col-md-2 hidden-sm"></div>
</div>
</cfoutput>