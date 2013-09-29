;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       3.3.3_Representing_Tables
;;                       originated from SICP
;;                       edited by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 29th, 2013
;;                       Xi'an, China

;; Copyright (C) 1984-2013 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

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

(define (lookup key table)
  (let ((record (assoc key (cdr table))))
    (if record
	(cdr record)
	false)))
;Value: lookup

(define (assoc key records)
  (cond ((null? records) false)
	((equal? key (caar records)) (car records))
	(else (assoc key (cdr records)))))
;Value: assoc

(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
	(set-cdr! record value)
	(set-cdr! table
		  (cons (cons key value) (cdr table)))))
  'ok)
;Value: insert!

(define (make-table)
  (list '*table*))
;Value: make-table

(define T1 (make-table))
;Value: t1

(lookup 'a T1)
;Value: #f

(lookup 'b T1)
;Value: #f

(lookup 'c T1)
;Value: #f

(insert! 'a 1 T1)
;Value: ok

(insert! 'b 2 T1)
;Value: ok

(insert! 'c 3 T1)
;Value: ok

(lookup 'a T1)
;Value: 1

(lookup 'b T1)
;Value: 2

(lookup 'c T1)
;Value: 3



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Two-dimentional tables
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (lookup key-1 key-2 table)
  (let ((subtable (assoc key-1 (cdr table))))
    (if subtable
	(let ((record (assoc key-2 (cdr subtable))))
	  (if record
	      (cdr record)
	      false))
	false)))
;Value: lookup

(define (insert! key-1 key-2 value table)
  (let ((subtable (assoc key-1 (cdr table))))
    (if subtable
	(let ((record (assoc key-2 (cdr subtable))))
	  (if record
	      (set-cdr! record value)
	      (set-cdr! subtable
			(cons (cons key-2 value)
			      (cdr subtable)))))
	(set-cdr! table
		  (cons (list key-1
			      (cons key-2 value))
			(cdr table)))))
  'ok)
;Value: insert!

(define T2 (make-table))
;Value: t2

(lookup 'math '+ T2)
;Value: #f

(lookup 'math '- T2)
;Value: #f

(lookup 'math '* T2)
;Value: #f

(lookup 'letters 'a T2)
;Value: #f

(lookup 'letters 'b T2)
;Value: #f

(insert! 'math '+ 43 T2)
;Value: ok

(insert! 'math '- 45 T2)
;Value: ok

(insert! 'math '* 42 T2)
;Value: ok

(insert! 'letters 'a 97 T2)
;Value: ok

(insert! 'letters 'b 98 T2)
;Value: ok

(lookup 'math '+ T2)
;Value: 43

(lookup 'math '- T2)
;Value: 45

(lookup 'math '* T2)
;Value: 42

(lookup 'letters 'a T2)
;Value: 97

(lookup 'letters 'b T2)
;Value: 98



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Creating local tables
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
	(if subtable
	    (let ((record (assoc key-2 (cdr subtable))))
	      (if record
		  (cdr record)
		  false))
	    false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
	(if subtable
	    (let ((record (assoc key-2 (cdr subtable))))
	      (if record
		  (set-cdr! record value)
		  (set-cdr! subtable
			    (cons (cons key-2 value)
				  (cdr subtable)))))
	    (set-cdr! local-table
		      (cons (list key-1
				  (cons key-2 value))
			    (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
	    ((eq? m 'insert-proc!) insert!)
	    (else
	     (error "Unknown operation -- TABLE" m))))
    dispatch))
;Value: make-table

(define operation-table (make-table))
;Value: operation-table

(define get (operation-table 'lookup-proc))
;Value: get

(define put (operation-table 'insert-proc!))
;Value: put

(get 'math '+)
;Value: #f

(get 'math '-)
;Value: #f

(get 'math '*)
;Value: #f

(get 'letters 'a)
;Value: #f

(get 'letters 'b)
;Value: #f

(put 'math '+ 43)
;Unspecified return value

(put 'math '- 45)
;Unspecified return value

(put 'math '* 42)
;Unspecified return value

(put 'letters 'a 97)
;Unspecified return value

(put 'letters 'b 98)
;Unspecified return value

(get 'math '+)
;Value: 43

(get 'math '-)
;Value: 45

(get 'math '*)
;Value: 42

(get 'letters 'a)
;Value: 97

(get 'letters 'b)
;Value: 98
