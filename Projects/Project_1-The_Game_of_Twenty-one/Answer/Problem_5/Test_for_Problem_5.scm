;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Problem_5.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 20th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (stop-at n)
  (lambda (my-hand opponent-up-card)  ; return a strategy procedure
    (if (< (hand-total my-hand) n)
	#t  ; total hand less than the argument to stop-at, ask for a new card
	#f)))

(define (test-strategy player-strategy house-strategy n)
  (let ((pw (twenty-one player-strategy house-strategy)))
    ; pw: the number of rounds that won by the player
    (if (< n 2)
	pw
	(+ pw (test-strategy player-strategy house-strategy (- n 1))))))

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

;Value: test-strategy

;Value: louis

(test-strategy louis (stop-at 15) 10)
;Value: 3

(test-strategy louis (stop-at 16) 10)
;Value: 5

(test-strategy louis (stop-at 17) 10)
;Value: 4

