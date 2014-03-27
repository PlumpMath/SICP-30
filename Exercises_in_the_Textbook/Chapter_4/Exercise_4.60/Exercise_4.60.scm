;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.60.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Mar 26th, 2014
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

(load "/Users/Lawrence/Campus/Engineering/EECS/SICP_Journey/Exercises_in_the_Textbook/Chapter_4/Exercise_4.60/ch4-query.scm")

;Loading "Campus/Engineering/EECS/SICP_Journey/Exercises_in_the_Textbook/Chapter_4/Exercise_4.60/ch4-query.scm"... done
;Value: microshaft-data-base

(initialize-data-base microshaft-data-base)
;Value: done

(query-driver-loop)


;;; Query input:
(assert! (id (Warbucks Oliver) 001))

Assertion added to data base.

;;; Query input:
(assert! (id (Aull DeWitt) 002))

Assertion added to data base.

;;; Query input:
(assert! (id (Bitdiddle Ben) 011))

Assertion added to data base.

;;; Query input:
(assert! (id (Hacker Alyssa P) 012))

Assertion added to data base.

;;; Query input:
(assert! (id (Fect Cy D) 013))

Assertion added to data base.

;;; Query input:
(assert! (id (Tweakit Lem E) 014))

Assertion added to data base.

;;; Query input:
(assert! (id (Reasoner Louis) 015))

Assertion added to data base.

;;; Query input:
(assert! (id (Scrooge Eben) 021))

Assertion added to data base.

;;; Query input:
(assert! (id (Cratchet Robert) 022))

Assertion added to data base.

;;; Query input:
(assert! (rule (same ?x ?x)))

Assertion added to data base.

;;; Query input:
(assert! (rule (lives-near ?person-1 ?person-2)
	       (and (address ?person-1 (?town . ?rest-1))
		    (address ?person-2 (?town . ?rest-2))
		    (not (same ?person-1 ?person-2))
		    (id ?person-1 ?id-1)
		    (id ?person-2 ?id-2)
		    (lisp-value > ?id-1 ?id-2))))

Assertion added to data base.

;;; Query input:
(lives-near ?person (Hacker Alyssa P))

;;; Query results:
(lives-near (fect cy d) (hacker alyssa p))
(lives-near (fect cy d) (hacker alyssa p))

;;; Query input:
(lives-near ?person-1 ?person-2)

;;; Query results:
(lives-near (reasoner louis) (aull dewitt))
(lives-near (aull dewitt) (reasoner louis))
(lives-near (reasoner louis) (bitdiddle ben))
(lives-near (aull dewitt) (bitdiddle ben))
(lives-near (fect cy d) (hacker alyssa p))
(lives-near (reasoner louis) (aull dewitt))
(lives-near (bitdiddle ben) (aull dewitt))
(lives-near (reasoner louis) (bitdiddle ben))
(lives-near (hacker alyssa p) (fect cy d))
(lives-near (fect cy d) (hacker alyssa p))
(lives-near (bitdiddle ben) (aull dewitt))
(lives-near (bitdiddle ben) (reasoner louis))

;;; Query input:
