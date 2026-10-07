#lang racket/base

;; LeetCode 1, Two Sum.
;;
;; Given a list of integers and a target, return the indices of the two
;; numbers that add up to the target. Exactly one solution exists.

(require racket/contract/base
         racket/contract/region)

(provide two-sum
         two-sum-brute-force)

(define no-solution-message "no pair of numbers adds up to the target")

;; Hash-map approach: one pass, remembering the index of each number seen.
;;
;; - nums: the numbers to search.
;; - target: the sum to reach.
;;
;; Returns the two indices in ascending order.
;;
;; Time: O(n). Space: O(n).
(define/contract (two-sum nums target)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  (let loop ([remaining nums]
             [index 0]
             [indices-by-number (hash)])
    (cond
      [(null? remaining) (error 'two-sum no-solution-message)]
      [else
       (define number (car remaining))
       (define complement-index (hash-ref indices-by-number (- target number) #f))
       (if complement-index
           (list complement-index index)
           (loop (cdr remaining) (add1 index) (hash-set indices-by-number number index)))])))

;; Brute-force approach: try every pair of positions.
;;
;; - nums: the numbers to search.
;; - target: the sum to reach.
;;
;; Returns the two indices in ascending order.
;;
;; Time: O(n^2). Space: O(n) for the vector copy.
(define/contract (two-sum-brute-force nums target)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  (define numbers (list->vector nums))
  (define size (vector-length numbers))
  (or (for*/first ([first-index (in-range size)]
                   [second-index (in-range (add1 first-index) size)]
                   #:when
                   (= target (+ (vector-ref numbers first-index) (vector-ref numbers second-index))))
        (list first-index second-index))
      (error 'two-sum-brute-force no-solution-message)))
