;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_2.63.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 21st, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: entry

;Value: left-branch

;Value: right-branch

;Value: make-tree

;Value: tree->list-1

;Value: tree->list-2

(define Tree-A (make-tree 7
			  (make-tree 3
				     (make-tree 1 '() '())
				     (make-tree 5 '() '()))
			  (make-tree 9
				     '()
				     (make-tree 11 '() '()))))
;Value: tree-a

(define Tree-B (make-tree 3
			  (make-tree 1 '() '())
			  (make-tree 7
				     (make-tree 5 '() '())
				     (make-tree 9
						'()
						(make-tree 11 '() '())))))
;Value: tree-b

(define Tree-C (make-tree 5
			  (make-tree 3
				     (make-tree 1 '() '())
				     '())
			  (make-tree 9
				     (make-tree 7 '() '())
				     (make-tree 11 '() '()))))
;Value: tree-c

(tree->list-1 Tree-A)
;Value 20: (1 3 5 7 9 11)

(tree->list-2 Tree-A)
;Value 21: (1 3 5 7 9 11)

(tree->list-1 Tree-B)
;Value 22: (1 3 5 7 9 11)

(tree->list-2 Tree-B)
;Value 23: (1 3 5 7 9 11)

(tree->list-1 Tree-C)
;Value 24: (1 3 5 7 9 11)

(tree->list-2 Tree-C)
;Value 25: (1 3 5 7 9 11)

