<cfoutput>
<div>
	<div class="shadow rounded p-2 mb-3">
		<p>
			<h6>- Jasper FW1</h6>
			<small>
				This would be a good place to put a few blurbs about yourself.
			</small>
		</p>
	</div>
	<div class="shadow rounded p-2">
		<p>
			<h6>- Tags</h6>
			<cfloop array="#rc.tags#" index="tag">
				<a href="/tag/#tag.replace(" ", "-", "all")#"> <span class="h5"><span class="badge bg-secondary p-2">#tag#</span></span></a>
			</cfloop>
		</p>
	</div>
</div>
</cfoutput>