;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.26.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Oct 1st, 2013
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   One dimentional table
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-tree entry left right)
  (list entry left right))
;Value: make-tree

(define (entry tree) (car tree))
;Value: entry

(define (left-branch tree) (cadr tree))
;Value: left-branch

(define (right-branch tree) (caddr tree))
;Value: right-branch

(define (make-record key value)
  (cons key value))
;Value: make-record

(define (key record) (car record))
;Value: key

(define (value record) (cdr record))
;Value: value

(define (assoc given-key tree)
  (cond ((null? tree) false)
	((= given-key (key (entry tree)))
	 (entry tree))
	((< given-key (key (entry tree)))
	 (assoc given-key (left-branch tree)))
	(else
	 (assoc given-key (right-branch tree)))))
;Value: assoc

(define (lookup key table)
  (let ((record (assoc key (cdr table))))
    (if record
	(cdr record)
	false)))
;Value: lookup

(define (adjoin-tree record tree)
  (if (null? tree)
      (make-tree record '() '())
      (let ((given-key (key record))
	    (entry-key (key (entry tree))))
	(cond ((= given-key entry-key)
	       (make-tree record
			  (left-branch tree)
			  (right-branch tree)))
	      ((< given-key entry-key)
	       (make-tree (entry tree)
			  (adjoin-tree record (left-branch tree))
			  (right-branch tree)))
	      (else
	       (make-tree (entry tree)
			  (left-branch tree)
			  (adjoin-tree record (right-branch tree))))))))
;Value: adjoin-tree

(define (insert! key value table)
  (let ((record (make-record key value)))
    (set-cdr! table
	      (adjoin-tree record (cdr table))))
  'ok)
;Value: insert!

(define (make-table)
  (list '*table*))
;Value: make-table

(define T1 (make-table))
;Value: t1

(lookup 050 T1)
;Value: #f

(lookup 024 T1)
;Value: #f

(lookup 006 T1)
;Value: #f

(lookup 048 T1)
;Value: #f

(lookup 188 T1)
;Value: #f

(lookup 098 T1)
;Value: #f

(insert! 050 'Rogers T1)
;Value: ok

(display T1)
(*table* (50 . rogers) () ())
;Unspecified return value

(insert! 024 'McCarthy T1)
;Value: ok

(display T1)
(*table* (50 . rogers) ((24 . mccarthy) () ()) ())
;Unspecified return value

(insert! 006 'Jerison T1)
;Value: ok

(display T1)
(*table* (50 . rogers) ((24 . mccarthy) ((6 . jerison) () ()) ()) ())
;Unspecified return value

(insert! 048 'Abel T1)
;Value: ok

(display T1)
(*table* (50 . rogers) ((24 . mccarthy) ((6 . jerison) () ()) ((48 . abel) () ())) ())
;Unspecified return value

(insert! 188 'Lempson T1)
;Value: ok

(display T1)
(*table* (50 . rogers) ((24 . mccarthy) ((6 . jerison) () ()) ((48 . abel) () ())) ((188 . lempson) () ()))
;Unspecified return value

(insert! 098 'Cormen T1)
;Value: ok

(display T1)
(*table* (50 . rogers) ((24 . mccarthy) ((6 . jerison) () ()) ((48 . abel) () ())) ((188 . lempson) ((98 . cormen) () ()) ()))
;Unspecified return value

(lookup 050 T1)
;Value: rogers

(lookup 024 T1)
;Value: mccarthy

(lookup 006 T1)
;Value: jerison

(lookup 048 T1)
;Value: abel

(lookup 188 T1)
;Value: lempson

(lookup 098 T1)
;Value: cormen

(insert! 006 'Strang T1)
;Value: ok

(display T1)
(*table* (50 . rogers) ((24 . mccarthy) ((6 . strang) () ()) ((48 . abel) () ())) ((188 . lempson) ((98 . cormen) () ()) ()))
;Unspecified return value



(define (make-table)
  (let ((local-table (list '*table*)))
    (define (assoc given-key tree)
      (cond ((null? tree) false)
	    ((= given-key (key (entry tree)))
	     (entry tree))
	    ((< given-key (key (entry tree)))
	     (assoc given-key (left-branch tree)))
	    (else
	     (assoc given-key (right-branch tree)))))
    (define (lookup key)
      (let ((record (assoc key (cdr local-table))))
	(if record
	    (cdr record)
	    false)))
    (define (adjoin-tree record tree)
      (if (null? tree)
	  (make-tree record '() '())
	  (let ((given-key (key record))
		(entry-key (key (entry tree))))
	    (cond ((= given-key entry-key)
		   (make-tree record
			      (left-branch tree)
			      (right-branch tree)))
		  ((< given-key entry-key)
		   (make-tree (entry tree)
			      (adjoin-tree record (left-branch tree))
			      (right-branch tree)))
		  (else
		   (make-tree (entry tree)
			      (left-branch tree)
			      (adjoin-tree record (right-branch tree))))))))
    (define (insert! key value)
      (let ((record (make-record key value)))
	(set-cdr! local-table
		  (adjoin-tree record (cdr local-table))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
	    ((eq? m 'insert-proc!) insert!)
	    (else
	     (error "Unknown operation -- TABLE" m))))
    dispatch))
;Value: make-table

(define T2 (make-table))
;Value: t2

(define get-2 (T2 'lookup-proc))
;Value: get-2

(define put-2 (T2 'insert-proc!))
;Value: put-2

(get-2 050)
;Value: #f

(get-2 024)
;Value: #f

(get-2 006)
;Value: #f

(get-2 048)
;Value: #f

(get-2 188)
;Value: #f

(get-2 098)
;Value: #f

(put-2 050 'Rogers)
;Value: ok

(put-2 024 'McCarthy)
;Value: ok

(put-2 006 'Jerison)
;Value: ok

(put-2 048 'Abel)
;Value: ok

(put-2 188 'Lempson)
;Value: ok

(put-2 098 'Cormen)
;Value: ok

(get-2 050)
;Value: rogers

(get-2 024)
;Value: mccarthy

(get-2 006)
;Value: jerison

(get-2 048)
;Value: abel

(get-2 188)
;Value: lempson

(get-2 098)
;Value: cormen

(put-2 006 'Matturk)
;Value: ok

(get-2 006)
;Value: matturk

