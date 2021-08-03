component extends=framework.one {
    this.name = hash( getCurrentTemplatePath() );

    variables.framework = {
        generateSES: true,
        SESOmitIndex: true,
        routesCaseSensitive: false,
        reloadApplicationOnEveryRequest: true,
        routes: [
			{ "/post/:slug": "/main/getPost/slug/:slug" },
			{ "/page/:slug": "/main/getPage/slug/:slug" },
			{ "/tag/:tag": "/main/byTag/tag/:tag" },
			{ "/search": "/main/search" }
        ]
    };

    function setupApplication () {

        application.javaLoaderFactory = new JavaLoaderFactory();

    }

}