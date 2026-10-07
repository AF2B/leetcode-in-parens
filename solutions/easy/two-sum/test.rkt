#lang racket/base

(require rackunit
         "solution.rkt")

(define approaches (list (cons 'two-sum two-sum) (cons 'two-sum-brute-force two-sum-brute-force)))

;; Each case is (label nums target expected).
(define cases
  (list (list "example 1" '(2 7 11 15) 9 '(0 1))
        (list "example 2" '(3 2 4) 6 '(1 2))
        (list "example 3" '(3 3) 6 '(0 1))
        (list "negative numbers" '(-1 -2 -3 -4 -5) -8 '(2 4))
        (list "zero target" '(0 4 3 0) 0 '(0 3))))

(for* ([approach (in-list approaches)]
       [case-data (in-list cases)])
  (define-values (label nums target expected) (apply values case-data))
  (check-equal? ((cdr approach) nums target) expected (format "~a: ~a" (car approach) label)))

(check-exn exn:fail:contract?
           (lambda () (two-sum 'not-a-list 1))
           "the LeetCode contract rejects non-list input")
