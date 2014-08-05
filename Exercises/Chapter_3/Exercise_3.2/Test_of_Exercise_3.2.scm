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

(s 256)
;Value: 16

(s 'how-many-calls?)
;Value: 2

(s 'reset-count)
;Value: 0

(s 8100)
;Value: 90

(s 'how-many-calls?)
;Value: 1

(s 1024)
;Value: 32

(s 'how-many-calls?)
;Value: 2



(define neg (make-monitored -))
;Value: neg

(neg 999)
;Value: -999

(neg 'how-many-calls?)
;Value: 1

(neg -1)
;Value: 1

(neg 'how-many-calls?)
;Value: 2

(neg -64)
;Value: 64

(neg 'how-many-calls?)
;Value: 3

(neg 'reset-count)
;Value: 0

(neg 'how-many-calls?)
;Value: 0

(neg 2387)
;Value: -2387

(neg 'how-many-calls?)
;Value: 1

(neg 8270)
;Value: -8270

(neg 'how-many-calls?)
;Value: 2

