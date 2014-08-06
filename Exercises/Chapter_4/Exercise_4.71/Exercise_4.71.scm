;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.71.scm
;;                       by Lawrence A. Yan (颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Aug 6th, 2014
;;                       Xi'an, China

;; Copyright (C) 2014 Lawrence A. Yan (颜世敏, aka 颜序)
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

(load "/Users/Lawrence/Campus/Engineering/EECS/SICP/Exercises/Chapter_4/Exercise_4.71/ch4-query_r4.71.scm")

;Loading "ch4-query_r4.71.scm"... done
;Value: microshaft-data-base

(initialize-data-base microshaft-data-base)
;Value: done

(query-driver-loop)


;;; Query input:
(assert! (married Minnis Mickey))

Assertion added to data base.

;;; Query input:
(assert! (rule (married ?x ?y)
	       (married ?y ?x)))

Assertion added to data base.

;;; Query input:
(married Mickey ?who)

;;; Query results:
;Aborting!: maximum recursion depth exceeded



(load "/Users/Lawrence/Campus/Engineering/EECS/SICP/allcode/ch4-query.scm")

;Loading "/Users/Lawrence/Campus/Engineering/EECS/SICP/allcode/ch4-query.scm"... done
;Value: microshaft-data-base

(initialize-data-base microshaft-data-base)
;Value: done

(query-driver-loop)


;;; Query input:
(assert! (married Minnis Mickey))

Assertion added to data base.

;;; Query input:
(assert! (rule (married ?x ?y)
	       (married ?y ?x)))

Assertion added to data base.

;;; Query input:
(married Mickey ?who)

;;; Query results:
(married mickey minnis)
(married mickey minnis)
(married mickey minnis)
(married mickey minnis)
(married mickey minnis)
; ... display infinetely
;Quit!

(load "/Users/Lawrence/Campus/Engineering/EECS/SICP/Exercises/Chapter_4/Exercise_4.71/ch4-query_r4.71.scm")

;Loading "ch4-query_r4.71.scm"... done
;Value: microshaft-data-base

(initialize-data-base microshaft-data-base)
;Value: done

(query-driver-loop)


;;; Query input:
(assert! (rule (hired ?x)
	       (or (job ?x ?pos)
		   (hired ?x))))

Assertion added to data base.

;;; Query input:
(hired ?x)

;;; Query results:
;Aborting!: maximum recursion depth exceeded



(load "/Users/Lawrence/Campus/Engineering/EECS/SICP/allcode/ch4-query.scm")

;Loading "/Users/Lawrence/Campus/Engineering/EECS/SICP/allcode/ch4-query.scm"... done
;Value: microshaft-data-base

(initialize-data-base microshaft-data-base)
;Value: done

(query-driver-loop)


;;; Query input:

(assert! (rule (hired ?x)
	       (or (job ?x ?pos)
		   (hired ?x))))

Assertion added to data base.

;;; Query input:
(hired ?x)

;;; Query results:
(hired (aull dewitt))
(hired (aull dewitt))
(hired (cratchet robert))
(hired (aull dewitt))
(hired (scrooge eben))
(hired (cratchet robert))
(hired (warbucks oliver))
(hired (aull dewitt))
(hired (reasoner louis))
(hired (scrooge eben))
(hired (tweakit lem e))
(hired (cratchet robert))
(hired (fect cy d))
(hired (warbucks oliver))
(hired (hacker alyssa p))
(hired (aull dewitt))
; ... display infinetely
;Quit!

