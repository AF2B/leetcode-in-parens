[English](README.md) | [Português](README.pt-br.md) | [Русский](README.ru-ru.md)

# LeetCode in Parens

![CI](https://github.com/AF2B/leetcode-in-parens/actions/workflows/ci.yml/badge.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Racket](https://img.shields.io/badge/Racket-CS-9f1d20.svg)

Every free LeetCode problem that accepts Racket, solved in parentheses. Each
solution is idiomatic Racket, tested with rackunit, and often solved from more
than one angle — brute force, optimized, recursive — side by side in the same
file. Build, lint, format and tests run on every pull request.

## Progress

<!-- progress:start -->
| Difficulty | Solved |
|---|---|
| 🟢 Easy | 1 |
| 🟡 Medium | 0 |
| 🔴 Hard | 0 |
<!-- progress:end -->

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
    two-sum/
      README.md        # statement summary in my own words, link
      meta.rktd        # id, slug, title, difficulty, topics, approaches
      solution.rkt     # every approach; the first one is the canonical one
      test.rkt         # rackunit tests
  medium/
  hard/
```

Problems sit directly inside the difficulty folder LeetCode gives them, named
by LeetCode's own slug (the one in the problem URL). The slug is the problem's
unique key; the problem number lives in `meta.rktd` and in the README title.
A problem is one folder with exactly four files, never a folder per approach:
each approach is another function in the same `solution.rkt`, covered by the
same `test.rkt`.

GitHub's web UI truncates folders with more than 1,000 entries, and `medium/`
will pass that. Use [PROBLEMS.md](PROBLEMS.md) or press `t` on the repository
page to find a problem.

## Running locally

Requirements: Racket CS (the version pinned in
[`.github/workflows/ci.yml`](.github/workflows/ci.yml)). The full
distribution already includes rackunit; with the minimal one, also install
`rackunit-lib`.

```bash
raco pkg install --auto --skip-installed fmt review

raco test solutions/easy/two-sum   # one problem
raco test solutions                # everything
```

## Conventions

- Racket only: `#lang racket/base` with explicit `require`s.
- The entry function keeps the exact name and contract of LeetCode's Racket
  template, so a solution can be pasted into the editor.
- Every problem ships a `test.rkt`; a solution without tests isn't done.
- `raco review` with zero warnings and `raco fmt` with no diff.
- Conventional Commits in English, one problem per pull request.

The full rules are in [CONTRIBUTING.md](CONTRIBUTING.md).

## Milestones

Annotated git tags mark progress: `solved-100`, `solved-250`, `solved-500`,
`solved-1000`, and so on, plus `easy-complete`, `medium-complete` and
`hard-complete` when a whole difficulty is cleared.

## Scope and legal

The scope is every free (non-premium) problem that accepts Racket. Problems
that don't accept Racket, and premium problems, are out of scope for now.

Problem statements belong to LeetCode. This repository links to each problem
and summarizes it in its own words; it doesn't copy statements or the site's
test data. It is not affiliated with LeetCode.

## Contributing

This is a personal showcase, so the solutions are the maintainer's own.
Corrections are welcome — a wrong answer, a missing test case, a typo — see
[CONTRIBUTING.md](CONTRIBUTING.md). Alternative solutions from third parties
aren't accepted.

## License

MIT — see [LICENSE](LICENSE).
