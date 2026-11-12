<!-- This skills bundle has been generated using 'A-Skills' (https://github.com/a-matthew/a-skills). -->
# Reference conventions

## Semantic:

## Technical:
- The `References` header is always a 'level 1' header placed below the main document's body, titled 'References'.
- The `References` header contains nested 'level 2' sub-headers, each presented as 'Section N - ', where the letter 'N' denotes the numerical order of the 'Section', as present in the document, and the '-' (hyphen) symbol is followed by the exact title of the document section it refers to.
- Each 'Section' sub-header lists the references already present in the document, belonging to that section.
- Each of the references listed in the 'Section' should use a document-format-specific linking syntax, or a plain Markdown link for Markdown, where the name of the link is the domain name of the page (URL) and the target is the URL. If such syntax is not available in the document type, use the bare URL.
- Each reference in a 'Section' must employ a numerical, ordered system of tracking the part of the document it refers to. For Markdown files, the reference in the `References` header should be referred to as a `block`, which is invoked by `block links` within the content of the file.
- The `id` of a `block` is never reset and remains a continuous number from the numerical order index, as defined by the letter 'R'.
- Do not create a `Section` in the `References` header for the `ToC` header and do not count the `ToC` header towards the numerical order of `Sections`.
- Do not create a `Section` in the `References` header if such a section does not invoke any `block` (references), but include it in the numerical order.
- When referencing the same `block` in different `block links` (or different document-native syntax constructs), the letter 'R', which denotes the numerical order, should reference the same `block` and the existing `block` should not be duplicated.
- OBSIDIAN MARKDOWN TYPE ONLY: For marking in-text citations, quotes, context clues, use the `internal block link` syntax, formatted as '[[#^R|(R)]]', where the '#^R' syntax refers to the future `block` in the `References` and the '(R)' syntax stands for the display number synonymous with the numerical order of the `block` it refers to. The syntax structure is placed AFTER the part of text, but no later than the '.' full stop sign that closes the sentence.
- OBSIDIAN MARKDOWN TYPE ONLY: For each `internal block link`, create an appropriate `block` in the `References` header using the `block id` syntax, formatted as '^R', where the letter 'R' stands for the numerical order of the `internal block link` that refers to it. The `block id` syntax construct is the last element on the line of a reference.
- OBSIDIAN MARKDOWN TYPE ONLY: When the `Templates` folder contains the `References.md` special template, the schema within takes precedence over these conventions.
- Check URL validity in references only when the Operator asks to "verify references". Use a header-only request and record the status with the final URL, without fetching the content of every URL.
- Report broken (4xx/5xx) or redirected URLs in the chat. Do not modify such URLs in the files.