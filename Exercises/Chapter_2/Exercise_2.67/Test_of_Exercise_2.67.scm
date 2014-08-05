;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_2.67.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 24th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-leaf

;Value: leaf?

;Value: symbol-leaf

;Value: weight-leaf

;Value: make-code-tree

;Value: left-branch

;Value: right-branch

;Value: symbols

;Value: weight

;Value: decode

;Value: choose-branch

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
;; A Sample Message
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
;Value: sample-message

(decode sample-message sample-tree)
;Value 22: (a d a b b c a)

