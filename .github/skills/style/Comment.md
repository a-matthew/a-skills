<!-- This skills bundle has been generated using 'A-Skills' (https://github.com/a-matthew/a-skills). -->
# Comment conventions

## Semantic:
- Keep the comments short and simple.
- Each `code construct` in a programming, scripting or declarative configuration language (such as HCL) should have at most 2 comments.
- Each generated comment cannot be longer than 2 sentences.

## Technical:
- Do not modify existing comments, unless fixing the overall grammatical correctness.
- Comments may only be extended by adding a language-specific comment annotation with the new text next to the old one.
- When adding comments, prefix them with "Auto-generated", followed by the ':' symbol and the content of the comment.
- Do not generate comments if a file matches one in the list: ['outputs.tf', 'versions.tf', 'variables.tf' ]