;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_1.31.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 9th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: product

;Value: factorial

;Value: pi-quotient

;Value: iproduct

;Value: ifactorial

(factorial 0)
;Value: 1

(factorial 1)
;Value: 1

(factorial 6)
;Value: 720

(factorial 10)
;Value: 3628800

(* 4 (pi-quotient 2.0 8))
;Value: 3.3436734693877552

(* 4 (pi-quotient 2.0 10))
;Value: 3.3023935500125976

(* 4 (pi-quotient 2.0 100))
;Value: 3.157339689217564

(* 4 (pi-quotient 2.0 150))
;Value: 3.152082023977961

(* 4 (pi-quotient 2.0 175))
;Value: #[NaN]

(* 4 (pi-quotient 2.0 200))
;Value: #[NaN]
