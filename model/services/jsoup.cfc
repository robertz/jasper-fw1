component {

	function init () {
        variables.javaloader = application.javaLoaderFactory.getJavaLoader([
            expandPath("/lib/jsoup-1.12.1.jar")
        ]);
		variables.jsoup = javaloader.create("org.jsoup.Jsoup");
		return this;
	}

	function parse ( required string html ) {
		return variables.jsoup.parse( arguments.html );
	}
}