component accessors = true {

    property postService;
    property markdownService;
	property fw;

    function default ( rc ) {
		variables.fw.setLayout('landing');
        rc['posts'] = postService.list();
		rc['tags'] = postService.getTags();
    }

    function post ( rc ) {
        rc['content'] = markdownService.toHtml(postService.getMarkdown('marvel-movies-in-order').markdown);
    }

}