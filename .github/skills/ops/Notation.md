<!-- This skills bundle has been generated using 'A-Skills' (https://github.com/a-matthew/a-skills). -->
# Naming conventions

## Semantic:
- Apply the rule of 'compound nouns' to every name (of any type) created.
- The `ops` tools are defined as tools from the fields of `DevOps`, `SecOps` and `CloudOps` (the list may be extended).
- Follow the name-building scheme `objectClassifierObjectClassifier`, where `object` is synonymous with 'noun' and `classifier` is synonymous with 'adjective'. The first 'object' in the chain is called the `primary word` for the purposes of this notation.
- This scheme must remain compatible with the naming conventions of the programming language of the file being worked on.
- Every `function`, `method`, `lambda` (or functionally similar syntax structure) must have its name suffixed with a '_verb' in its base (infinitive) form, where the `verb` defines its main functionality. Example: a function calculating the offset of coordinates must be named 'offset_coordinates_calculate'.
- The `primary word` (the first 'noun' of the compound-noun semantic chain) must refer to the most general (least specific) 'class' of the item. Example: a variable defining the length of a science book must be named 'length_book_science'.
- When working with statically typed programming languages, the 'variable' (in the conceptual sense) should NOT carry a type annotation in its name. However, when the language is dynamically typed, the variable name must be suffixed with its exact type. This type must exactly match one of the built-in types of the programming language.
- TERRAFORM AND DERIVATIVES: This rule partially applies to certain statically typed languages (such as HCL), where the suffix should only define the collection type of the object. An object with a one-dimensional index should be suffixed with '_list', '_set' or '_map', while objects with an index of two or more dimensions are suffixed with '_object'. The exact form of the suffixes should remain compatible with the guidelines of the language.
- TERRAFORM AND DERIVATIVES: When working with one of the `ops` tools, such as Terraform, the `primary word` is always the name of the `deployment` that the `object`, `variable`, `local`, `input`, `output` (and so on) belongs to. Example: a `local` value in Terraform defining a `list` of `Storage Account` names within the 'FrontEnd' deployment must be named 'frontend_st_list'.
- When working with class-specific variables, the `primary word` is always the direct class name, preceded by its parent classes (in top-down order), if any exist. Example: a constant referencing the maximum height of the class `cat`, derived from the class `animals`, must be written as 'animals_cat_height'.

## Technical:
- This convention was authored by 'Mateusz Adamczyk'. It is derived from certain semantic rules of the Polish and German languages, and influenced by `Hungarian notation` and The Ohio State University's "File Naming Convention Best Practices" guide.
- This convention applies to programming languages and similar Turing-complete tools.
- Always prioritise language-specific guidelines where they exist, and apply this convention only as a non-conflicting extension of them.