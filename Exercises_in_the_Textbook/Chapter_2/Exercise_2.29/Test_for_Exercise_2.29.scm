;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.29.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       May 30th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Test for subproblem a.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-mobile

;Value: left-branch

;Value: right-branch

;Value: make-branch

;Value: branch-length

;Value: branch-structure





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Test for subproblem b.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Build the first mobile

(define left11 (make-branch 5 8))
;Value: left11

(define right11 (make-branch 7 10))
;Value: right11

(define m11 (make-mobile left11 right11))
;Value: m11

(define left12 (make-branch 4 6))
;Value: left12

(define right12 (make-branch 1 3))
;Value: right12

(define m12 (make-mobile left12 right12))
;Value: m12

(define left10 (make-branch 12 m11))
;Value: left10

(define right10 (make-branch 5 m12))
;Value: right10

(define m10 (make-mobile left10 right10))
;Value: m10



;; Build the second mobile

(define left21 (make-branch 2 25))
;Value: left21

(define right21 (make-branch 5 10))
;Value: right21

(define m21 (make-mobile left21 right21))
;Value: m21

(define left20 (make-branch 4 m21))
;Value: left20

(define left22 (make-branch 4 30))
;Value: left22

(define right22 (make-branch 3 40))
;Value: right22

(define m22 (make-mobile left22 right22))
;Value: m22

(define right20 (make-branch 2 m22))
;Value: right20

(define m20 (make-mobile left20 right20))
;Value: m20



;; Test for the first version of total-weight

;Value: total-weight

(total-weight m10)
;Value: 27

(total-weight m20)
;Value: 105



;; Test for the second version of total-weight

;Value: total-weight

;Value: branch-weight

(total-weight m10)
;Value: 27

(total-weight m20)
;Value: 105





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Test for subproblem c.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: balanced?

;Value: torque

;Value: branch-weight

;Value: branch-balanced?

(balanced? m10)
;Value: #f

(balanced? m20)
;Value: #t





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Test for subproblem d.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-mobile

;Value: make-branch

;Value: right-branch

;Value: branch-structure



;; Build the first mobile

(define left11 (make-branch 5 8))
;Value: left11

(define right11 (make-branch 7 10))
;Value: right11

(define m11 (make-mobile left11 right11))
;Value: m11

(define left12 (make-branch 4 6))
;Value: left12

(define right12 (make-branch 1 3))
;Value: right12

(define m12 (make-mobile left12 right12))
;Value: m12

(define left10 (make-branch 12 m11))
;Value: left10

(define right10 (make-branch 5 m12))
;Value: right10

(define m10 (make-mobile left10 right10))
;Value: m10



;; Build the second mobile

(define left21 (make-branch 2 25))
;Value: left21

(define right21 (make-branch 5 10))
;Value: right21

(define m21 (make-mobile left21 right21))
;Value: m21

(define left20 (make-branch 4 m21))
;Value: left20

(define left22 (make-branch 4 30))
;Value: left22

(define right22 (make-branch 3 40))
;Value: right22

(define m22 (make-mobile left22 right22))
;Value: m22

(define right20 (make-branch 2 m22))
;Value: right20

(define m20 (make-mobile left20 right20))
;Value: m20



;; Test for the first version of total-weight

;Value: total-weight

(total-weight m10)
;Value: 27

(total-weight m20)
;Value: 105



;; Test for the second version of total-weight

;Value: total-weight

;Value: branch-weight

(total-weight m10)
;Value: 27

(total-weight m20)
;Value: 105



;; Test whether the two mobiles are balanced

;Value: balanced?

;Value: torque

;Value: branch-weight

;Value: branch-balanced?

(balanced? m10)
;Value: #f

(balanced? m20)
;Value: #t
