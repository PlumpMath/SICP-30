;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_1.11.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Apr. 12, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   The recursive version
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   The iterative version
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (f n)
  (define (f-iter a b c count)
    (if (= count 0)
        c
        (f-iter (+ a (* 2 b) (* 3 c))
                a
                b
                (- count 1))))
  (f-iter 2 1 0 n))

