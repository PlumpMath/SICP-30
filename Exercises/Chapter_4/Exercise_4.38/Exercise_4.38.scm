;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.38.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Mar 3rd, 2014
;;                       Xi'an, China

;; Copyright (C) 2014 Lawrence X. Amlord(颜世敏, aka 颜序)
;; <informlarry@gmail.com>

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

(load "~/Documents/CSAIL/SICP_Journey/Exercises_in_the_Textbook/Chapter_4/Exercise_4.38/ch4-ambeval.scm")

;Loading "ch4-ambeval.scm"...
;  Loading "ch4-mceval.scm"... done
;... done
;Value: amb-evaluator-loaded


(define the-global-environment (setup-environment))
;Value: the-global-environment

(driver-loop)


;;; Amb-Eval input:
(define (require p)
  (if (not p) (amb)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (distinct? items)
  (cond ((null? items) true)
	((null? (cdr items)) true)
	((member (car items) (cdr items)) false)
	(else (distinct? (cdr items)))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (multiple-dwelling)
  (let ((baker (amb 1 2 3 4 5))
	(cooper (amb 1 2 3 4 5))
	(fletcher (amb 1 2 3 4 5))
	(miller (amb 1 2 3 4 5))
	(smith (amb 1 2 3 4 5)))
    (require
     (distinct? (list baker cooper fletcher miller smith)))
    (require (not (= baker 5)))
    (require (not (= cooper 1)))
    (require (not (= fletcher 5)))
    (require (not (= fletcher 1)))
    (require (> miller cooper))
    (require (not (= (abs (- fletcher cooper)) 1)))
    (list (list 'baker baker)
	  (list 'cooper cooper)
	  (list 'fletcher fletcher)
	  (list 'miller miller)
	  (list 'smith smith))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(multiple-dwelling)

;;; Starting a new problem 
;;; Amb-Eval value:
((baker 1) (cooper 2) (fletcher 4) (miller 3) (smith 5))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
((baker 1) (cooper 2) (fletcher 4) (miller 5) (smith 3))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
((baker 1) (cooper 4) (fletcher 2) (miller 5) (smith 3))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
((baker 3) (cooper 2) (fletcher 4) (miller 5) (smith 1))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
((baker 3) (cooper 4) (fletcher 2) (miller 5) (smith 1))

;;; Amb-Eval input:
try-again

;;; There are no more values of
(multiple-dwelling)

;;; Amb-Eval input:
;Quit!

