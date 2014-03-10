;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       4.3.1_Amb_and_Search.scm
;;                       originated from SICP
;;                       edited by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Mar 9th, 2014
;;                       Xi'an, China

;; Copyright (C) 1984-2014 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/Documents/CSAIL/SICP_Journey/Examples_to_Practice/Chapter_4/4.3_Variations_on_a_Scheme---Nondeterministic_Computing/4.3.1_Amb_and_Search/ch4-ambeval.scm")

;Loading "Documents/CSAIL/SICP_Journey/Examples_to_Practice/Chapter_4/4.3_Variations_on_a_Scheme---Nondeterministic_Computing/4.3.1_Amb_and_Search/ch4-ambeval.scm"...
;  Loading "Documents/CSAIL/SICP_Journey/Examples_to_Practice/Chapter_4/4.3_Variations_on_a_Scheme---Nondeterministic_Computing/4.3.1_Amb_and_Search/ch4-mceval.scm"... done
;... done
;Value: amb-evaluator-loaded

(define the-global-environment (setup-environment))
;Value: the-global-environment

(driver-loop)


;;; Amb-Eval input:
(define (prime-sum-pair list1 list2)
  (let ((a (an-element-of list1))
	(b (an-element-of list2)))
    (require (prime? (+ a b)))
    (list a b)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (prime? n)
  (= n (smallest-divisor n)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (smallest-divisor n)
  (find-divisor n 2))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (divides? a b)
  (= (remainder b a) 0))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (square x) (* x x))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (require p)
  (if (not p) (amb)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (an-element-of items)
  (require (not (null? items)))
  (amb (car items) (an-element-of (cdr items))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(prime-sum-pair '(1 3 5 8) '(20 35 110))

;;; Starting a new problem 
;;; Amb-Eval value:
(3 20)

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(3 110)

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(8 35)

;;; Amb-Eval input:
try-again

;;; There are no more values of
(prime-sum-pair (quote (1 3 5 8)) (quote (20 35 110)))

;;; Amb-Eval input:
(prime-sum-pair '(19 27 30) '(11 35 58))

;;; Starting a new problem 
;;; Amb-Eval value:
(30 11)

;;; Amb-Eval input:
try-again

;;; There are no more values of
(prime-sum-pair (quote (19 27 30)) (quote (11 35 58)))

;;; Amb-Eval input:
