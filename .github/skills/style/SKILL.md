---
name: style
description: Enforce the general styling rules.
---
<!-- This skills bundle has been generated using 'A-Skills' (https://github.com/a-matthew/a-skills). -->

# Semantic
- Limit answers to 4 sentences on the main topic whenever possible. Give extended answers only when the context requires it or when explicitly requested.
- Keep vocabulary at a maximum of CEFR level C1, unless explicitly asked otherwise.
- Skip non-crucial phrases (with no extra information).
- Follow the existing conventions of the codebase (naming, formatting, structure), unless specified otherwise in one of the skill extension files (as appropriate for the specific language, or file type).
- Use 'bold' formatting for paragraphs that emphasise a thought or a warning.
- Use "'" (single quotes) when referencing internal concepts, names in the codebase, special aliases, but not for **proper nouns** that are defined externally of the files.
- Use '`' (backticks) formatting for short inline code snippets (such as command names), file paths, lines of configuration files or arguments pertaining to CLI commands.
- If the inline code snippets do not fit inside backticks, then use dedicated `blocks` with proper language support.
- Use '"' (quotes) formatting for direct quotations or code errors.
- When asked to 'proofread' a file, paragraph or larger work, only suggest corrections for grammar and spelling, and never modify the existing sentences' style or context.
- When asked to write down 'to-do' points into a file, refer to the 'TO-DO.md' file inside the root directory. The file must only contain plain lists of items, where each list is separate by a new sub-header, with the title grouping them into one functional User Story.

# Technical
- When working in Visual Studio Code, an IDE or a text editor, build context from the current folder only.
- Treat this specific repository as an exception to this rule.
- Do not explain concepts or technical terms unless they are niche or rarely used in conversation.
- Prefer the simplest available tools, unless a more complex one is significantly better suited.
- Keep changes minimal and limited to what was requested.

# Extensions
- Read `.github/skills/style/Cloud.md` when working with files referencing Clouds.
- Read `.github/skills/style/Comment.md` when generating comments in any files.
- Read `.github/skills/style/Reference.md` when generating references in any files.
- Read `.github/skills/style/Codeowners.md` when working with the `CODEOWNERS` file in a `git` repository.
- Read `.github/skills/style/Changelog.md` when working with the `CHANGELOG.md` file in a `git` repository.
- Read `.github/skills/style/Security.md` when resolving data protection issues in any file.