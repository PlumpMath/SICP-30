;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Problem_4.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 19th, 2013
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

;Value: watch-player



(test-strategy (watch-player (stop-at 16))
	       (watch-player (stop-at 15))
	       2)

;; Round 1

Opponent up card 4
Your Total 9
Hit? y

Opponent up card 4
Your Total 19
Hit? n

Opponent up card 9
Your Total 4
Hit? y

Opponent up card 9
Your Total 12
Hit? y

Opponent up card 9
Your Total 15
Hit? n


;; Round 2

Opponent up card 6
Your Total 9
Hit? y

Opponent up card 6
Your Total 11
Hit? y

Opponent up card 6
Your Total 14
Hit? y

Opponent up card 6
Your Total 15
Hit? y

;Value: 1



(test-strategy (watch-player (stop-at 16))
	       (watch-player (stop-at 15))
	       2)

;; Round 1

Opponent up card 6
Your Total 4
Hit? y

Opponent up card 6
Your Total 8
Hit? y

Opponent up card 6
Your Total 12
Hit? y

Opponent up card 6
Your Total 17
Hit? n

Opponent up card 4
Your Total 6
Hit? y

Opponent up card 4
Your Total 13
Hit? y

Opponent up card 4
Your Total 20
Hit? n


;; Round 2

Opponent up card 5
Your Total 10
Hit? y

Opponent up card 5
Your Total 15
Hit? y
;Value: 0

