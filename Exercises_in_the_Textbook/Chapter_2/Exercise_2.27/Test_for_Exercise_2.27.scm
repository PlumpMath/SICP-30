;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.27.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 30th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: deep-reverse

;Value: last-sublist

;Value: former-sublist

(define x (list (list 1 2) (list 3 4)))
;Value: x

(deep-reverse x)
;Value 27: ((4 3) (2 1))

(define y (list 1))
;Value: y

(deep-reverse y)
;Value 28: (1)

(define z '())
;Value: z

(deep-reverse z)
;Value: ()

(define m (list (list (list 1 2 3)
		      (list 4 5 6)
		      (list 7 8 9))
		(list (list 10 11 12)
		      (list 13 14 15)
		      (list 16 17 18))
		(list (list 19 20 21)
		      (list 22 23 24)
		      (list 25 26 27))))
;Value: m

(deep-reverse m)
;Value 29: (((27 26 25) (24 23 22) (21 20 19)) ((18 17 16) (15 14 13) (12 11 10)) ((9 8 7) (6 5 4) (3 2 1)))

