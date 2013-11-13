;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.29.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       May 30th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;
;;
;;  Subproblem a.
;;
;;;;;;;;;;;;;;;;;;;;

(define (make-mobile left right)
  (list left right))

(define (left-branch m)
  (car m))

(define (right-branch m)
  (car (cdr m)))

(define (make-branch length structure)
  (list length structure))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (car (cdr b)))



;;;;;;;;;;;;;;;;;;;;
;;
;;  Subproblem b.
;;
;;;;;;;;;;;;;;;;;;;;

(define (total-weight m)
  (cond ((null? m) 0)
	  ((not (pair? m)) m)
	  (else
	   (+ (total-weight (branch-structure (left-branch m)))
	      (total-weight (branch-structure (right-branch m)))))))



;; An alternative implementation

(define (total-weight m)
  (cond ((null? m) 0)
	((not (pair? m)) m)
	(else
	 (+ (branch-weight (left-branch m))
	    (branch-weight (right-branch m))))))

(define (branch-weight b)
  (if (not (pair? (branch-structure b)))
      (branch-structure b)
      (total-weight (branch-structure b))))



;;;;;;;;;;;;;;;;;;;;
;;
;;  Subproblem c.
;;
;;;;;;;;;;;;;;;;;;;;

(define (balanced? m)
  (and (= (torque (left-branch m))
	  (torque (right-branch m)))
       (branch-balanced? (left-branch m))
       (branch-balanced? (right-branch m))))

(define (torque b)
  (* (branch-length b)
     (branch-weight b)))

(define (branch-weight b)
  (if (not (pair? (branch-structure b)))
      (branch-structure b)
      (+ (branch-weight (left-branch (branch-structure b)))
	 (branch-weight (right-branch (branch-structure b))))))

(define (branch-balanced? b)
  (if (not (pair? (branch-structure b)))
      #t
      (balanced? (branch-structure b))))



;;;;;;;;;;;;;;;;;;;;
;;
;;  Subproblem d.
;;
;;;;;;;;;;;;;;;;;;;;

(define (make-mobile left right)
  (cons left right))

(define (make-branch left right)
  (cons left right))

(define (right-branch m)
  (cdr m))

(define (branch-structure b)
  (cdr b))