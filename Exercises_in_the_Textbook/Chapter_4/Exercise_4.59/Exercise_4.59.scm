;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.29.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Mar 25th, 2014
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

(load "/Users/Lawrence/Documents/CSAIL/SICP_Journey/Exercises_in_the_Textbook/Chapter_4/Exercise_4.59/ch4-query.scm")

;Loading "Documents/CSAIL/SICP_Journey/Exercises_in_the_Textbook/Chapter_4/Exercise_4.59/ch4-query.scm"... done
;Value: microshaft-data-base

(initialize-data-base microshaft-data-base)
;Value: done

(query-driver-loop)


;;; Query input:
(assert! (rule (same ?x ?x)))

Assertion added to data base.

;;; Query input:
(assert! (meeting accounting (Monday 9am)))

Assertion added to data base.

;;; Query input:
(assert! (meeting administration (Monday 10am)))

Assertion added to data base.

;;; Query input:
(assert! (meeting computer (Wednesday 3pm)))

Assertion added to data base.

;;; Query input:
(assert! (meeting administration (Friday 1pm)))

Assertion added to data base.

;;; Query input:
(assert! (meeting whole-company (Wednesday 4pm)))

Assertion added to data base.


;;; Part a.
;;; Query input:
(meeting ?division (Friday ?time))

;;; Query results:
(meeting administration (friday 1pm))


;;; Part b.
;;; Query input:
(assert! (rule (meeting-time ?person ?day-and-time)
	       (or (meeting whole-company ?day-and-time)
		   (and (job ?person (?division . ?position))
			(meeting ?division ?day-and-time)))))

Assertion added to data base.


;;; Part c.
;;; Query input:
(meeting-time (Hacker Alyssa P) (Wednesday ?time))

;;; Query results:
(meeting-time (hacker alyssa p) (wednesday 4pm))
(meeting-time (hacker alyssa p) (wednesday 3pm))

;;; Query input:
