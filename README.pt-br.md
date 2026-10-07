[English](README.md) | [Português](README.pt-br.md) | [Русский](README.ru-ru.md)

# LeetCode in Parens

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Common Lisp](https://img.shields.io/badge/Common%20Lisp-SBCL-3d6aa6.svg)

Todo problema gratuito do LeetCode da categoria Algorithms, resolvido em
Common Lisp. Um arquivo por problema, muitas vezes com mais de uma abordagem —
força bruta, otimizado, recursivo — lado a lado no mesmo arquivo.

## Progresso

| Dificuldade | Resolvidos |
|---|---|
| 🟢 Easy (fácil) | 1 |
| 🟡 Medium (média) | 0 |
| 🔴 Hard (difícil) | 0 |

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
    two-sum.lisp
  medium/
  hard/
```

Um problema é um único arquivo `.lisp`, nomeado pelo slug do próprio LeetCode
(o que aparece na URL do problema) e colocado direto dentro da pasta de
dificuldade que o LeetCode lhe dá. O número do problema não está no caminho; o
slug é a chave única. Cada arquivo contém:

- um comentário de cabeçalho com link, dificuldade, tópicos e abordagens;
- seu próprio pacote, `leetcode.<slug>`, com lista de exports explícita;
- uma função por abordagem: a que leva o nome do problema é a abordagem
  canônica, as outras recebem um sufixo, como `two-sum-brute-force`;
- os exemplos do enunciado no fim, como comentários com os resultados
  esperados.

A interface web do GitHub trunca pastas com mais de 1.000 entradas, e
`medium/` vai passar disso. Use o [PROBLEMS.md](PROBLEMS.md) ou aperte `t` na
página do repositório para achar um problema.

## Rodando localmente

Requisitos: [SBCL](https://www.sbcl.org).

```bash
sbcl --load solutions/easy/two-sum.lisp
```

```lisp
(leetcode.two-sum:two-sum '(2 7 11 15) 9)
;; => (0 1)
```

## Como as soluções são verificadas

Não há CI nem suíte de testes. Antes de uma solução subir, o autor a carrega no
SBCL e avalia à mão, no REPL, os exemplos que ficam no fim do arquivo. Estas
soluções não são julgadas pelo LeetCode, então nada mais as confere: uma issue
sobre uma resposta errada é bem-vinda.

## Convenções

- Common Lisp, desenvolvido com SBCL.
- Um pacote por arquivo com `:export` explícito; nomes em `kebab-case`.
- Toda função exportada tem docstring com uma linha por parâmetro.
- Falhas esperadas são tipos de condição (`no-solution`), não erros genéricos.
- Conventional Commits em inglês, direto na `main`.

As regras completas estão em [CONTRIBUTING.md](CONTRIBUTING.md).

## Marcos

Tags git anotadas marcam o progresso: `solved-100`, `solved-250`,
`solved-500`, `solved-1000` e assim por diante, além de `easy-complete`,
`medium-complete` e `hard-complete` quando uma dificuldade inteira é zerada.

## Escopo e aspectos legais

O escopo é todo problema gratuito (não premium) da categoria Algorithms do
LeetCode. Problemas de SQL, Bash, Pandas e JavaScript 30-day ficam fora.

Os enunciados pertencem ao LeetCode. Este repositório aponta para cada problema
e não copia enunciados nem os dados de teste do site. Não é afiliado ao
LeetCode.

## Como contribuir

Este é um showcase pessoal, então as soluções são do próprio mantenedor.
Correções são bem-vindas — uma resposta errada, um typo — por issue ou pull
request, veja [CONTRIBUTING.md](CONTRIBUTING.md). Soluções alternativas de
terceiros não são aceitas.

## Licença

MIT — veja [LICENSE](LICENSE).
