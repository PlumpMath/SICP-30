;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.38.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Jun 4th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Test for fold-right
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: fold-right

(fold-right / 1 (list 1 2 3))
;Value: 3/2

(fold-right list '() (list 1 2 3))
;Value 20: (1 (2 (3 ())))

(fold-right + 0 (list 1 2 3))
;Value: 6

(fold-right * 1 (list 1 2 3))
;Value: 6



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Test for fold-left
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: fold-left

(fold-left / 1 (list 1 2 3))
;Value: 1/6

(fold-left list '() (list 1 2 3))
;Value 21: (((() 1) 2) 3)

(fold-left + 0 (list 1 2 3))
;Value: 6

(fold-left * 1 (list 1 2 3))
;Value: 6

