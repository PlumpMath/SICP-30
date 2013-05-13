;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_1.37.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 13th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: cont-frac

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   1)
;Value: 1.

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   2)
;Value: .5

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   3)
;Value: .6666666666666666

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   4)
;Value: .6000000000000001

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   5)
;Value: .625

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   6)
;Value: .6153846153846154

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   7)
;Value: .6190476190476191

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   8)
;Value: .6176470588235294

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   9)
;Value: .6181818181818182

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   10)
;Value: .6179775280898876

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   11)
;Value: .6180555555555556
