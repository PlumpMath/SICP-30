;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.69.scm
;;                       by Lawrence X. Amlord (颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Jul 26th, 2014
;;                       Xi'an, China

;; Copyright (C) 2014 Lawrence X. Amlord (颜世敏, aka 颜序)
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

;Loading "/Users/Lawrence/Campus/Engineering/EECS/SICP/allcode/ch4-query.scm"... done
;Value: microshaft-data-base

(initialize-data-base microshaft-data-base)
;Value: done

(query-driver-loop)


;;; Query input:
(assert! (son Adam Cain))

Assertion added to data base.

;;; Query input:
(assert! (son Cain Enoch))

Assertion added to data base.

;;; Query input:
(assert! (son Enoch Irad))

Assertion added to data base.

;;; Query input:
(assert! (son Irad Mehujael))

Assertion added to data base.

;;; Query input:
(assert! (son Mehujael Methushael))

Assertion added to data base.

;;; Query input:
(assert! (son Methushael Lamech))

Assertion added to data base.

;;; Query input:
(assert! (wife Lamech Ada))

Assertion added to data base.

;;; Query input:
(assert! (son Ada Jabal))

Assertion added to data base.

;;; Query input:
(assert! (son Ada Jubal))

Assertion added to data base.

;;; Query input:
(assert! (rule (grandson ?g ?s)
	       (and (son ?g ?f)
		    (son ?f ?s))))

Assertion added to data base.

;;; Query input:
(assert! (rule (son ?m ?s)
	       (and (wife ?m ?w)
		    (son ?w ?s))))

Assertion added to data base.

;;; Query input:
(grandson Cain ?s)

;;; Query results:
(grandson cain irad)

;;; Query input:
(son Lamech ?s)

;;; Query results:
(son lamech jubal)
(son lamech jabal)

;;; Query input:
(grandson Methushael ?s)

;;; Query results:
(grandson methushael jubal)
(grandson methushael jabal)

;;; Query input:
(assert! (rule (append-to-form () ?y ?y)))

Assertion added to data base.

;;; Query input:
(assert! (rule (append-to-form (?u . ?v) ?y (?u . ?z))
	       (append-to-form ?v ?y ?z)))

Assertion added to data base.

;;; Query input:
(assert! (rule (ends-in-grandson ?list)
	       (append-to-form ?x (grandson) ?list)))

Assertion added to data base.

;;; Query input:
(assert! (rule ((great . ?rel) ?x ?y)
	       (and (son ?x ?u)
		    (?rel ?u ?y)
		    (ends-in-grandson ?rel))))

Assertion added to data base.

;;; Query input:
(assert! (rule ((grandson) ?x ?y)
	       (grandson ?x ?y)))

Assertion added to data base.

;;; Query input:
((great grandson) ?g ?ggs)

;;; Query results:
((great grandson) mehujael jubal)
((great grandson) irad lamech)
((great grandson) mehujael jabal)
((great grandson) enoch methushael)
((great grandson) cain mehujael)
((great grandson) adam irad)

;;; Query input:
(?relationship Adam Irad)

;;; Query results:
((great grandson) adam irad)

;;; Query input:
;Quit!

