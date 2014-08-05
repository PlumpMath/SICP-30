;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.24.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       May 29th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(list 1 (list 2 (list 3 4)))
;Value 13: (1 (2 (3 4)))

(cons 1
      (cons (list 2 (list 3 4))
	    '()))
;Value 14: (1 (2 (3 4)))

(cons 1
      (cons (cons 2
		  (cons (list 3 4)
			'()))
	    '()))
;Value 15: (1 (2 (3 4)))

(cons 1
      (cons (cons 2
		  (cons (cons 3
			      (cons 4 '()))
			'()))
	    '()))
;Value 16: (1 (2 (3 4)))

