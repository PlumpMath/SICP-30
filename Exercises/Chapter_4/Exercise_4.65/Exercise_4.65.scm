;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.65.scm
;;                       by Lawrence X. Amlord (颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Jul 22nd, 2014
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
(assert! (rule (wheel ?person)
	       (and (supervisor ?middle-manager ?person)
		    (supervisor ?x ?middle-manager))))

Assertion added to data base.

;;; Query input:
(wheel ?who)

;;; Query results:
(wheel (warbucks oliver))
(wheel (warbucks oliver))
(wheel (warbucks oliver))
(wheel (warbucks oliver))
(wheel (bitdiddle ben))
(wheel (bitdiddle ben))
(wheel (warbucks oliver))
(wheel (warbucks oliver))
(wheel (warbucks oliver))
(wheel (warbucks oliver))

;;; Query input:
(and (supervisor ?middle-manager ?person)
     (supervisor ?x ?middle-manager))

;;; Query results:
(and (supervisor (scrooge eben) (warbucks oliver))
     (supervisor (cratchet robert) (scrooge eben)))

(and (supervisor (bitdiddle ben) (warbucks oliver))
     (supervisor (tweakit lem e) (bitdiddle ben)))

(and (supervisor (hacker alyssa p) (bitdiddle ben))
     (supervisor (reasoner louis) (hacker alyssa p)))

(and (supervisor (bitdiddle ben) (warbucks oliver))
     (supervisor (fect cy d) (bitdiddle ben)))

(and (supervisor (bitdiddle ben) (warbucks oliver))
     (supervisor (hacker alyssa p) (bitdiddle ben)))

;;; Query input:
;Quit!
