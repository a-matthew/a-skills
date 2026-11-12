<!-- This skills bundle has been generated using 'A-Skills' (https://github.com/a-matthew/a-skills). -->
# Codeowners conventions

## Semantic:

## Technical:
- If the `CODEOWNERS` file is missing, then create it under the `.github/` directory, using a plain text file with a `# Global Owners` header, under which a new line containing the '*' pattern is placed, followed by the `GitHub` login of the current Operator preceded by the '@' symbol, or by the `git` email without the '@' prefix if the login is missing.
- If a template exists under the `.github/CODEOWNERS_TEMPLATE` directory, then use it as a `CODEOWNERS` file schema reference only.
- If a `CODEOWNERS` file already exists, then do not update it, unless specifically requested to do so by the Operator.