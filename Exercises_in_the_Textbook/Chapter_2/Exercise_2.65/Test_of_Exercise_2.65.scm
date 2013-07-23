;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_2.65.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 23rd, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (union-list list1 list2)
  (cond ((null? list1) list2)
	((null? list2) list1)
	(else
	 (let ((x1 (car list1))
	       (x2 (car list2)))
	   (cond ((= x1 x2)
		  (cons x1
			(union-list (cdr list1) (cdr list2))))
		 ((< x1 x2)
		  (cons x1
			(union-list (cdr list1) list2)))
		 (else
		  (cons x2
			(union-list list1 (cdr list2)))))))))
;Value: union-list

(define (intersection-list list1 list2)
  (if (or (null? list1) (null? list2))
      '()
       (let ((x1 (car list1))
	     (x2 (car list2)))
	 (cond ((= x1 x2)
		(cons x1
		      (intersection-list (cdr list1) (cdr list2))))
	       ((< x1 x2)
		(intersection-list (cdr list1) list2))
	       (else
		(intersection-list list1 (cdr list2)))))))
;Value: intersection-list

(define (list->tree elements)
  (car (partial-tree elements (length elements))))
;Value: list->tree

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
	(let ((left-result (partial-tree elts left-size)))
	  (let ((left-tree (car left-result))
		(non-left-elts (cdr left-result))
		(right-size (- n (+ left-size 1))))
	    (let ((this-entry (car non-left-elts))
		  (right-result (partial-tree (cdr non-left-elts)
					      right-size)))
	      (let ((right-tree (car right-result))
		    (remaining-elts (cdr right-result)))
		(cons (make-tree this-entry left-tree right-tree)
		      remaining-elts))))))))
;Value: partial-tree

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
	result-list
	(copy-to-list (left-branch tree)
		      (cons (entry tree)
			    (copy-to-list (right-branch tree)
					  result-list)))))
  (copy-to-list tree '()))
;Value: tree->list-2

(define (entry tree) (car tree))
;Value: entry

(define (left-branch tree) (cadr tree))
;Value: left-branch

(define (right-branch tree) (caddr tree))
;Value: right-branch

(define (make-tree entry left right)
  (list entry left right))
;Value: make-tree


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test of union-set
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: union-set

(union-set '() '())
;Value: ()

(union-set '()
	   (make-tree 1 '() '()))
;Value 20: (1 () ())

(union-set (make-tree 1 '() '())
	   '())
;Value 21: (1 () ())

(union-set (make-tree 7
		      (make-tree 3
				 (make-tree 1 '() '())
				 (make-tree 5 '() '()))
		      (make-tree 9
				 '()
				 (make-tree 11 '() '())))
	   (make-tree 6
		      (make-tree 3
				 (make-tree 1 '() '())
				 (make-tree 4 '() '()))
		      (make-tree 9
				 '()
				 (make-tree 12 '() '()))))
;Value 22: (6 (3 (1 () ()) (4 () (5 () ()))) (9 (7 () ()) (11 () (12 () ()))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test of intersection-set
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: intersection-set

(intersection-set '() '())
;Value: ()

(intersection-set '()
		  (make-tree 1 '() '()))
;Value: ()

(intersection-set (make-tree 1 '() '())
		  '())
;Value: ()

(intersection-set (make-tree 7
			     (make-tree 3
					(make-tree 1 '() '())
					(make-tree 5 '() '()))
			     (make-tree 9
					'()
					(make-tree 11 '() '())))
		  (make-tree 6
			     (make-tree 3
					(make-tree 1 '() '())
					(make-tree 4 '() '()))
			     (make-tree 9
					'()
					(make-tree 12 '() '()))))
;Value 25: (3 (1 () ()) (9 () ()))

