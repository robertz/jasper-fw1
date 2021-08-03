component accessors = true {

	property fw;
    property markdownService;
    property postService;
	property pageService;

    function default ( rc ) {
        rc['posts'] = postService.list();
		rc['tags'] = postService.getTags();
    }

    function getPost ( rc ) {
		rc['post'] = postService.getFrontMatter(slug = rc.slug);
		rc['tags'] = postService.getTags();
		rc['html'] = markdownService.toHtml(postService.getMarkdown(slug = rc.slug).markdown);
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

	}

}