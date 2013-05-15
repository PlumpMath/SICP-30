;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Fixed_Point_of_Transform.scm
;;                       originated from SICP
;;                       edited by Lawrence R. Amlord(颜世敏)
;;                       informlarry@gmail.com
;;                       May 15th, 2013
;;                       Xi'an, China

;; Copyright (C) 1984-2013 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: fixed-point-of-transform

;Value: sqrt-i

;Value: sqrt-ii

;Value: fixed-point

;Value: average-damp

;Value: average

;Value: square

;Value: newton-transform

;Value: deriv

;Value: dx

(sqrt-i 0)
;Value: .00000762939453125

(sqrt-i 2)
;Value: 1.4142135623746899

(sqrt-i 81)
;Value: 9.

(sqrt-i 10000)
;Value: 100.

(sqrt-ii 0)
;Value: 1.1910693092815299e-5

(sqrt-ii 2)
;Value: 1.4142135623822438

(sqrt-ii 81)
;Value: 9.

(sqrt-ii 10000)
;Value: 100.00000000000001
