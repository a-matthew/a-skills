<!-- This skills bundle has been generated using 'A-Skills' (https://github.com/a-matthew/a-skills). -->
# Terraform conventions

## Semantic:
- New Resources should always receive appropriate locals for storing names, or groups of objects, following already established patterns existing in this working directory's files, repository or notes.

## Technical:
- Default Azure Terraform providers to AzureRM. Only consider AzAPI when AzureRM lacks significant feature coverage compared to AzAPI, or when the object schemas for AzureAM and AzAPI are similar.

