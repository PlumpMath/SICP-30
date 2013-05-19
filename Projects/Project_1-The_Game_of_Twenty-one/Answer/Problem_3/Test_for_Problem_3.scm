;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Problem_3.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 19th, 2013
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

(define (stop-at n)
  (lambda (my-hand opponent-up-card)  ; return a strategy procedure
    (if (< (hand-total my-hand) n)
	#t  ; total hand less than the argument to stop-at, ask for a new card
	#f)))

;Value: twenty-one

;Value: play-hand

;Value: deal

;Value: make-new-hand

;Value: make-hand

;Value: hand-up-card

;Value: hand-total

;Value: hand-add-card

;Value: hit?

;Value: user-wants-hit?

;Value: stop-at


;; Test for the recursive version
;Value: test-strategy

(test-strategy (stop-at 16) (stop-at 15) 10)
;Value: 4

(test-strategy (stop-at 16) (stop-at 15) 10)
;Value: 6

(test-strategy (stop-at 16) (stop-at 15) 10)
;Value: 5

(test-strategy (stop-at 16) (stop-at 15) 10)
;Value: 3

(test-strategy (stop-at 16) (stop-at 15) 10)
;Value: 4

(test-strategy (stop-at 16) (stop-at 15) 10)
;Value: 3


;; Test for the iterative version
;Value: test-strategy

(test-strategy (stop-at 16) (stop-at 15) 10)
;Value: 7

(test-strategy (stop-at 16) (stop-at 15) 10)
;Value: 5

(test-strategy (stop-at 16) (stop-at 15) 10)
;Value: 3

(test-strategy (stop-at 16) (stop-at 15) 10)
;Value: 5

(test-strategy (stop-at 16) (stop-at 15) 10)
;Value: 7

(test-strategy (stop-at 16) (stop-at 15) 10)
;Value: 6

