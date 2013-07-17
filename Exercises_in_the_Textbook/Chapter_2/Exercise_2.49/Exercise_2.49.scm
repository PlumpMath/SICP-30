;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.49.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 16th, 2013
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


;; a. The painter that draws the outline of the designated frame.

(define (outline frame)
  (let ((origin (make-vect 0 0))
	(top-left (make-vect 0 1))
	(opposite (make-vect 1 1))
	(bottom-right (make-vect 1 0)))
    (let ((bottom-horiz (make-segment origin bottom-right))
	  (right-vert (make-segment bottom-right opposite))
	  (top-horiz (make-segment opposite top-left))
	  (left-vert (make-segment top-left origin)))
      (let ((outline-segment-list (list bottom-right right-vert top-horiz left-vert)))
	(segments->painter outline-segment-list)))))


;; b. The painter that draws an "X" by connecting opposite corner of the frame.

(define (X frame)
  (let ((origin (make-vect 0 0))
	(top-left (make-vect 0 1))
	(opposite (make-vect 1 1))
	(bottom-right (make-vect 1 0)))
    (let ((diagnal (make-segment top-left bottom-right))
	  (counter-diagnal (make-segment opposite origin)))
      (let ((X-segment-list (list diagnal counter-diagnal)))
	(segments->painter X-segment-list)))))


;; c. The painter that draws a diamond shape by connecting the midpoints of the
;; sides of the frame.

(define (diamond frame)
  (let ((origin (make-vect 0 0))
	(top-left (make-vect 0 1))
	(opposite (make-vect 1 1))
	(bottom-right (make-vect 1 0)))
    (let ((top (midpoint-vect top-left opposite))
	  (bottom (midpoint-vect origin bottom-right))
	  (left (midpoint-vect origin top-left))
	  (right (midpoint-vect bottom-right opposite)))
      (let ((s1 (make-segment bottom left))
	    (s2 (make-segment left top))
	    (s3 (make-segment top right))
	    (s4 (make-segment right bottom)))
	(let ((diamond-segment-list (list s1 s2 s3 s4)))
	  (segments->painter diamond-segment-list))))))


;; d. The wave painter.

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
	(p22 (make-vect 0 0.65)))
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
	  (s17 (make-segment p21 p22)))
      (let ((wave-segment-list (list s1 s2 s3 s4 s5 s6 s7 s8 s9 s10
				     s11 s12 s13 s14 s15 s16 s17)))
	(segments->painter wave-segment-list)))))




