<cfoutput>
<!doctype html>
<html class="no-js" lang="">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>#rc.meta.title#</title>
	<meta name="description" content="#rc.meta.description#">
    <meta name="author" content="#rc.meta.author#">
	<meta name="twitter:widgets:theme" content="light">
	<meta name="twitter:widgets:border-color" content="##55acee">

	<cfloop array="#rc.headers#" index="header">
		<cfif header.keyExists("property")>
			<meta property="#header.property#" content="#header.content#" />
		<cfelse>
			<meta name="#header.name#" content="#header.content#" />
		</cfif>
	</cfloop>

	<link rel="stylesheet" href="/assets/css/site.css">
	<link href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body style="padding-top: 70px;">
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="/">Jasper</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<a class="nav-link" href="/tag/code">Code</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="/tag/misc">Misc</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="/page/readme">Readme</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="/search">Search</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!---Container And Views --->
	<div class="container">#body#</div>

	<footer class="border-top py-3 mt-5">
		<div class="container">
			<small>KISDigital.com&copy; 2020 - #dateFormat(now(), "yyyy")#</small>
		</div>
	</footer>

	<!---js --->
	<script src="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/gh/dkern/jquery.lazy@1.7.10/jquery.lazy.min.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/gh/dkern/jquery.lazy@1.7.10/jquery.lazy.plugins.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.23.0/prism.min.js"
		integrity="sha512-YBk7HhgDZvBxmtOfUdvX0z8IH2d10Hp3aEygaMNhtF8fSOvBZ16D/1bXZTJV6ndk/L/DlXxYStP8jrF77v2MIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
		$(function($) {
			$('.lazy img').lazy()
		})
	</script>
</body>

</html>
</cfoutput>