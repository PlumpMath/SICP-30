;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_3.21.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 25th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define q1 (make-queue))
;Value: q1

(insert-queue! q1 'a)
;Value 13: ((a) a)

(insert-queue! q1 'b)
;Value 13: ((a b) b)

(delete-queue! q1)
;Value 13: ((b) b)

(delete-queue! q1)
;Value 13: (() b)



(define q2 (make-queue))
;Value: q2

(print-queue q2)
;Value: ()

(print-queue (insert-queue! q2 'a))
;Value 19: (a)

(print-queue (insert-queue! q2 'b))
;Value 19: (a b)

(print-queue (delete-queue! q2))
;Value 20: (b)

(print-queue (delete-queue! q2))
;Value: ()
