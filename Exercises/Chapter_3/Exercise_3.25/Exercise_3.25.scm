;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.25.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 30th, 2013
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

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup keys table)
      (cond ((null? keys) false)
	    ((null? table) false)
	    ((null? (cdr keys))
	     (let ((record (assoc (car keys) (cdr table))))
	       (if record
		   (cdr record)
		   false)))
	    (else
	     (let ((subtable (assoc (car keys) (cdr table))))
	       (if subtable
		   (lookup (cdr keys) subtable)
		   false)))))
    (define (insert! keys value table)
      (cond ((null? keys)
	     (error "INSERT! called with an empty list of keys" keys))
	    ((null? table)
	     (error "INSERT! called with an empty list of table" table))
	    ((null? (cdr keys))
	     (let ((record (assoc (car keys) (cdr table))))
	       (if record
		   (set-cdr! record value)
		   (set-cdr! table
			     (cons (cons (car keys) value)
				   (cdr table))))))
	    (else
	     (let ((subtable (assoc (car keys) (cdr table))))
	       (if subtable
		   (insert! (cdr keys) value subtable)
		   (let ((new-subtable (list (car keys))))
		     (set-cdr! table
			       (cons (insert! (cdr keys) value new-subtable)
				     (cdr table))))))))
      table)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc)
	     (lambda (keys) (lookup keys local-table)))
	    ((eq? m 'insert-proc!)
	     (lambda (keys value) (insert! keys value local-table)))
	    (else
	     (error "Unknown operation -- TABLE" m))))
    dispatch))
