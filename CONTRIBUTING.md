# Contributing

This is a personal showcase: the solutions are written by the maintainer.
Corrections are welcome — a wrong answer, a typo, a broken link — as an issue
or a pull request. Alternative solutions from third parties are not accepted.
For anything bigger than a small fix, open an issue first.

## Scope

Every free (non-premium) problem in LeetCode's Algorithms category. SQL, Bash,
Pandas and JavaScript 30-day problems, and premium problems, are out of scope.

## Layout

```
solutions/<difficulty>/<slug>.lisp
```

- `<difficulty>` is `easy`, `medium` or `hard`, exactly as LeetCode labels the
  problem.
- `<slug>` is LeetCode's own slug (the one in the problem URL) and is the
  problem's unique key. The problem number isn't in the path.
- A problem is one file, and every approach lives in it. Never a folder or a
  file per approach.

## Anatomy of a file

```lisp
;;;; Two Sum
;;;; https://leetcode.com/problems/two-sum/
;;;; Difficulty: 🟢 easy
;;;; Topics: array, hash-table
;;;; Approaches: hash-map, brute-force

(defpackage #:leetcode.two-sum
  (:use #:cl)
  (:export #:two-sum
           #:two-sum-brute-force))

(in-package #:leetcode.two-sum)

(defun two-sum (nums target)
  "Return the indices of the two numbers in NUMS that add up to TARGET.

- NUMS: a list of integers to search.
- TARGET: the sum to reach.

Returns a list of the two indices in ascending order."
  ...)

;;; Examples, to evaluate by hand at the REPL:
;;;
;;; (two-sum '(2 7 11 15) 9) ;; => (0 1)
```

See [`solutions/easy/two-sum.lisp`](solutions/easy/two-sum.lisp) for a complete
file.

- The header has the title, the link, the difficulty as 🟢 easy, 🟡 medium or
  🔴 hard, the topics and the approaches, with values from
  [docs/vocabulary.md](docs/vocabulary.md). The first approach listed is the
  canonical one.
- The function named after the problem is the canonical approach. Every other
  approach is exported as `<name>-<approach>`, for example
  `two-sum-brute-force`.

## Code rules

1. Common Lisp, developed with SBCL.
2. One `defpackage` per file, named `leetcode.<slug>`, with `(:use #:cl)` and an
   explicit `:export`. Write the names uninterned (`#:name`).
3. `kebab-case` names, `*special*` for globals and `+constant+` for constants.
   No magic numbers or strings: give every meaningful literal a name, or a
   condition type.
4. Every exported function has a docstring: a one-line summary, one
   `- ARG: ...` line per parameter (uppercase), and what it returns.
5. `check-type` on the arguments of exported functions.
6. An expected failure is a condition type signaled with `error` (for example
   `no-solution`), never `ignore-errors`.
7. Name intermediate values with `let` instead of nesting calls deeply.
8. Your own work. If an idea comes from an editorial or someone else's
   solution, credit it in a comment. Don't copy problem statements or the
   site's test data.
9. Identifiers, comments and docstrings in English.

## Verification

There is no CI and no test suite. Before pushing a solution:

- load the file in a fresh SBCL and make sure it prints no `WARNING` or
  `STYLE-WARNING`;
- evaluate by hand every example at the bottom of the file; each one must give
  the result its comment promises.

```bash
sbcl --noinform --no-userinit --load solutions/easy/two-sum.lisp
```

## Git workflow

- Push straight to `main`.
- [Conventional Commits](https://www.conventionalcommits.org/) in English, with
  the slug as the scope: `feat(two-sum): add hash-map approach`,
  `fix(two-sum): handle duplicate numbers`, `docs(readme): update progress`.
  Allowed types: `feat`, `fix`, `docs`, `refactor`, `perf`, `chore`.
- No emoji in commit subjects. Difficulty is shown in the docs (🟢 🟡 🔴), never
  in the commit.
- Add the new problem to [PROBLEMS.md](PROBLEMS.md) and update the progress
  table in the READMEs in the same commit as the solution.

## Milestones

Maintainers mark progress with annotated tags whose message carries the count
and the date: `solved-100`, `solved-250`, `solved-500`, `solved-1000`, and so
on, plus `easy-complete`, `medium-complete` and `hard-complete`.

## Translations

The root README exists in English, Portuguese and Russian. A commit that changes
`README.md` updates the other two in the same commit. Everything else is
English only.
