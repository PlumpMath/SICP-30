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

(define (make-table)
  (let ((local-table (list '*table*)))

    ;; representation of tree
    (define (make-tree entry left right)
      (list entry left right))
    (define (entry tree) (car tree))
    (define (left-branch tree) (cadr tree))
    (define (right-branch tree) (caddr tree))
    
    ;; representation of record
    (define (make-record key value)
      (cons key value))
    (define (key record) (car record))
    (define (value record) (cdr record))

    (define (assoc given-key tree)
      (if (null? tree)
	  false
	  (let ((entry-key (key (entry tree))))
	    (cond ((= given-key entry-key)
		   (entry tree))
		  ((< given-key entry-key)
		   (assoc given-key (left-branch tree)))
		  (else
		   (assoc given-key (right-branch tree)))))))
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





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Two dimentional table
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-table)
  (let ((local-table (list '*table*)))

    ;; representation of tree
    (define (make-tree entry left right)
      (list entry left right))
    (define (entry tree) (car tree))
    (define (left-branch tree) (cadr tree))
    (define (right-branch tree) (caddr tree))

    ;; representation of record
    (define (make-record key-1 key-2 value)
      (cons key-1
	    (cons key-2 value)))
    (define (key record) (car record))
    (define (value record) (cdr record))

    (define (assoc given-key tree)
      (if (null? tree)
	  false
	  (let ((entry-key (key (entry tree))))
	    (cond ((= given-key entry-key)
		   (entry tree))
		  ((< given-key entry-key)
		   (assoc given-key (left-branch tree)))
		  (else
		   (assoc given-key (right-branch tree)))))))
    (define (lookup given-key-1 given-key-2)
      (let ((subtable (assoc given-key-1 (cdr local-table))))
	(if subtable
	    (let ((record (assoc given-key-2 (cdr subtable))))
	      (if record
		  (cdr record)
		  false))
	    false)))
    (define (insert! given-key-1 given-key-2 given-value)
      (let ((record (make-record given-key-1 given-key-2 given-value)))
	(set-cdr! local-table
		  (adjoin-tree-2D record (cdr local-table))))
      'ok)
    (define (adjoin-tree-2D 2D-record 2D-tree)
      (let ((first-given-key (key 2D-record))
	    (1D-record (value 2D-record)))
	(if (null? 2D-tree)
	    (make-tree (cons first-given-key
			     (make-tree 1D-record '() '()))
		       '()
		       '())
	    (let ((first-entry-key (key (entry 2D-tree))))
	      (cond ((= first-given-key first-entry-key)
		     (make-tree (cons first-entry-key
				      (adjoin-tree-1D 1D-record (cdr (entry 2D-tree))))
				(left-branch 2D-tree)
				(right-branch 2D-tree)))
		    ((< first-given-key first-entry-key)
		     (make-tree (entry 2D-tree)
				(adjoin-tree-2D 2D-record (left-branch 2D-tree))
				(right-branch 2D-tree)))
		    (else
		     (make-tree (entry 2D-tree)
				(left-branch 2D-tree)
				(adjoin-tree-2D 2D-record (right-branch 2D-tree)))))))))
    (define (adjoin-tree-1D record tree)
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
			      (adjoin-tree-1D record (left-branch tree))
			      (right-branch tree)))
		  (else
		   (make-tree (entry tree)
			      (left-branch tree)
			      (adjoin-tree-1D record (right-branch tree))))))))

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
	    ((eq? m 'insert-proc!) insert!)
	    (else
	     (error "Unknown operation -- TABLE" m))))
    dispatch))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Multi-dimentional table
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-table)
  (let ((local-table (list '*table*)))

    ;; The representation of tree
    (define (make-tree entry left right)
      (list entry left right))
    (define (entry tree) (car tree))
    (define (left-branch tree) (cadr tree))
    (define (right-branch tree) (caddr tree))

    ;; The representation of record
    (define (make-record keys value)
      (if (null? (cdr keys))
	  (cons (car keys) value)
	  (cons (car keys)
		(make-record (cdr keys) value))))
    (define (key record) (car record))
    (define (value record) (cdr record))

    (define (assoc given-key tree)
      (if (null? tree)
	  false
	  (let ((entry-key (key (entry tree))))
	    (cond ((= given-key entry-key)
		   (entry tree))
		  ((< given-key entry-key)
		   (assoc given-key (left-branch tree)))
		  (else
		   (assoc given-key (right-branch tree)))))))
    (define (lookup keys)
      (define (lookup-simplifer keys table)
	(if (null? (cdr keys))
	  (let ((record (assoc (car keys) (cdr table))))
	    (if record
		(cdr record)
		false))
	  (let ((subtable (assoc (car keys) (cdr table))))
	    (if subtable
		(lookup-simplifer (cdr keys) subtable)
		false))))
      (lookup-simplifer keys local-table))
    (define (insert! keys given-value)
      (let ((MD-record (make-record keys given-value)))
	(set-cdr! local-table
		  (adjoin-tree-MD MD-record (cdr local-table))))
      'ok)
    (define (adjoin-tree-MD MD-record MD-tree)
      (if (not (pair? (value MD-record)))
	  (adjoin-tree-1D MD-record MD-tree)
	  (let ((first-given-key (key MD-record))
		(subrecord (value MD-record)))
	    (if (null? MD-tree)
		(make-tree (cons first-given-key
				 (adjoin-tree-MD subrecord '()))
			   '()
			   '())
		(let ((first-entry-key (key (entry MD-tree))))
		  (cond ((= first-given-key first-entry-key)
			 (make-tree (cons first-entry-key
					  (adjoin-tree-MD subrecord (cdr (entry MD-tree))))
				    (left-branch MD-tree)
				    (right-branch MD-tree)))
			((< first-given-key first-entry-key)
			 (make-tree (entry MD-tree)
				    (adjoin-tree-MD MD-record (left-branch MD-tree))
				    (right-branch MD-tree)))
			(else
			 (make-tree (entry MD-tree)
				    (left-branch MD-tree)
				    (adjoin-tree-MD MD-record (right-branch MD-tree))))))))))
    (define (adjoin-tree-1D record tree)
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
			      (adjoin-tree-1D record (left-branch tree))
			      (right-branch tree)))
		  (else
		   (make-tree (entry tree)
			      (left-branch tree)
			      (adjoin-tree-1D record (right-branch tree))))))))
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
	    ((eq? m 'insert-proc!) insert!)
	    (else
	     (error "Unknown operation -- TABLE" m))))
    dispatch))

