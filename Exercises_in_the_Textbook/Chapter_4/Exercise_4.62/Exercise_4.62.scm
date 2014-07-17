;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.62.scm
;;                       by Lawrence X. Amlord (颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Jul 17th, 2014
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

;Loading "Campus/Engineering/EECS/SICP/allcode/ch4-query.scm"... done
;Value: microshaft-data-base

(initialize-data-base microshaft-data-base)
;Value: done

(query-driver-loop)


;;; Query input:
(assert! (rule (last-pair (?x . ()) (?x))))

Assertion added to data base.

;;; Query input:
(assert! (rule (last-pair (?u . ?v) (?x))
	       (last-pair ?v (?x))))

Assertion added to data base.

;;; Query input:
(last-pair (3) ?x)

;;; Query results:
(last-pair (3) (3))

;;; Query input:
(last-pair (1 2 3) ?x)

;;; Query results:
(last-pair (1 2 3) (3))

;;; Query input:
(last-pair (2 ?x) (3))

;;; Query results:
(last-pair (2 3) (3))

;;; Query input:
(last-pair ?x (3))

;;; Query results:
(last-pair (3) (3))

;;; Query input:
