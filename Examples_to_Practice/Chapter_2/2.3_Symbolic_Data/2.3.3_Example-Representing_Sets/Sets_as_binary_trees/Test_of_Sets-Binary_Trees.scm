;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Sets-Binary_Trees.scm
;;                       originated from SICP
;;                       edited by Lawrence R. Amlord(颜世敏)
;;                       informlarry@gmail.com
;;                       Jul 21st, 2013
;;                       Xi'an, China

;; Copyright (C) 1984-2013 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: entry

;Value: left-branch

;Value: right-branch

;Value: make-tree

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test of element-of-set?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: element-of-set?

(define Tree-A '())
;Value: tree-a

(element-of-set? 0 Tree-A)
;Value: #f

(define Tree-B (make-tree 7
			  (make-tree 3
				     (make-tree 1 '() '())
				     (make-tree 5 '() '()))
			  (make-tree 9
				     '()
				     (make-tree 11 '() '()))))
;Value: tree-b

(element-of-set? 0 Tree-B)
;Value: #f

(element-of-set? 1 Tree-B)
;Value: #t

(element-of-set? 3 Tree-B)
;Value: #t

(element-of-set? 5 Tree-B)
;Value: #t

(element-of-set? 7 Tree-B)
;Value: #t

(element-of-set? 9 Tree-B)
;Value: #t

(element-of-set? 11 Tree-B)
;Value: #t

(element-of-set? 12 Tree-B)
;Value: #f


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test of adjoin-set
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: adjoin-set

(element-of-set? 12 (adjoin-set 12 Tree-A))
;Value: #t

(element-of-set? 12 (adjoin-set 12 Tree-B))
;Value: #t

