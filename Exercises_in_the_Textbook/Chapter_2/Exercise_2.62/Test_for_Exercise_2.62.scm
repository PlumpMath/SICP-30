;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.62.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 20th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: union-set

(define X (union-set (list 1 2 4 6 7 8 9) (list 0 2 3 4 5 8 9)))
;Value: x

(display X)
(0 1 2 3 4 5 6 7 8 9)
;Unspecified return value

(define Y (union-set '(-221 0 1779 1840 1895 1917 1931 1937 1945 1975 1984 2012)
		     '(-750 -221 365 1776 1895 1918 1929 1948 1978 1988 2009 2013)))
;Value: y

(display Y)
(-750 -221 0 365 1776 1779 1840 1895 1917 1918 1929 1931 1937 1945 1948 1975 1978 1984 1988 2009 2012 2013)
;Unspecified return value

