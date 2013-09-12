;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_3.2.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 12th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-monitored

(define s (make-monitored sqrt))
;Value: s

(s 100)
;Value: 10

(s 'how-many-calls?)
;Value: 1

(s 64)
;Value: 8

(s 'how-many-calls?)
;Value: 2

(s 256)
;Value: 16

(s 'how-many-calls?)
;Value: 3

(s 'reset-count)
;Value: 0

(s 121)
;Value: 11

(s 'how-many-calls?)
;Value: 1

