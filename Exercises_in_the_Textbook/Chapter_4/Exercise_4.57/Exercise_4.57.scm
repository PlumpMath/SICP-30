;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.57.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Mar 23th, 2014
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

(load "/Users/Lawrence/Documents/CSAIL/SICP_Journey/Exercises_in_the_Textbook/Chapter_4/Exercise_4.55/ch4-query.scm")

;Loading "ch4-query.scm"... done
;Value: microshaft-data-base

(initialize-data-base microshaft-data-base)
;Value: done

(query-driver-loop)


;;; Query input:
(assert! (rule (same ?x ?x)))

Assertion added to data base.

;;; Query input:
(assert! (rule (replace ?person-1 ?person-2)
	       (or (and (job ?person-1 ?position)
			(job ?person-2 ?position)
			(not (same ?person-1 ?person-2)))
		   (and (job ?person-1 ?position-1)
			(job ?person-2 ?position-2)
			(can-do-job ?position-1 ?position-2)
			(not (same ?person-1 ?person-2))))))

Assertion added to data base.

;;; Query input:
(replace ?person (Fect Cy D))

;;; Query results:
(replace (hacker alyssa p) (fect cy d))
(replace (bitdiddle ben) (fect cy d))

;;; Query input:
(and (replace ?person-1 ?person-2)
     (salary ?person-1 ?amount-1)
     (salary ?person-2 ?amount-2)
     (lisp-value < ?amount-1 ?amount-2))

;;; Query results:
(and (replace (aull dewitt) (warbucks oliver))
     (salary (aull dewitt) 25000)
     (salary (warbucks oliver) 150000)
     (lisp-value < 25000 150000))

(and (replace (fect cy d) (hacker alyssa p))
     (salary (fect cy d) 35000)
     (salary (hacker alyssa p) 40000)
     (lisp-value < 35000 40000))

;;; Query input:
