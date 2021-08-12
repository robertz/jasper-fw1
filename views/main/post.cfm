
<cfoutput>
<div class="row lazy">
	<div class="col-lg-2 d-none d-lg-block d-xl-block"></div>
	<div class="col-lg-8 col-md-12 post">
		<div class="row">
			<div class="col-lg-8 col-md-12">
				<div class="mb-3">
					<div>
						<cfloop array="#rc.post.tags#" item="tag">
							<span class="badge bg-secondary">#tag#</span>
						</cfloop>
					</div>
					<p class="h2">#rc.post.title#</p>
					<div class="mb-2">
						<strong>#rc.post.author#</strong><br />
						<span class="text-muted small">#dateFormat(rc.post.publishDate, "mmm dd, yyyy")#</span>
					</div>
					<p class="small">#rc.post.description#</p>
				</div>
				<div class="mb-5">
					#rc.html#
				</div>
			</div>
			<div class="col-lg-4 d-none d-lg-block d-xl-block">
				#view("main/sidebar")#
			</div>
		</div>
	</div>
	<div class="col-lg-2 d-none d-lg-block d-xl-block"></div>
</div>
</cfoutput>