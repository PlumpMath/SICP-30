;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_1.12.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 10th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: pascal-triangle

(pascal-triangle 0 1)
;Value: 0

(pascal-triangle -1 -1)
;Value: 0

(pascal-triangle 0 0)
;Value: 0

(pascal-triangle 5 0)
;Value: 0

(pascal-triangle 1 1)
;Value: 1

(pascal-triangle 3 1)
;Value: 1

(pascal-triangle 2 2)
;Value: 1

(pascal-triangle 5 5)
;Value: 1

(pascal-triangle 4 2)
;Value: 3

(pascal-triangle 4 3)
;Value: 3

(pascal-triangle 5 3)
;Value: 6

(pascal-triangle 5 4)
;Value: 4
