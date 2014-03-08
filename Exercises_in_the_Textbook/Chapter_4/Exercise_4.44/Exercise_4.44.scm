;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.44.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Mar 8th, 2014
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

(load "~/Documents/CSAIL/SICP_Journey/Exercises_in_the_Textbook/Chapter_4/Exercise_4.44/ch4-ambeval.scm")
;Loading "Documents/CSAIL/SICP_Journey/Exercises_in_the_Textbook/Chapter_4/Exercise_4.44/ch4-ambeval.scm"...
;  Loading "Documents/CSAIL/SICP_Journey/Exercises_in_the_Textbook/Chapter_4/Exercise_4.44/ch4-mceval.scm"... done
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
(define (make-pos col row)
  (list col row))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (col pos)
  (car pos))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (row pos)
  (car (cdr pos)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (eight-queens-puzzle)
  (let ((col (amb 1 2 3 4 5 6 7 8))
	(row (amb 1 2 3 4 5 6 7 8)))
    (let ((q1 (make-pos col row))
	  (q2 (make-pos col row))
	  (q3 (make-pos col row))
	  (q4 (make-pos col row))
	  (q5 (make-pos col row))
	  (q6 (make-pos col row))
	  (q7 (make-pos col row))
	  (q8 (make-pos col row)))
      (let ((queens (list q1 q2 q3 q4 q5 q6 q7 q8)))
	(require (safe? q1 (eliminate-queen q1 queens)))
	(require (safe? q2 (eliminate-queen q2 queens)))
	(require (safe? q3 (eliminate-queen q3 queens)))
	(require (safe? q4 (eliminate-queen q4 queens)))
	(require (safe? q5 (eliminate-queen q5 queens)))
	(require (safe? q6 (eliminate-queen q6 queens)))
	(require (safe? q7 (eliminate-queen q7 queens)))
	(require (safe? q8 (eliminate-queen q8 queens)))
	(require (distinct? queens))
	queens))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (safe? queen rest-queens)
  (cond ((null? rest-queens) true)
	((threatens? queen (car rest-queens)) false)
	(else (safe? queen (cdr rest-queens)))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (threatens? q1 q2)
  (or (= (row q1) (row q2))
      (= (col q1) (col q2))
      (= (abs (- (col q1) (col q2)))
	 (abs (- (row q1) (row q2))))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (eliminate-queen q qs)
  (cond ((null? qs) '())
	((equal? q (car qs))
	 (eliminate-queen q (cdr qs)))
	(else (cons (car queens)
		    (eliminate-queen q (cdr qs))))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(eight-queens-puzzle)
