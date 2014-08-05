;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_3.22.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 27th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-queue

;Value: empty-queue?

;Value: front-queue

;Value: insert-queue!

;Value: delete-queue!

(define q (make-queue))
;Value: q

(insert-queue! q 'a)
;Value 34: (a)

(insert-queue! q 'b)
;Value 34: (a b)

(delete-queue! q)
;Value 35: (b)

(insert-queue! q 'c)
;Value 35: (b c)

(insert-queue! q 'd)
;Value 35: (b c d)

(delete-queue! q)
;Value 36: (c d)
