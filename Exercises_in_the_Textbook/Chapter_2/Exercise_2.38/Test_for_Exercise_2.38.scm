;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.38.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jun 4th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: fold-right

;Value: fold-left

(fold-right / 1 (list 1 2 3))
;Value: 3/2

(fold-left / 1 (list 1 2 3))
;Value: 1/6

(fold-right list '() (list 1 2 3))
;Value 20: (1 (2 (3 ())))

(fold-left list '() (list 1 2 3))
;Value 21: (((() 1) 2) 3)

(fold-right + 0 (list 1 2 3))
;Value: 6

(fold-left + 0 (list 1 2 3))
;Value: 6

(fold-right * 1 (list 1 2 3))
;Value: 6

(fold-left * 1 (list 1 2 3))
;Value: 6

