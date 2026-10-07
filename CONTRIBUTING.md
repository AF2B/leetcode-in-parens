# Contributing

This is a personal showcase: the solutions are written by the maintainer.
Corrections are welcome — a wrong answer, a failing or missing test case, a
typo, a broken link. Alternative solutions from third parties are not
accepted. For anything bigger than a small fix, open an issue first.

## Scope

Every free (non-premium) LeetCode problem that accepts Racket. Premium
problems, and problems that don't accept Racket, are out of scope for now.

## Layout

```
solutions/<difficulty>/<slug>/
  README.md        # statement summary in your own words, link
  meta.rktd        # metadata, see below
  solution.rkt     # every approach
  test.rkt         # rackunit tests
```

- `<difficulty>` is `easy`, `medium` or `hard`, exactly as LeetCode labels
  the problem.
- `<slug>` is LeetCode's own slug (the one in the problem URL) and is the
  problem's unique key. The problem number lives in `meta.rktd` and in the
  README title, not in the folder name.
- A problem is one folder with exactly these four files, never a folder per
  approach.

## meta.rktd

A single S-expression read with `read`:

```racket
#hasheq((id . 1)
        (slug . "two-sum")
        (title . "Two Sum")
        (difficulty . easy)
        (topics . (array hash-table))
        (entry . two-sum)
        (approaches . (hash-map brute-force)))
```

- `slug` equals the folder name and `difficulty` equals the parent folder.
- `topics` are LeetCode's topic tags in kebab-case; `approaches` come from the
  closed list in [docs/vocabulary.md](docs/vocabulary.md). Extend either list
  in the same pull request that needs the new value.
- `entry` is the function LeetCode's Racket template names. It is the first
  approach (the canonical one). Every other approach is exported as
  `<entry>-<approach>`, for example `two-sum-brute-force`.
- The title, link, difficulty, topics and approaches in the problem's
  `README.md` must match this file. Difficulty is shown as 🟢 easy,
  🟡 medium or 🔴 hard.

## Code rules

1. `#lang racket/base` with explicit `require`s, grouped as standard library,
   third-party, then project modules, each group alphabetical. `#lang racket`
   is only for scripts.
2. The entry function keeps the exact name and contract of LeetCode's Racket
   template, written with `define/contract` (from `racket/contract/base` and
   `racket/contract/region`). Other approaches reuse the same contract.
   Internal helpers carry no contract.
3. A `;;` comment above each exported function: a one-line summary, one line
   per parameter (`- name: ...`), what it returns, and `Time:`/`Space:`.
4. No magic numbers or strings: give every meaningful literal a named
   constant (`(define modulus 1000000007)`).
5. Make `match`/`cond` exhaustive. The final clause raises an explicit error
   for an invariant violation; it never swallows the case.
6. Immutable by default. Use `vector-set!` and friends only when the mutation
   is the point of the approach, and say so in a comment.
7. Your own work. If an idea comes from an editorial or someone else's
   solution, credit it in a comment. Don't copy problem statements or the
   site's test data.
8. Identifiers, comments and docstrings in English.

## Tests

- `test.rkt` uses rackunit and requires `solution.rkt`.
- Cover every example from the statement and at least one edge case.
- Run every approach in `meta.rktd` against the same cases; they must agree.
- No randomness without a fixed seed, no network.
- A problem without tests isn't done.

```bash
raco test solutions/easy/two-sum
```

## Formatting and lint

- `raco fmt` is the source of truth for layout, at its default width. Run
  `raco fmt -i` on the files you touch; it never produces a diff on
  already-formatted code.
- `raco review` must report zero warnings.
- `raco make` must compile without errors.

```bash
raco pkg install --auto rackunit-lib fmt review
raco review solutions/easy/two-sum/*.rkt
raco fmt -i solutions/easy/two-sum/*.rkt
```

## Git workflow

- Branch off `main`: `feat/<slug>`, `fix/<slug>-<what>`, `docs/<what>`,
  `ci/<what>`.
- [Conventional Commits](https://www.conventionalcommits.org/) in English,
  with the slug as the scope: `feat(two-sum): add hash-map approach`,
  `fix(two-sum): handle duplicate numbers`, `docs(readme): update progress`,
  `ci: pin racket version`. Allowed types: `feat`, `fix`, `docs`, `refactor`,
  `test`, `perf`, `ci`, `chore`.
- No emoji in commit subjects. Difficulty is shown in the docs (🟢 🟡 🔴) and
  in the PR labels, never in the commit.
- One problem (or one focused change) per pull request, merged with squash.
  `main` is protected and CI must pass.
- CI runs build, tests, lint and the format check. Pull requests build and
  test only the problems they touch; `main` and a weekly schedule run
  everything.

## Labels

| Label | Color | Use |
|---|---|---|
| `easy` | `#2da44e` 🟢 | Added automatically to a PR touching `solutions/easy/` |
| `medium` | `#d4a72c` 🟡 | Added automatically to a PR touching `solutions/medium/` |
| `hard` | `#cf222e` 🔴 | Added automatically to a PR touching `solutions/hard/` |
| `bug` | default | A wrong answer or a broken solution |
| `wrong-test` | default | A test case that is incorrect or missing |
| `docs` | default | Documentation only |
| `ci` | default | Workflows and tooling |
| `translation` | default | A translated README |
| `needs-translation` | default | `README.md` changed, translations pending |

The difficulty labels come from [`.github/labeler.yml`](.github/labeler.yml)
through `actions/labeler`. The workflow only has `pull-requests: write`, so it
can add a label but not create one: all three must exist in the repository,
with the colors above, before the first pull request.

## Milestones

Maintainers mark progress with annotated tags whose message carries the count
and the date: `solved-100`, `solved-250`, `solved-500`, `solved-1000`, and so
on, plus `easy-complete`, `medium-complete` and `hard-complete`.

## Translations

The root README exists in English, Portuguese and Russian. A pull request that
changes `README.md` updates the other two, or carries the `needs-translation`
label. Everything else is English only.
