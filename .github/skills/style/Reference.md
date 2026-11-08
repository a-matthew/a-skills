<!-- This skills bundle has been generated using 'A-Skills' (https://github.com/a-matthew/a-skills). -->
# Reference conventions

## Semantic:

## Technical:
- `References` header is always 'level 1' header placed below the main document's body, titled 'References'.
- The `References` header contains nested 'level 2' sub-headers, each presented as 'Section N - ', where letter 'N' denotes the numerical order of the 'Section', as present in the document, and the '-' (hyphen) symbol is followed by the exactly same title as the document's section's name, to which it refers.
- Each 'Section' sub-header lists the references already present in the document, belonging to that section.
- Each of the references listed out of the 'Section' should use a document format-specific linking syntax, or a plain markdown link for Markdown, where the name of the link is the domain name of the page (URL) and the target is the URL. If such syntax is not available in the document type, use the bare URL.
- Each reference in a 'Section' must employ a numerical, ordered system of tracking the part of document it refers to. For Markdown files the reference in `References` header should be referred to as `block`, which is invoked by `block links` within the content of the file.
- The `id` of a `block` is never reset and remains a continuous number from the numerical order index, as defined by letter 'N'.
- Do not create a `Section` in `References` header for the `ToC` header and do not count the `ToC` header towards the numerical order of `Sections`
- Do not create a `Section` in `References` header if such section does not invoke any `block` (references), but include them in the numerical order.
- When referencing the same `block` in different `block links` (or different document-native syntax constructs) the letter 'N', that denotes the numerical order should reference the same `block` and the existing `block` should not be duplicated.
- OBSIDIAN MARKDOWN TYPE ONLY: For marking in-text citations, quotes, context clues use the `internal block link` syntax, formatted as '[[#^N|(N)]]', where the '#^N' syntax refers to the future `block` in the `References` and the '(N)' syntax stands for the display number synonymous with the numerical order of the `block` it refers to. The syntax structure is placed AFTER the part of text, but at latest before the '.' full stop sign that closes that text sentence.
- OBSIDIAN MARKDOWN TYPE ONLY: For each `internal block link` create an appropriate `block` in the `References` header using the `block id` syntax, formatted as '^N', where the letter 'N' stands for the numerical order of the `internal block link` it is referred by. The `block id` syntax construct is the last element on the line of a reference.
- OBSIDIAN MARKDOWN TYPE ONLY: When the `Templates` folder contains the `References.md` special template, the schema within takes precedence over these conventions.
- Check URL validity in references only when the operator asks to "verify references". Use a header-only request and record the status with final URL, without fetching content of every URL.
- Report broken (4xx/5xx) or redirected URLs in the chat. Do not modify such URLs in the files.