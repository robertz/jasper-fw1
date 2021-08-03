component {
    property parser;
    property renderer;

    // Initialize the markdown service
    function init() {
        variables.javaloader = application.javaLoaderFactory.getJavaLoader([
            expandPath("/lib/autolink-0.6.0.jar"),
            expandPath("/lib/flexmark-0.50.50.jar"),
            expandPath("/lib/flexmark-ext-anchorlink-0.50.50.jar"),
            expandPath("/lib/flexmark-ext-autolink-0.50.50.jar"),
            expandPath("/lib/flexmark-ext-gfm-strikethrough-0.50.50.jar"),
            expandPath("/lib/flexmark-ext-gfm-tables-0.50.50.jar"),
            expandPath("/lib/flexmark-ext-gfm-tasklist-0.50.50.jar"),
            expandPath("/lib/flexmark-ext-tables-0.50.50.jar"),
            expandPath("/lib/flexmark-ext-toc-0.50.50.jar"),
            expandPath("/lib/flexmark-ext-youtube-embedded-0.50.50.jar"),
            expandPath("/lib/flexmark-formatter-0.50.50.jar"),
            expandPath("/lib/flexmark-html-parser-0.50.50.jar"),
            expandPath("/lib/flexmark-html2md-converter-0.50.50.jar"),
            expandPath("/lib/flexmark-util-0.50.50.jar"),
            expandPath("/lib/jsoup-1.12.1.jar")
        ]);
        // Set the plugin options for the renderer
        variables.options = {
            autoLinkUrls: true,
            anchorLinks: true,
            anchorSetId: true,
            achorSetName: true,
            anchorWrapText: false,
            anchorClass: "anchor",
            anchorPrefix: "",
            anchorSuffix: "",
            enableYouTubeTransformer: false,
            tableOptions: {
                columnSpans: true,
                appendMissingColumns: true,
                discardExtraColumns: true,
                className: "table",
                headerSeparationColumnMatch: true
            }
        };

        variables.StaticParser = javaloader.create("com.vladsch.flexmark.parser.Parser");
        variables.HtmlRenderer = javaloader.create("com.vladsch.flexmark.html.HtmlRenderer");
        var parserOptions = createOptions(options);
        variables.parser = StaticParser.builder(parserOptions).build();
        variables.renderer = HtmlRenderer.builder(parserOptions).build();
        variables.htmlToMarkdown = javaLoader
            .create("com.vladsch.flexmark.html2md.converter.FlexmarkHtmlConverter")
            .builder(parserOptions)
            .build();
        return this;
    }

    private function createOptions(required struct options) {
        var staticTableExtension = javaloader.create("com.vladsch.flexmark.ext.tables.TablesExtension");
        var anchorLinkExtension = javaloader.create("com.vladsch.flexmark.ext.anchorlink.AnchorLinkExtension");

        var extensionsToLoad = [
            staticTableExtension.create(),
            javaloader.create("com.vladsch.flexmark.ext.gfm.strikethrough.StrikethroughSubscriptExtension").create(),
            javaloader.create("com.vladsch.flexmark.ext.gfm.tasklist.TaskListExtension").create(),
            javaloader.create("com.vladsch.flexmark.ext.toc.TocExtension").create()
        ];

        // autoLinkUrls
        if (arguments.options.autoLinkUrls) {
            extensionsToLoad.append(
                javaloader.create("com.vladsch.flexmark.ext.autolink.AutolinkExtension").create()
            );
        }
        // AnchorLinks
        if (arguments.options.anchorLinks) {
            extensionsToLoad.append(anchorLinkExtension.create());
        }
        // Youtube Transformer
        if (arguments.options.enableYouTubeTransformer) {
            extensionsToLoad.append(
                javaloader.create("com.vladsch.flexmark.ext.youtube.embedded.YouTubeLinkExtension").create()
            );
        }

        return javaloader
            .create("com.vladsch.flexmark.util.data.MutableDataSet")
            .init()
            // Autolink + Anchor Link Options
            .set(
                variables.StaticParser.WWW_AUTO_LINK_ELEMENT,
                javacast(
                    "boolean",
                    arguments.options.autoLinkUrls
                )
            )
            .set(
                anchorLinkExtension.ANCHORLINKS_SET_ID,
                javacast(
                    "boolean",
                    arguments.options.anchorSetId
                )
            )
            .set(
                anchorLinkExtension.ANCHORLINKS_SET_NAME,
                javacast(
                    "boolean",
                    arguments.options.achorSetName
                )
            )
            .set(
                anchorLinkExtension.ANCHORLINKS_WRAP_TEXT,
                javacast(
                    "boolean",
                    arguments.options.anchorWrapText
                )
            )
            .set(
                anchorLinkExtension.ANCHORLINKS_ANCHOR_CLASS,
                arguments.options.anchorClass
            )
            .set(
                anchorLinkExtension.ANCHORLINKS_TEXT_PREFIX,
                arguments.options.anchorPrefix
            )
            .set(
                anchorLinkExtension.ANCHORLINKS_TEXT_SUFFIX,
                arguments.options.anchorSuffix
            )
            // Add Table Options
            .set(
                staticTableExtension.COLUMN_SPANS,
                javacast(
                    "boolean",
                    arguments.options.tableOptions.columnSpans
                )
            )
            .set(
                staticTableExtension.APPEND_MISSING_COLUMNS,
                javacast(
                    "boolean",
                    arguments.options.tableOptions.appendMissingColumns
                )
            )
            .set(
                staticTableExtension.DISCARD_EXTRA_COLUMNS,
                javacast(
                    "boolean",
                    arguments.options.tableOptions.discardExtraColumns
                )
            )
            .set(
                staticTableExtension.CLASS_NAME,
                arguments.options.tableOptions.className
            )
            .set(
                staticTableExtension.HEADER_SEPARATOR_COLUMN_MATCH,
                javacast(
                    "boolean",
                    arguments.options.tableOptions.headerSeparationColumnMatch
                )
            )
            // Load extensions
            .set(
                variables.StaticParser.EXTENSIONS,
                extensionsToLoad
            );
    }

    // Convert markdown to html
    function toHTML(required txt) {
        var document = variables.parser.parse(trim(arguments.txt));
        return trim(variables.renderer.render(document));
    }

    // Convert html to markdown
    function toMarkdown(required html) {
        return variables.htmlToMarkdown.convert(trim(arguments.html));
    }
}