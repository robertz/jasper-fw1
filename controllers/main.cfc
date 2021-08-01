component accessors = true {

    property postService;
    property markdownService;

    function default ( rc ) {
        rc['content'] = markdownService.toHtml(postService.getMarkdown('marvel-movies-in-order').markdown);
    }
}