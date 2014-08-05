;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.52.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 17th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
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


;; a. Add a smile to the primitive wave painter

(define (wave frame)
  (let ((p1 (make-vect 0 0.85))
	(p2 (make-vect 0.15 0.6))
	(p3 (make-vect 0.3 0.65))
	(p4 (make-vect 0.4 0.65))
	(p5 (make-vect 0.35 0.85))
	(p6 (make-vect 0.4 1.0))
	(p7 (make-vect 0.6 1.0))
	(p8 (make-vect 0.65 0.85))
	(p9 (make-vect 0.6 0.65))
	(p10 (make-vect 0.75 0.65))
	(p11 (make-vect 1.0 0.35))
	(p12 (make-vect 1.0 0.15))
	(p13 (make-vect 0.6 0.45))
	(p14 (make-vect 0.75 0))
	(p15 (make-vect 0.6 0))
	(p16 (make-vect 0.5 0.3))
	(p17 (make-vect 0.4 0))
	(p18 (make-vect 0.25 0))
	(p19 (make-vect 0.35 0.5))
	(p20 (make-vect 0.3 0.6))
	(p21 (make-vect 0.15 0.4))
	(p22 (make-vect 0 0.65))
	(p23 (make-vect 2.15 3.85))
	(p24 (make-vect 2.30 3.65))
	(p25 (make-vect 2.60 3.65))
	(p26 (make-vect 2.75 3.85)))
    (let ((s1 (make-segment p1 p2))
	  (s2 (make-segment p2 p3))
	  (s3 (make-segment p3 p4))
	  (s4 (make-segment p4 p5))
	  (s5 (make-segment p5 p6))
	  (s6 (make-segment p7 p8))
	  (s7 (make-segment p8 p9))
	  (s8 (make-segment p9 p10))
	  (s9 (make-segment p10 p11))
	  (s10 (make-segment p12 p13))
	  (s11 (make-segment p13 p14))
	  (s12 (make-segment p15 p16))
	  (s13 (make-segment p16 p17))
	  (s14 (make-segment p18 p19))
	  (s15 (make-segment p19 p20))
	  (s16 (make-segment p20 p21))
	  (s17 (make-segment p21 p22))
	  (s18 (make-segment p23 p24))
	  (s19 (make-segment p24 p25))
	  (s20 (make-segment p25 p26)))
      (let ((wave-segment-list (list s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11
				     s12 s13 s14 s15 s16 s17 s18 s19 s20)))
	(segments->painter wave-segment-list)))))


;; b. Change the pattern constructed by corner-split by using only one copy of
;; the up-split and right-split images instead of two.

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
	    (right (right-split painter (- n 1))))
	(let ((top-left up)
	      (bottom-right right)
	      (corner (corner-split painter (- n 1))))
	  (beside (below painter top-left)
		  (below bottom-right corner))))))


;; c. Modify the version of square-limit to make big Mr. Rogers look outward
;; from each corner of the square.

(define (square-limit painter n)
  (let ((combine4 (square-of-four identity flip-horiz
				  flip-vert rotate180)))
    (combine4 (corner-split painter n))))
