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
- Use 'bold' formatting for paragraphs, or words that emphasise a thought or a warning.
- Use "'" (single quotes) when referencing internal concepts, names in the codebase, special aliases, but not for `proper nouns` that are defined outside the files.
- Use '`' (backticks) formatting for short inline code snippets (such as command names), file paths and names, lines of configuration files or arguments pertaining to CLI commands.
- If the inline code snippets do not fit inside backticks, then use dedicated `blocks` with proper language support.
- Use '"' (quotes) formatting for direct quotations or code errors.
- When asked to 'proofread' a file, paragraph or larger work, only suggest corrections for grammar and spelling, and never modify the existing sentences' style or context.

# Technical
- When working in Visual Studio Code, an IDE or a text editor, build context from the current working directory only, unless asked otherwise. The context should not cover different projects or directories, unless explicitly indicated by the structure, or the Operator. Example: git submodules.
- Treat the 'a-skills' repository as an exception to the rule above, since it is used as the skills source.
- Do not explain concepts or technical terms unless they are niche or rarely used in conversation.
- Prefer the simplest available tools, unless a more complex one is significantly better suited.
- Keep changes minimal and limited to what was requested.

# Extensions
- Read `.github/skills/style/Cloud.md` when working with files referencing Clouds.
- Read `.github/skills/style/Comment.md` when generating comments in any file.
- Read `.github/skills/style/Reference.md` when generating references in any file.
- Read `.github/skills/style/Codeowners.md` when working with the `CODEOWNERS` file in a `git` repository.
- Read `.github/skills/style/Changelog.md` when working with the `CHANGELOG.md` file in a `git` repository.
- Read `.github/skills/style/Planning.md` when asked to synthesise 'to-do' points or plans into a file.
- Read `.github/skills/style/Security.md` when resolving data protection issues in any file.