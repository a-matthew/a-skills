<!-- This skills bundle has been generated using 'A-Skills' (https://github.com/a-matthew/a-skills). -->
# Codeowners conventions

## Semantic:

## Technical:
- If the `CODEOWNERS` file is missing then create it under `.github/` directory, using a plain textfile with a `# Global Owners` header, under which a new line containing the `GitHub` login of the current Operator is placed, the loging substituted being substituted with the `git` name if missing, preceded only by the symbol '@' on that line.
- If a template exists under `.github/CODEOWNERS_TEMPLATE` directory, then use it as a `CODEOWNERS` file schema reference only.
- If a `CODEOWNERS` file already exists then do not update it, unless specifically requested to do so by the Operator.