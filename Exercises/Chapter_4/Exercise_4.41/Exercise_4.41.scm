;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.41.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Mar 4th, 2013
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

(define (baker sequence)
  (car sequence))
;Value: baker

(define (cooper sequence)
  (car (cdr sequence)))
;Value: cooper

(define (fletcher sequence)
  (car (cdr (cdr sequence))))
;Value: fletcher

(define (miller sequence)
  (car (cdr (cdr (cdr sequence)))))
;Value: miller

(define (smith sequence)
  (car (cdr (cdr (cdr (cdr sequence))))))
;Value: smith

(define (multiple-dwelling)
  (let ((floors (list 1 2 3 4 5)))
    (let ((init-assigns (permutations floors)))
      (let ((accept-assigns (filter legitimate? init-assigns)))
	(for-each (lambda (assignment) (print-assign assignment))
		  accept-assigns))))
  'ok)
;Value: multiple-dwelling

(define (legitimate? assignment)
  (and (not (= (baker assignment) 5))
       (not (= (cooper assignment) 1))
       (not (= (fletcher assignment) 5))
       (not (= (fletcher assignment) 1))
       (> (miller assignment) (cooper assignment))
       (not (= (abs (- (smith assignment) (fletcher assignment))) 1))
       (not (= (abs (- (fletcher assignment) (cooper assignment))) 1))))
;Value: legitimate?

(define (permutations s)
  (if (null? s)
      (list '())
      (flatmap (lambda (x)
		 (map (lambda (p) (cons x p))
		      (permutations (remove x s))))
	       s)))
;Value: permutations

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))
;Value: flatmap

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
	    (append (cdr list1) list2))))
;Value: append

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
	  sequence))
;Value: remove

(define (filter predicate sequence)
  (cond ((null? sequence) '())
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))
;Value: filter

(define (print-assign assignment)
  (display (list (list 'baker (baker assignment))
		 (list 'cooper (cooper assignment))
		 (list 'fletcher (fletcher assignment))
		 (list 'miller (miller assignment))
		 (list 'smith (smith assignment)))))
;Value: print-assign

(multiple-dwelling)
((baker 3) (cooper 2) (fletcher 4) (miller 5) (smith 1))
;Value: ok

