;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_2.69.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 24th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: generate-huffman-tree

;Value: successive-merge


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

(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((< (weight x) (weight (car set))) (cons x set))
	(else (cons (car set)
		    (adjoin-set x (cdr set))))))
;Value: adjoin-set

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
	(adjoin-set (make-leaf (car pair)    ; symbol
			       (cadr pair))  ; frequency
		    (make-leaf-set (cdr pairs))))))
;Value: make-leaf-set

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
	'()
	(let ((next-branch
	       (choose-branch (car bits) current-branch)))
	  (if (leaf? next-branch)
	      (cons (symbol-leaf next-branch)
		    (decode-1 (cdr bits) tree))
	      (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))
;Value: decode

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
	((= bit 1) (right-branch branch))
	(else (error "bad bit -- CHOOSE-BRANCH" bit))))
;Value: choose-branch

(define sample-pairs '((A 4) (B 2) (C 1) (D 1)))
;Value: sample-pairs

(define sample-tree (generate-huffman-tree sample-pairs))
;Value: sample-tree

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
;Value: sample-message

(display sample-tree)
((leaf a 4) ((leaf b 2) ((leaf d 1) (leaf c 1) (d c) 2) (b d c) 4) (a b d c) 8)
;Unspecified return value

(decode sample-message sample-tree)
;Value 36: (a d a b b c a)

