;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_2.64.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 21st, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: list->tree

;Value: partial-tree

(define (entry tree) (car tree))
;Value: entry

(define (left-branch tree) (cadr tree))
;Value: left-branch

(define (right-branch tree) (caddr tree))
;Value: right-branch

(define (make-tree entry left right)
  (list entry left right))
;Value: make-tree

(list->tree (list 1 3 5 7 9 11))
;Value 20: (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))

