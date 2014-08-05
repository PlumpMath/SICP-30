;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.40.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Mar 4th, 2014
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

(define (multiple-dwelling)
  (let ((cooper (amb 2 3 4))
	(fletcher (amb 2 3 4)))
    (require (not (= (abs (- fletcher cooper)) 1)))
    (let ((miller (amb 3 4 5)))
      (require (> miller cooper))
      (let ((smith (amb 1 2 3 4 5)))
	(require (not (= (abs (- smith fletcher)) 1)))
	(let ((baker (amb 1 2 3 4)))
	  (require
	   (distinct? (list baker cooper fletcher miller simth)))
	  (list (list 'baker baker)
		(list 'cooper cooper)
		(list 'fletcher fletcher)
		(list 'miller miller)
		(list 'smith smith)))))))
