component extends=framework.one {
    this.name = hash( getCurrentTemplatePath() );

    variables.framework = {
        generateSES: true,
        SESOmitIndex: true,
        routesCaseSensitive: false,
        reloadApplicationOnEveryRequest: true,
        routes: [
            // { "/api/cache/region/:region/key/:key/env/:env/meta": "/main/getCacheKeyMeta/region/:region/key/:key/env/:env" }, // meta data
            // { "/api/cache/region/:region/key/:key/env/:env/partial": "/main/getRegionKeysPartial/region/:region/key/:key/env/:env" }, // partial search
            // { "/api/cache/region/:region/key/:key/env/:env": "/main/getCacheKey/region/:region/key/:key/env/:env" }, // get a cache key
            // { "/api/cache/region/:region/env/:env": "/main/getRegionkeys/region/:region/env/:env" }, // list keys for a region
            // { "/api/cache/regions/env/:env": "/main/getRegions/env/:env" } // list regions
        ]
    };

    function setupApplication () {

        application.javaLoaderFactory = new JavaLoaderFactory();

    }

}