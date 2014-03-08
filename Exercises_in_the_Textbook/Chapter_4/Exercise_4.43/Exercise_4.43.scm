;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.43.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Mar 6th, 2014
;;                       Xi'an, China

;; Copyright (C) 2014 Lawrence X. Amlord(颜世敏, aka 颜序)
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

(load "/Users/Lawrence/Documents/CSAIL/SICP_Journey/Exercises_in_the_Textbook/Chapter_4/Exercise_4.43/ch4-ambeval.scm")

;Loading "ch4-ambeval.scm"...
;  Loading "ch4-mceval.scm"... done
;... done
;Value: amb-evaluator-loaded

(define the-global-environment (setup-environment))
;Value: the-global-environment

(driver-loop)


;;; Amb-Eval input:
(define (require p)
  (if (not p) (amb)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (distinct? items)
  (cond ((null? items) true)
	((null? (cdr items)) true)
	((member (car items) (cdr items)) false)
	(else (distinct? (cdr items)))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (make-family father daughter yacht)
  (list father daughter yacht))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (father family)
  (car family))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (daughter family)
  (car (cdr family)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (yacht family)
  (car (cdr (cdr family))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (family-matching)
  (let ((moore-family
	 (make-family 'moore
		      'mary
		      'lorna))
	(downing-family
	 (make-family 'downing
		      (amb 'gabrielle 'lorna 'rosalind)
		      'melissa))
	(hall-family
	 (make-family 'hall
		      (amb 'gabrielle 'lorna)
		      'rosalind))
	(barnacle-family
	 (make-family 'barnacle
		      'melissa
		      'gabrielle))
	(parker-family
	 (make-family 'parker
		      (amb 'lorna 'rosalind)
		      'mary)))
    (for-each (lambda (family)
		(if (eq? (daughter family) 'gabrielle)
		    (require (eq? (yacht family) (daughter parker-family)))))
	      (list downing-family hall-family))
;    (require
;     (eq? (yacht
;	   (car (filter (lambda (family)
;			  (eq? (daughter family) 'gabrielle))
;			(list downing-family hall-family))))
;	  (daughter parker-family)))
    (require
     (distinct? (list (daughter downing-family)
		      (daughter hall-family)
		      (daughter parker-family))))
    (list (list 'moore 'mary)
	  (list 'downing (daughter downing-family))
	  (list 'hall (daughter hall-family))
	  (list 'barnacle 'melissa)
	  (list 'parker (daughter parker-family)))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (filter predicate items)
  (cond ((null? items) '())
	((predicate (car items))
	 (cons (car items)
	       (filter predicate (cdr items))))
	(else (filter predicate (cdr items)))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(family-matching)
