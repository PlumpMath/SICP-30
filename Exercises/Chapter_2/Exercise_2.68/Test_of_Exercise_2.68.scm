;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_2.68.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 24th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: encode

;Value: encode-symbol

;Value: element-of-set?


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Representation of Huffman Trees
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Representation of a leaf.

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
;Value: make-leaf

(define (leaf? object)
  (eq? (car object) 'leaf))
;Value: leaf?

(define (symbol-leaf x) (cadr x))
;Value: symbol-leaf

(define (weight-leaf x) (caddr x))
;Value: weight-leaf


;; Representation of a general tree.

(define (make-code-tree left right)
  (list left
	right
	(append (symbols left) (symbols right))
	(+ (weight left) (weight right))))
;Value: make-code-tree

(define (left-branch tree) (car tree))
;Value: left-branch

(define (right-branch tree) (cadr tree))
;Value: right-branch

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
;Value: symbols

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
;Value: weight

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The Encoding Tree
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
		  (make-code-tree
		   (make-leaf 'B 2)
		   (make-code-tree (make-leaf 'D 1)
				   (make-leaf 'C 1)))))
;Value: sample-tree


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; A Sample Symbols
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define sample-symbols '(A D A B B C A))
;Value: sample-symbols

(encode sample-symbols sample-tree)
;Value 21: (0 1 1 0 0 1 0 1 0 1 1 1 0)

