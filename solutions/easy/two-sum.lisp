;;;; Two Sum
;;;; https://leetcode.com/problems/two-sum/
;;;; Difficulty: 🟢 easy
;;;; Topics: array, hash-table
;;;; Approaches: hash-map, brute-force

(defpackage #:leetcode.two-sum
  (:use #:cl)
  (:export #:no-solution
           #:two-sum
           #:two-sum-brute-force))

(in-package #:leetcode.two-sum)

(define-condition no-solution (error)
  ()
  (:report "no pair of numbers adds up to the target")
  (:documentation "Signaled when no two numbers add up to the target."))

(defun two-sum (nums target)
  "Return the indices of the two numbers in NUMS that add up to TARGET.

- NUMS: a list of integers to search.
- TARGET: the sum to reach.

Returns a list of the two indices in ascending order. Signals NO-SOLUTION when
no pair adds up to TARGET.

Hash-map approach: one pass, remembering the index of each number seen."
  (check-type nums list)
  (check-type target integer)
  (let ((indices-by-number (make-hash-table)))
    (loop for number in nums
          for index from 0
          do (let ((complement-index
                     (gethash (- target number) indices-by-number)))
               (when complement-index
                 (return-from two-sum (list complement-index index)))
               (setf (gethash number indices-by-number) index)))
    (error 'no-solution)))

(defun two-sum-brute-force (nums target)
  "Return the indices of the two numbers in NUMS that add up to TARGET.

- NUMS: a list of integers to search.
- TARGET: the sum to reach.

Returns a list of the two indices in ascending order. Signals NO-SOLUTION when
no pair adds up to TARGET.

Brute-force approach: try every pair of positions."
  (check-type nums list)
  (check-type target integer)
  (let* ((numbers (coerce nums 'vector))
         (size (length numbers)))
    (dotimes (first-index size)
      (loop for second-index from (1+ first-index) below size
            when (= target (+ (aref numbers first-index)
                              (aref numbers second-index)))
              do (return-from two-sum-brute-force
                   (list first-index second-index))))
    (error 'no-solution)))

;;; Examples, to evaluate by hand at the REPL:
;;;
;;; (two-sum '(2 7 11 15) 9) ;; => (0 1)
;;; (two-sum '(3 2 4) 6) ;; => (1 2)
;;; (two-sum '(3 3) 6) ;; => (0 1)
;;; (two-sum '(-1 -2 -3 -4 -5) -8) ;; => (2 4)
;;; (two-sum-brute-force '(3 2 4) 6) ;; => (1 2)
;;; (two-sum '(1 2) 99) ;; => signals NO-SOLUTION
