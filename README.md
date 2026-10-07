[English](README.md) | [Português](README.pt-br.md) | [Русский](README.ru-ru.md)

# LeetCode in Parens

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Common Lisp](https://img.shields.io/badge/Common%20Lisp-SBCL-3d6aa6.svg)

Every free LeetCode problem in the Algorithms category, solved in Common Lisp.
One file per problem, often with more than one approach — brute force,
optimized, recursive — side by side in the same file.

## Progress

| Difficulty | Solved |
|---|---|
| 🟢 Easy | 1 |
| 🟡 Medium | 0 |
| 🔴 Hard | 0 |

The full index, by number, difficulty and topic, lives in
[PROBLEMS.md](PROBLEMS.md).

## Why several approaches per problem

Solving a problem once proves you found an answer. Solving it again as a
brute-force baseline, again as the optimized version, again recursively (or
however else it can be attacked) proves you understand *why* the answer works
— and leaves a reference for how the same idea looks under different
constraints. It isn't a requirement for every problem, but the structure is
ready for it whenever it's worth doing.

## Repository layout

```
solutions/
  easy/
    two-sum.lisp
  medium/
  hard/
```

A problem is a single `.lisp` file, named by LeetCode's own slug (the one in
the problem URL) and placed directly inside the difficulty folder LeetCode
gives it. The problem number isn't in the path; the slug is the unique key.
Each file holds:

- a header comment with the link, difficulty, topics and approaches;
- its own package, `leetcode.<slug>`, with an explicit export list;
- one function per approach: the one named after the problem is the canonical
  approach, the others carry a suffix, like `two-sum-brute-force`;
- the statement's examples at the bottom, as comments with the expected
  results.

GitHub's web UI truncates folders with more than 1,000 entries, and `medium/`
will pass that. Use [PROBLEMS.md](PROBLEMS.md) or press `t` on the repository
page to find a problem.

## Running locally

Requirements: [SBCL](https://www.sbcl.org).

```bash
sbcl --load solutions/easy/two-sum.lisp
```

```lisp
(leetcode.two-sum:two-sum '(2 7 11 15) 9)
;; => (0 1)
```

## How solutions are verified

There is no CI and no test suite. Before a solution is pushed, the author loads
it in SBCL and evaluates by hand the examples at the bottom of the file at the
REPL. These solutions aren't judged by LeetCode, so nothing else checks them: an
issue about a wrong answer is welcome.

## Conventions

- Common Lisp, developed with SBCL.
- One package per file with an explicit `:export`; `kebab-case` names.
- Every exported function has a docstring with one line per parameter.
- Expected failures are condition types (`no-solution`), not generic errors.
- Conventional Commits in English, pushed straight to `main`.

The full rules are in [CONTRIBUTING.md](CONTRIBUTING.md).

## Milestones

Annotated git tags mark progress: `solved-100`, `solved-250`, `solved-500`,
`solved-1000`, and so on, plus `easy-complete`, `medium-complete` and
`hard-complete` when a whole difficulty is cleared.

## Scope and legal

The scope is every free (non-premium) problem in LeetCode's Algorithms
category. SQL, Bash, Pandas and JavaScript 30-day problems are out of scope.

Problem statements belong to LeetCode. This repository links to each problem
and doesn't copy statements or the site's test data. It is not affiliated with
LeetCode.

## Contributing

This is a personal showcase, so the solutions are the maintainer's own.
Corrections are welcome — a wrong answer, a typo — as an issue or a pull
request, see [CONTRIBUTING.md](CONTRIBUTING.md). Alternative solutions from
third parties aren't accepted.

## License

MIT — see [LICENSE](LICENSE).
