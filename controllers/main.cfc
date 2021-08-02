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
        rc['content'] = markdownService.toHtml(postService.getMarkdown(rc.slug).markdown);
    }

}