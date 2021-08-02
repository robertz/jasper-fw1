component accessors = true {

    property postService;
    property markdownService;
	property fw;

    function default ( rc ) {
		variables.fw.setLayout('landing');
        rc['posts'] = postService.list();
		rc['tags'] = postService.getTags();
    }

    function getPost ( rc ) {
		rc['post'] = postService.getFrontMatter(rc.slug);
		rc['tags'] = postService.getTags();
		rc['html'] = markdownService.toHtml(postService.getMarkdown(rc.slug).markdown);
    }

}