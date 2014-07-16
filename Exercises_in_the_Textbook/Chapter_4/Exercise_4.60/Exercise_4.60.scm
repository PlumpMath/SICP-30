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

(load "/Users/Lawrence/Campus/Engineering/EECS/SICP/allcode/ch4-query.scm")

;Loading "Campus/Engineering/EECS/SICP/allcode/ch4-query.scm"... done
;Value: microshaft-data-base

(initialize-data-base microshaft-data-base)
;Value: done

(query-driver-loop)


;;; Query input:
(assert! (rule (same ?x ?x)))

Assertion added to data base.

;;; Query input:
(assert! (id (Warbucks Oliver) 1))

Assertion added to data base.

;;; Query input:
(assert! (id (Aull DeWitt) 2))

Assertion added to data base.

;;; Query input:
(assert! (id (Bitdiddle Ben) 11))

Assertion added to data base.

;;; Query input:
(assert! (id (Hacker Alyssa P) 12))

Assertion added to data base.

;;; Query input:
(assert! (id (Fect Cy D) 13))

Assertion added to data base.

;;; Query input:
(assert! (id (Tweakit Lem E) 14))

Assertion added to data base.

;;; Query input:
(assert! (id (Reasoner Louis) 15))

Assertion added to data base.

;;; Query input:
(assert! (id (Scrooge Eben) 21))

Assertion added to data base.

;;; Query input:
(assert! (id (Cratchet Robert) 22))

Assertion added to data base.

;;; Query input:
(assert! (rule (lives-near ?person-1 ?person-2)
	       (and (address ?person-1 (?town . ?rest-1))
		    (address ?person-2 (?town . ?rest-2))
		    (not (same ?person-1 ?person-2)))))

Assertion added to data base.

;;; Query input:
(lives-near ?person (Hacker Alyssa P))

;;; Query results:
(lives-near (fect cy d) (hacker alyssa p))
(lives-near (fect cy d) (hacker alyssa p))

;;; Query input:
(and (lives-near ?person-1 ?person-2)
     (id ?person-1 ?id-1)
     (id ?person-2 ?id-2)
     (lisp-value > ?id-1 ?id-2))

;;; Query results:
(and (lives-near (reasoner louis) (aull dewitt))
     (id (reasoner louis) 15)
     (id (aull dewitt) 2)
     (lisp-value > 15 2))

(and (lives-near (reasoner louis) (aull dewitt))
     (id (reasoner louis) 15)
     (id (aull dewitt) 2)
     (lisp-value > 15 2))

(and (lives-near (reasoner louis) (bitdiddle ben))
     (id (reasoner louis) 15)
     (id (bitdiddle ben) 11) 
     (lisp-value > 15 11))

(and (lives-near (reasoner louis) (bitdiddle ben))
     (id (reasoner louis) 15)
     (id (bitdiddle ben) 11)
     (lisp-value > 15 11))

(and (lives-near (fect cy d) (hacker alyssa p))
     (id (fect cy d) 13)
     (id (hacker alyssa p) 12)
     (lisp-value > 13 12))

(and (lives-near (fect cy d) (hacker alyssa p))
     (id (fect cy d) 13)
     (id (hacker alyssa p) 12)
     (lisp-value > 13 12))

(and (lives-near (bitdiddle ben) (aull dewitt))
     (id (bitdiddle ben) 11)
     (id (aull dewitt) 2)
     (lisp-value > 11 2))

(and (lives-near (bitdiddle ben) (aull dewitt))
     (id (bitdiddle ben) 11)
     (id (aull dewitt) 2)
     (lisp-value > 11 2))

;;; Query input:
