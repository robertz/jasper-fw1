component accessors = true {

	property fw;
    property markdownService;
	property jsoupService;
    property postService;
	property pageService;
	property buildService;


	function before ( rc ) {
		rc.append({
			meta: {
				title: "Jasper",
				description: "Jasper: A static site generator written in ColdFusion",
				author: "Jasper",
				url: "https://example.com"
			},
			contentPages: [
				{ action: "main.index", file: "index.html" },
				{ action: "main.404", file: "404.html" },
				{ action: "main.search", file: "search.html" }
			],
			headers: []
		});
	}

    function index ( rc ) {
        rc['posts'] = postService.list();
		rc['tags'] = postService.getTags();
    }

    function getPost ( rc ) {
		rc['post'] = postService.getFrontMatter(slug = rc.slug);
		rc['tags'] = postService.getTags();
		rc['html'] = markdownService.toHtml(postService.getMarkdown(slug = rc.slug).markdown);

		if(rc.post.status == "ok"){
			rc.meta.title &= " - " & rc.post.title;
			// set social tags
			rc.headers.append({'property': "og:title", 'content': "#rc.post.title#"});
			rc.headers.append({'property': "og:description", 'content': "#rc.post.description#"});
			rc.headers.append({'property': "og:image", 'content': "#rc.post.image#"});
			rc.headers.append({'name': "twitter:card", 'content': "summary_large_image"});
			rc.headers.append({'name': "twitter:title", 'content': "#rc.post.title#"});
			rc.headers.append({'name': "twitter:description", 'content': "#rc.post.description#"});
			rc.headers.append({'name': "twitter:image", 'content': "#rc.post.image#"});
		}

		fw.setView( rc.post.status == "ok" ? "main.post" : "main.404" );
    }

	function getPage ( rc ) {
		rc['page'] = pageService.getFrontMatter(slug = rc.slug);
		rc['html'] = markdownService.toHTML(pageService.getMarkdown(slug = rc.slug).markdown);
		fw.setView( rc.page.status == "ok" ? "main.page" : "main.404" );
	}

	function byTag ( rc ) {
		var posts = postService.list();
		rc['tag']= rc.tag.replace("-", " ", "all")
		rc['posts'] = posts.filter((post) => {
			return post.tags.find(rc.tag);
		});
		fw.setView( "main.tags" )
	}

	function search ( rc ) {
		var posts = postService.list();
		var output = [];
		var id = 0;
		posts.each((post) => {
			output.append({
				"id": id,
				"slug": post.slug,
				"title": post.title,
				"description": post.description,
				"body": jsoupService.parse(markdownService.toHTML(postService.getMarkdown(slug = post.slug).markdown)).text(),
				"author": post.author
			});
			id++;
		});
		rc['docs'] = serializeJSON(output);
		fw.setView( "main.search" );
	}

	// Builds and deployments
	function build ( rc ) {
		variables.fw.renderData().data( buildService.generateStaticContent( rc )).type( "text" );
	}


}