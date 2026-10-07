[English](README.md) | [Português](README.pt-br.md) | [Русский](README.ru-ru.md)

# LeetCode in Parens

![CI](https://github.com/AF2B/leetcode-in-parens/actions/workflows/ci.yml/badge.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Racket](https://img.shields.io/badge/Racket-CS-9f1d20.svg)

Todo problema gratuito do LeetCode que aceita Racket, resolvido entre
parênteses. Cada solução é Racket idiomático, testada com rackunit, e muitas
vezes resolvida por mais de um ângulo — força bruta, otimizado, recursivo —
lado a lado no mesmo arquivo. Build, lint, formatação e testes rodam em toda
pull request.

## Progresso

<!-- progress:start -->
| Dificuldade | Resolvidos |
|---|---|
| 🟢 Easy (fácil) | 1 |
| 🟡 Medium (média) | 0 |
| 🔴 Hard (difícil) | 0 |
<!-- progress:end -->

O índice completo, por número, dificuldade e tópico, fica em
[PROBLEMS.md](PROBLEMS.md).

## Por que várias abordagens por problema

Resolver um problema uma vez prova que você encontrou uma resposta.
Resolvê-lo de novo como uma linha de base de força bruta, de novo na versão
otimizada, de novo de forma recursiva (ou por qualquer outro ângulo possível)
prova que você entende *por que* a resposta funciona — e deixa uma referência
de como a mesma ideia se comporta sob restrições diferentes. Não é uma
exigência para todo problema, mas a estrutura já está pronta para isso sempre
que valer a pena.

## Estrutura do repositório

```
solutions/
  easy/
    two-sum/
      README.md        # resumo do enunciado com minhas palavras, link
      meta.rktd        # id, slug, título, dificuldade, tópicos, abordagens
      solution.rkt     # todas as abordagens; a primeira é a canônica
      test.rkt         # testes rackunit
  medium/
  hard/
```

Os problemas ficam direto dentro da pasta de dificuldade que o LeetCode lhes
dá, nomeados pelo slug do próprio LeetCode (o que aparece na URL do
problema). O slug é a chave única do problema; o número do problema fica no
`meta.rktd` e no título do README. Um problema é uma pasta com exatamente
quatro arquivos, nunca uma pasta por abordagem: cada abordagem é outra
função no mesmo `solution.rkt`, coberta pelo mesmo `test.rkt`.

A interface web do GitHub trunca pastas com mais de 1.000 entradas, e
`medium/` vai passar disso. Use o [PROBLEMS.md](PROBLEMS.md) ou aperte `t` na
página do repositório para achar um problema.

## Rodando localmente

Requisitos: Racket CS (a versão fixada em
[`.github/workflows/ci.yml`](.github/workflows/ci.yml)). A distribuição
completa já inclui o rackunit; na mínima, instale também `rackunit-lib`.

```bash
raco pkg install --auto --skip-installed fmt review

raco test solutions/easy/two-sum   # um problema
raco test solutions                # tudo
```

## Convenções

- Só Racket: `#lang racket/base` com `require` explícito.
- A função de entrada mantém o nome e o contrato exatos do template de Racket
  do LeetCode, para a solução poder ser colada no editor.
- Todo problema vem com `test.rkt`; solução sem teste não está concluída.
- `raco review` com zero warnings e `raco fmt` sem diff.
- Conventional Commits em inglês, um problema por pull request.

As regras completas estão em [CONTRIBUTING.md](CONTRIBUTING.md).

## Marcos

Tags git anotadas marcam o progresso: `solved-100`, `solved-250`,
`solved-500`, `solved-1000` e assim por diante, além de `easy-complete`,
`medium-complete` e `hard-complete` quando uma dificuldade inteira é zerada.

## Escopo e aspectos legais

O escopo é todo problema gratuito (não premium) que aceita Racket. Problemas
que não aceitam Racket, e problemas premium, ficam fora do escopo por
enquanto.

Os enunciados pertencem ao LeetCode. Este repositório aponta para cada
problema e o resume com palavras próprias; não copia enunciados nem os dados
de teste do site. Não é afiliado ao LeetCode.

## Como contribuir

Este é um showcase pessoal, então as soluções são do próprio mantenedor.
Correções são bem-vindas — uma resposta errada, um caso de teste faltando,
um typo — veja [CONTRIBUTING.md](CONTRIBUTING.md). Soluções alternativas de
terceiros não são aceitas.

## Licença

MIT — veja [LICENSE](LICENSE).
