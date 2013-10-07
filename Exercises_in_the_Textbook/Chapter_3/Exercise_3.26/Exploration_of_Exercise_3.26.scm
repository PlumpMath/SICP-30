;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exploration_of_Exercise_3.26.scm
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
  (let ((2D-record (make-record given-key-1 given-key-2 given-value)))
    (set-cdr! table
	      (adjoin-tree-2D 2D-record (cdr table))))
  'ok)
;Value: insert!

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
;Value: adjoin-tree-2d

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
;Value: adjoin-tree-1D

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





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Multi-dimentional table
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

(define (make-record keys value)
  (if (null? (cdr keys))
      (cons (car keys) value)
      (cons (car keys)
	    (make-record (cdr keys) value))))
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

(define (lookup keys table)
  (if (null? (cdr keys))
      (let ((record (assoc (car keys) (cdr table))))
	(if record
	    (cdr record)
	    false))
      (let ((subtable (assoc (car keys) (cdr table))))
	(if subtable
	    (lookup (cdr keys) subtable)
	    false))))
;Value: lookup

(define (insert! keys given-value table)
  (let ((MD-record (make-record keys given-value)))
    (set-cdr! table
	      (adjoin-tree-MD MD-record (cdr table))))
  'ok)
;Value: insert!

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
;Value: adjoin-tree-md

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
;Value: adjoin-tree-1d

(define (make-table)
  (list '*table*))
;Value: make-table

;; Universities and Colleges

(define Havard 001)
;Value: havard

(define MIT 002)
;Value: mit

(define Cambridge 003)
;Value: cambridge

(define Oxford 004)
;Value: oxford

(define Harvy-Mudd 005)
;Value: harvy-mudd

(define Stanford 006)
;Value: stanford

(define HKU 007)
;Value: hku

(define TokyoU 008)
;Value: tokyou


;; Stuff Rank

(define Student 01)
;Value: student

(define Teacher 02)
;Value: teacher

(define President 03)
;Value: president


;; Schools and Departments

(define Philosophy 01)
;Value: philosophy

(define Mathematics 02)
;Value: mathematics

(define Law 03)
;Value: law

(define Physics 04)
;Value: physics

(define Chemistry 05)
;Value: chemistry

(define EECS 06)
;Value: eecs

(define Biology 07)
;Value: biology

(define Mechanics 08)
;Value: mechanics

(define Bussiness 09)
;Value: bussiness



;; Students Rank

(define Undergraduate 01)
;Value: undergraduate

(define Graduate 02)
;Value: graduate



;; Teacher Rank

(define Lecturer 01)
;Value: lecturer

(define Assistant-Professor 02)
;Value: assistant-professor

(define Associate-Professor 03)
;Value: associate-professor

(define Professor 04)
;Value: professor

(define Tenure-Professor 05)
;Value: tenure-professor




(define T8 (make-table))
;Value: t8

(lookup (list MIT Student Undergraduate Mathematics 120) T8)
;Value: #f

(lookup (list MIT Student Undergraduate Biology 006) T8)
;Value: #f

(lookup (list MIT Student Graduate Mechanics 015) T8)
;Value: #f

(lookup (list MIT Teacher Tenure-Professor 024) T8)
;Value: #f

(lookup (list MIT Teacher Lecturer 064) T8)
;Value: #f

(lookup (list MIT President) T8)
;Value: #f



(lookup (list HKU Student Undergraduate EECS 051) T8)
;Value: #f

(lookup (list HKU Student Undergraduate Philosophy 012) T8)
;Value: #f

(lookup (list HKU Student Graduate Physics 075) T8)
;Value: #f

(lookup (list HKU Teacher Associate-Professor 003) T8)
;Value: #f

(lookup (list HKU Teacher Professor 025) T8)
;Value: #f

(lookup (list HKU President) T8)
;Value: #f



(insert! (list MIT Student Undergraduate Mathematics 120) 'Dorgan T8)
;Value: ok

(display T8)
(*table* (2 (1 (1 (2 (120 . dorgan) () ()) () ()) () ()) () ()) () ())
;Unspecified return value

(insert! (list MIT Student Undergraduate Biology 006) 'Kermo T8)
;Value: ok

(display T8)
(*table* (2 (1 (1 (2 (120 . dorgan) () ()) () ((7 (6 . kermo) () ()) () ())) () ()) () ()) () ())
;Unspecified return value

(insert! (list MIT Student Graduate Mechanics 015) 'Graham T8)
;Value: ok

(display T8)
(*table* (2 (1 (1 (2 (120 . dorgan) () ()) () ((7 (6 . kermo) () ()) () ())) () ((2 (8 (15 . graham) () ()) () ()) () ())) () ()) () ())
;Unspecified return value


(insert! (list MIT Teacher Tenure-Professor 024) 'Strang T8)
;Value: ok

(display T8)
(*table* (2 (1 (1 (2 (120 . dorgan) () ()) () ((7 (6 . kermo) () ()) () ())) () ((2 (8 (15 . graham) () ()) () ()) () ())) () ((2 (5 (24 . strang) () ()) () ()) () ())) () ())
;Unspecified return value

(insert! (list MIT Teacher Lecturer 064) 'Menlord T8)
;Value: ok

(display T8)
(*table* (2 (1 (1 (2 (120 . dorgan) () ()) () ((7 (6 . kermo) () ()) () ())) () ((2 (8 (15 . graham) () ()) () ()) () ())) () ((2 (5 (24 . strang) () ()) ((1 (64 . menlord) () ()) () ()) ()) () ())) () ())
;Unspecified return value

(insert! (list MIT President) 'Reif T8)
;Value: ok

(display T8)
(*table* (2 (1 (1 (2 (120 . dorgan) () ()) () ((7 (6 . kermo) () ()) () ())) () ((2 (8 (15 . graham) () ()) () ()) () ())) () ((2 (5 (24 . strang) () ()) ((1 (64 . menlord) () ()) () ()) ()) () ((3 . reif) () ()))) () ())
;Unspecified return value

(lookup (list MIT Student Undergraduate Mathematics 120) T8)
;Value: dorgan

(lookup (list MIT Student Undergraduate Biology 006) T8)
;Value: kermo

(lookup (list MIT Student Graduate Mechanics 015) T8)
;Value: graham

(lookup (list MIT Teacher Tenure-Professor 024) T8)
;Value: strang

(lookup (list MIT Teacher Lecturer 064) T8)
;Value: menlord

(lookup (list MIT President) T8)
;Value: reif



(insert! (list HKU Student Undergraduate EECS 051) 'Ding T8)
;Value: ok

(display T8)
(*table* (2 (1 (1 (2 (120 . dorgan) () ()) () ((7 (6 . kermo) () ()) () ())) () ((2 (8 (15 . graham) () ()) () ()) () ())) () ((2 (5 (24 . strang) () ()) ((1 (64 . menlord) () ()) () ()) ()) () ((3 . reif) () ()))) () ((7 (1 (1 (6 (51 . ding) () ()) () ()) () ()) () ()) () ()))
;Unspecified return value


(insert! (list HKU Student Undergraduate Philosophy 012) 'Yan T8)
;Value: ok

(display T8)
(*table* (2 (1 (1 (2 (120 . dorgan) () ()) () ((7 (6 . kermo) () ()) () ())) () ((2 (8 (15 . graham) () ()) () ()) () ())) () ((2 (5 (24 . strang) () ()) ((1 (64 . menlord) () ()) () ()) ()) () ((3 . reif) () ()))) () ((7 (1 (1 (6 (51 . ding) () ()) ((1 (12 . yan) () ()) () ()) ()) () ()) () ()) () ()))
;Unspecified return value


(insert! (list HKU Student Graduate Physics 075) 'Bai T8)
;Value: ok

(display T8)
(*table* (2 (1 (1 (2 (120 . dorgan) () ()) () ((7 (6 . kermo) () ()) () ())) () ((2 (8 (15 . graham) () ()) () ()) () ())) () ((2 (5 (24 . strang) () ()) ((1 (64 . menlord) () ()) () ()) ()) () ((3 . reif) () ()))) () ((7 (1 (1 (6 (51 . ding) () ()) ((1 (12 . yan) () ()) () ()) ()) () ((2 (4 (75 . bai) () ()) () ()) () ())) () ()) () ()))
;Unspecified return value

(insert! (list HKU Teacher Associate-Professor 003) 'Lin  T8)
;Value: ok

(display T8)
(*table* (2 (1 (1 (2 (120 . dorgan) () ()) () ((7 (6 . kermo) () ()) () ())) () ((2 (8 (15 . graham) () ()) () ()) () ())) () ((2 (5 (24 . strang) () ()) ((1 (64 . menlord) () ()) () ()) ()) () ((3 . reif) () ()))) () ((7 (1 (1 (6 (51 . ding) () ()) ((1 (12 . yan) () ()) () ()) ()) () ((2 (4 (75 . bai) () ()) () ()) () ())) () ((2 (3 (3 . lin) () ()) () ()) () ())) () ()))
;Unspecified return value


(insert! (list HKU Teacher Professor 025) 'Morgan T8)
;Value: ok

(display T8)
(*table* (2 (1 (1 (2 (120 . dorgan) () ()) () ((7 (6 . kermo) () ()) () ())) () ((2 (8 (15 . graham) () ()) () ()) () ())) () ((2 (5 (24 . strang) () ()) ((1 (64 . menlord) () ()) () ()) ()) () ((3 . reif) () ()))) () ((7 (1 (1 (6 (51 . ding) () ()) ((1 (12 . yan) () ()) () ()) ()) () ((2 (4 (75 . bai) () ()) () ()) () ())) () ((2 (3 (3 . lin) () ()) () ((4 (25 . morgan) () ()) () ())) () ())) () ()))
;Unspecified return value


(insert! (list HKU President) 'Cai T8)
;Value: ok

(display T8)
(*table* (2 (1 (1 (2 (120 . dorgan) () ()) () ((7 (6 . kermo) () ()) () ())) () ((2 (8 (15 . graham) () ()) () ()) () ())) () ((2 (5 (24 . strang) () ()) ((1 (64 . menlord) () ()) () ()) ()) () ((3 . reif) () ()))) () ((7 (1 (1 (6 (51 . ding) () ()) ((1 (12 . yan) () ()) () ()) ()) () ((2 (4 (75 . bai) () ()) () ()) () ())) () ((2 (3 (3 . lin) () ()) () ((4 (25 . morgan) () ()) () ())) () ((3 . cai) () ()))) () ()))
;Unspecified return value

(lookup (list HKU Student Undergraduate EECS 051) T8)
;Value: ding

(lookup (list HKU Student Undergraduate Philosophy 012) T8)
;Value: yan

(lookup (list HKU Student Graduate Physics 075) T8)
;Value: bai

(lookup (list HKU Teacher Associate-Professor 003) T8)
;Value: lin

(lookup (list HKU Teacher Professor 025) T8)
;Value: morgan

(lookup (list HKU President) T8)
;Value: cai

