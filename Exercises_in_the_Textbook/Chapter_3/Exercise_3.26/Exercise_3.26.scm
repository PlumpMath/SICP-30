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
  (if (null? tree)
      false
      (let ((entry-key (key (entry tree))))
	(cond ((= given-key entry-key)
	       (entry tree))
	      ((< given-key entry-key)
	       (assoc given-key (left-branch tree)))
	      (else
	       (assoc given-key (right-branch tree)))))))
;Value: assoc

(define (lookup given-key table)
  (let ((record (assoc given-key (cdr table))))
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

(define (insert! given-key given-value table)
  (let ((record (make-record given-key given-value)))
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



(insert! 050 'Reif T1)
;Value: ok

(display T1)
(*table* (50 . reif) ((24 . mccarthy) ((6 . jerison) () ()) ((48 . abel) () ())) ((188 . lempson) ((98 . cormen) () ()) ()))
;Unspecified return value

(insert! 188 'Lesserson T1)
;Value: ok

(display T1)
(*table* (50 . reif) ((24 . mccarthy) ((6 . jerison) () ()) ((48 . abel) () ())) ((188 . lesserson) ((98 . cormen) () ()) ()))
;Unspecified return value

(insert! 098 'Grimson T1)
;Value: ok

(display T1)
(*table* (50 . reif) ((24 . mccarthy) ((6 . jerison) () ()) ((48 . abel) () ())) ((188 . lesserson) ((98 . grimson) () ()) ()))
;Unspecified return value



(lookup 050 T1)
;Value: reif

(lookup 024 T1)
;Value: mccarthy

(lookup 006 T1)
;Value: jerison

(lookup 048 T1)
;Value: abel

(lookup 188 T1)
;Value: lesserson

(lookup 098 T1)
;Value: grimson



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
;Value: make-table

(define T2 (make-table))
;Value: t2

(define get-2 (T2 'lookup-proc))
;Value: get-2

(define put-2 (T2 'insert-proc!))
;Value: put-2

(get-2 1600)
;Value: #f

(get-2 901)
;Value: #f

(get-2 512)
;Value: #f

(get-2 1024)
;Value: #f

(get-2 2400)
;Value: #f

(get-2 5050)
;Value: #f



(put-2 1600 'Cai)
;Value: ok

(put-2 901 'Zhang)
;Value: ok

(put-2 512 'Qian)
;Value: ok

(put-2 1024 'Liu)
;Value: ok

(put-2 2400 'Sun)
;Value: ok

(put-2 5050 'Yan)
;Value: ok



(get-2 1600)
;Value: cai

(get-2 901)
;Value: zhang

(get-2 512)
;Value: qian

(get-2 1024)
;Value: liu

(get-2 2400)
;Value: sun

(get-2 5050)
;Value: yan



(put-2 2400 'Zhao)
;Value: ok

(put-2 512 'Yin)
;Value: ok

(put-2 1600 'Lin)
;Value: ok



(get-2 1600)
;Value: lin

(get-2 901)
;Value: zhang

(get-2 512)
;Value: yin

(get-2 1024)
;Value: liu

(get-2 2400)
;Value: zhao

(get-2 5050)
;Value: yan





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Two dimentional table
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

(define (make-record key-1 key-2 value)
  (cons key-1
	(cons key-2 value)))
;Value: make-record

(define (key record) (car record))
;Value: key

(define (value record) (cdr record))
;Value: value

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
;Value: assoc

(define (lookup given-key-1 given-key-2 table)
  (let ((subtable (assoc given-key-1 (cdr table))))
    (if subtable
	(let ((record (assoc given-key-2 (cdr subtable))))
	  (if record
	      (cdr record)
	      false))
	false)))
;Value: lookup

(define (insert! given-key-1 given-key-2 given-value table)
  (let ((record (make-record given-key-1 given-key-2 given-value)))
    (set-cdr! table
	      (adjoin-tree-2D record (cdr table))))
  'ok)
;Value: insert!

(define (adjoin-tree-2D 2D-record 2D-tree)
  (let ((first-given-key (key 2D-record))
	(1D-record (cdr 2D-record)))
    (if (null? 2D-tree)
	(make-tree (cons first-given-key
			 (make-tree 1D-record '() '()))
		   '()
		   '())
	(let ((first-entry-key (key (entry 2D-tree))))
	  (cond ((= first-given-key first-entry-key)
		 (make-tree (cons first-entry-key
				  (adjoin-tree 1D-record (cdr (entry 2D-tree))))
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
;Value: adjoin-tree-2d

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

(define (make-table)
  (list '*table*))
;Value: make-table



(define T4 (make-table))
;Value: t4

(define CN 86)
;Value: cn

(define US 1)
;Value: us

(define AE 971)
;Value: ae

(define DE 49)
;Value: de



(lookup CN 024 T4)
;Value: #f

(lookup CN 001 T4)
;Value: #f

(lookup CN 098 T4)
;Value: #f

(lookup US 051 T4)
;Value: #f

(lookup US 001 T4)
;Value: #f

(lookup US 101 T4)
;Value: #f

(lookup AE 120 T4)
;Value: #f

(lookup AE 016 T4)
;Value: #f

(lookup AE 178 T4)
;Value: #f

(lookup DE 086 T4)
;Value: #f

(lookup DE 001 T4)
;Value: #f

(lookup DE 020 T4)
;Value: #f

(lookup DE 198 T4)
;Value: #f



(insert! CN 024 'Liu T4)
;Value: ok

(display T4)
(*table* (86 (24 . liu) () ()) () ())
;Unspecified return value

(insert! CN 001 'Xi T4)
;Value: ok

(display T4)
(*table* (86 (24 . liu) ((1 . xi) () ()) ()) () ())
;Unspecified return value

(insert! CN 098 'Zhang T4)
;Value: ok

(display T4)
(*table* (86 (24 . liu) ((1 . xi) () ()) ((98 . zhang) () ())) () ())
;Unspecified return value

(insert! US 051 'Gates T4)
;Value: ok

(display T4)
(*table* (86 (24 . liu) ((1 . xi) () ()) ((98 . zhang) () ())) ((1 (51 . gates) () ()) () ()) ())
;Unspecified return value

(insert! US 001 'Obama T4)
;Value: ok

(display T4)
(*table* (86 (24 . liu) ((1 . xi) () ()) ((98 . zhang) () ())) ((1 (51 . gates) ((1 . obama) () ()) ()) () ()) ())
;Unspecified return value

(insert! US 101 'Friedman T4)
;Value: ok

(display T4)
(*table* (86 (24 . liu) ((1 . xi) () ()) ((98 . zhang) () ())) ((1 (51 . gates) ((1 . obama) () ()) ((101 . friedman) () ())) () ()) ())
;Unspecified return value

(insert! AE 120 'Mohamode T4)
;Value: ok

(display T4)
(*table* (86 (24 . liu) ((1 . xi) () ()) ((98 . zhang) () ())) ((1 (51 . gates) ((1 . obama) () ()) ((101 . friedman) () ())) () ()) ((971 (120 . mohamode) () ()) () ()))
;Unspecified return value

(insert! AE 016 'Jordan T4)
;Value: ok

(display T4)
(*table* (86 (24 . liu) ((1 . xi) () ()) ((98 . zhang) () ())) ((1 (51 . gates) ((1 . obama) () ()) ((101 . friedman) () ())) () ()) ((971 (120 . mohamode) ((16 . jordan) () ()) ()) () ()))
;Unspecified return value

(insert! AE 178 'Ivan T4)
;Value: ok

(display T4)
(*table* (86 (24 . liu) ((1 . xi) () ()) ((98 . zhang) () ())) ((1 (51 . gates) ((1 . obama) () ()) ((101 . friedman) () ())) () ()) ((971 (120 . mohamode) ((16 . jordan) () ()) ((278 . ivan) () ())) () ()))
;Unspecified return value

(insert! DE 086 'Simenz T4)
;Value: ok

(display T4)
(*table* (86 (24 . liu) ((1 . xi) () ()) ((98 . zhang) () ())) ((1 (51 . gates) ((1 . obama) () ()) ((101 . friedman) () ())) () ((49 (86 . simenz) () ()) () ())) ((971 (120 . mohamode) ((16 . jordan) () ()) ((278 . ivan) () ())) () ()))
;Unspecified return value

(insert! DE 001 'Hilbert T4)
;Value: ok

(display T4)
(*table* (86 (24 . liu) ((1 . xi) () ()) ((98 . zhang) () ())) ((1 (51 . gates) ((1 . obama) () ()) ((101 . friedman) () ())) () ((49 (86 . simenz) ((1 . hilbert) () ()) ()) () ())) ((971 (120 . mohamode) ((16 . jordan) () ()) ((278 . ivan) () ())) () ()))
;Unspecified return value

(insert! DE 020 'Godel T4)
;Value: ok

(display T4)
(*table* (86 (24 . liu) ((1 . xi) () ()) ((98 . zhang) () ())) ((1 (51 . gates) ((1 . obama) () ()) ((101 . friedman) () ())) () ((49 (86 . simenz) ((1 . hilbert) () ((20 . godel) () ())) ()) () ())) ((971 (120 . mohamode) ((16 . jordan) () ()) ((278 . ivan) () ())) () ()))
;Unspecified return value

(insert! DE 198 'Franz T4)
;Value: ok

(display T4)
(*table* (86 (24 . liu) ((1 . xi) () ()) ((98 . zhang) () ())) ((1 (51 . gates) ((1 . obama) () ()) ((101 . friedman) () ())) () ((49 (86 . simenz) ((1 . hilbert) () ((20 . godel) () ())) ((198 . franz) () ())) () ())) ((971 (120 . mohamode) ((16 . jordan) () ()) ((278 . ivan) () ())) () ()))
;Unspecified return value



(lookup CN 024 T4)
;Value: liu

(lookup CN 001 T4)
;Value: xi

(lookup CN 098 T4)
;Value: zhang

(lookup US 051 T4)
;Value: gates

(lookup US 001 T4)
;Value: obama

(lookup US 101 T4)
;Value: friedman

(lookup AE 120 T4)
;Value: mohamode

(lookup AE 016 T4)
;Value: jordan

(lookup AE 178 T4)
;Value: ivan

(lookup DE 086 T4)
;Value: simenz

(lookup DE 001 T4)
;Value: hilbert

(lookup DE 020 T4)
;Value: godel

(lookup DE 198 T4)
;Value: franz



(insert! CN '024 'Lee T4)
;Value: ok

(display T4)
(*table* (86 (24 . lee) ((1 . xi) () ()) ((98 . zhang) () ())) ((1 (51 . gates) ((1 . obama) () ()) ((101 . friedman) () ())) () ((49 (86 . simenz) ((1 . hilbert) () ((20 . godel) () ())) ((198 . franz) () ())) () ())) ((971 (120 . mohamode) ((16 . jordan) () ()) ((278 . ivan) () ())) () ()))
;Unspecified return value

(insert! US 051 'Jobs T4)
;Value: ok

(display T4)
(*table* (86 (24 . lee) ((1 . xi) () ()) ((98 . zhang) () ())) ((1 (51 . jobs) ((1 . obama) () ()) ((101 . friedman) () ())) () ((49 (86 . simenz) ((1 . hilbert) () ((20 . godel) () ())) ((198 . franz) () ())) () ())) ((971 (120 . mohamode) ((16 . jordan) () ()) ((278 . ivan) () ())) () ()))
;Unspecified return value

(insert! AE 178 'Ahman T4)
;Value: ok

(display T4)
(*table* (86 (24 . lee) ((1 . xi) () ()) ((98 . zhang) () ())) ((1 (51 . jobs) ((1 . obama) () ()) ((101 . friedman) () ())) () ((49 (86 . simenz) ((1 . hilbert) () ((20 . godel) () ())) ((198 . franz) () ())) () ())) ((971 (120 . mohamode) ((16 . jordan) () ()) ((278 . ivan) ((178 . ahman) () ()) ())) () ()))
;Unspecified return value



(lookup CN 024 T4)
;Value: lee

(lookup CN 001 T4)
;Value: xi

(lookup CN 098 T4)
;Value: zhang

(lookup US 051 T4)
;Value: jobs

(lookup US 001 T4)
;Value: obama

(lookup US 101 T4)
;Value: friedman

(lookup AE 120 T4)
;Value: mohamode

(lookup AE 016 T4)
;Value: jordan

(lookup AE 178 T4)
;Value: ahman

(lookup DE 086 T4)
;Value: simenz

(lookup DE 001 T4)
;Value: hilbert

(lookup DE 020 T4)
;Value: godel

(lookup DE 198 T4)
;Value: franz



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
	    (1D-record (cdr 2D-record)))
	(if (null? 2D-tree)
	    (make-tree (cons first-given-key
			     (make-tree 1D-record '() '()))
		       '()
		       '())
	    (let ((first-entry-key (key (entry 2D-tree))))
	      (cond ((= first-given-key first-entry-key)
		     (make-tree (cons first-entry-key
				      (adjoin-tree 1D-record (cdr (entry 2D-tree))))
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

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
	    ((eq? m 'insert-proc!) insert!)
	    (else
	     (error "Unknown operation -- TABLE" m))))
    dispatch))
;Value: make-table



(define T5 (make-table))
;Value: t5

(define get-5 (T5 'lookup-proc))
;Value: get-5

(define put-5 (T5 'insert-proc!))
;Value: put-5

(define GB 044)
;Value: gb

(define RU 007)
;Value: ru

(define ES 034)
;Value: es

(define JP 081)
;Value: jp

(define HK 852)
;Value: hk



(get-5 GB 024)
;Value: #f

(get-5 GB 005)
;Value: #f

(get-5 GB 117)
;Value: #f

(get-5 GB 76)
;Value: #f

(get-5 RU 061)
;Value: #f

(get-5 RU 012)
;Value: #f

(get-5 RU 248)
;Value: #f

(get-5 ES 062)
;Value: #f

(get-5 ES 006)
;Value: #f

(get-5 ES 138)
;Value: #f

(get-5 JP 058)
;Value: #f

(get-5 JP 003)
;Value: #f

(get-5 JP 108)
;Value: #f

(get-5 HK 036)
;Value: #f

(get-5 HK 009)
;Value: #f

(get-5 HK 148)
;Value: #f

(get-5 HK 086)
;Value: #f



(put-5 GB 024 'Shakespear)
;Value: ok

(put-5 GB 005 'Hamlet)
;Value: ok

(put-5 GB 117 'Montycu)
;Value: ok

(put-5 GB 76 'Jones)
;Value: ok

(put-5 RU 061 'Smirnov)
;Value: ok

(put-5 RU 012 'Ivanov)
;Value: ok

(put-5 RU 248 'Lebedev)
;Value: ok

(put-5 ES 062 'Apellido)
;Value: ok

(put-5 ES 006 'Nombre)
;Value: ok

(put-5 ES 138 'Izqierdo)
;Value: ok

(put-5 JP 058 'Aida)
;Value: ok

(put-5 JP 003 'Ezaki)
;Value: ok

(put-5 JP 108 'Kikuti)
;Value: ok

(put-5 HK 036 'Zen)
;Value: ok

(put-5 HK 009 'Wu)
;Value: ok

(put-5 HK 148 'Liang)
;Value: ok

(put-5 HK 086 'Chan)
;Value: ok



(get-5 GB 024)
;Value: shakespear

(get-5 GB 005)
;Value: hamlet

(get-5 GB 117)
;Value: montycu

(get-5 GB 76)
;Value: jones

(get-5 RU 061)
;Value: smirnov

(get-5 RU 012)
;Value: ivanov

(get-5 RU 248)
;Value: lebedev

(get-5 ES 062)
;Value: apellido

(get-5 ES 006)
;Value: nombre

(get-5 ES 138)
;Value: izqierdo

(get-5 JP 058)
;Value: aida

(get-5 JP 003)
;Value: ezaki

(get-5 JP 108)
;Value: kikuti

(get-5 HK 036)
;Value: zen

(get-5 HK 009)
;Value: wu

(get-5 HK 148)
;Value: liang

(get-5 HK 086)
;Value: chan



(put-5 HK 148 'Shi)
;Value: ok

(put-5 JP 108 'Morris)
;Value: ok

(put-5 ES 138 'Munoz)
;Value: ok

(put-5 RU 061 'Kuzinetsov)
;Value: ok

(put-5 GB 076 'Wentshall)
;Value: ok



(get-5 GB 024)
;Value: shakespear

(get-5 GB 005)
;Value: hamlet

(get-5 GB 117)
;Value: montycu

(get-5 GB 76)
;Value: wentshall

(get-5 RU 061)
;Value: kuzinetsov

(get-5 RU 012)
;Value: ivanov

(get-5 RU 248)
;Value: lebedev

(get-5 ES 062)
;Value: apellido

(get-5 ES 006)
;Value: nombre

(get-5 ES 138)
;Value: munoz

(get-5 JP 058)
;Value: aida

(get-5 JP 003)
;Value: ezaki

(get-5 JP 108)
;Value: morris

(get-5 HK 036)
;Value: zen

(get-5 HK 009)
;Value: wu

(get-5 HK 148)
;Value: shi

(get-5 HK 086)
;Value: chan

