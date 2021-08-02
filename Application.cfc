component extends=framework.one {
    this.name = hash( getCurrentTemplatePath() );

    variables.framework = {
        generateSES: true,
        SESOmitIndex: true,
        routesCaseSensitive: false,
        reloadApplicationOnEveryRequest: true,
        routes: [
			{ "/post/:slug": "/main/getPost/slug/:slug" }
        ]
    };

    function setupApplication () {

        application.javaLoaderFactory = new JavaLoaderFactory();

    }

}