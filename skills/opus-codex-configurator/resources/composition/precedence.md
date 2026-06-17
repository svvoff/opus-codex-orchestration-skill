# Profile Composition and Precedence

## Rule order

1. User/project-specific instructions
2. Risk-area profiles
3. Integration profiles
4. Framework profiles
5. Language profiles
6. Platform profiles
7. Generic defaults

## Conflict handling

- More specific beats more general.
- More restrictive beats more permissive.
- Safety beats convenience.
- Project-specific facts beat reusable assumptions.
- Repository evidence beats guessed stack labels.

## Output transparency

The configuration draft must list:

- profiles used;
- profiles drafted lazily;
- rules overridden;
- assumptions;
- unresolved conflicts.
