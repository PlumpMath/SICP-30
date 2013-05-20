;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Problem_6.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 20th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;Value: both

(test-strategy louis (both (stop-at 19) hit?) 2)


Opponent up card 1
Your Total: 6

Hit? y

Opponent up card 1
Your Total: 9

Hit? y

Opponent up card 1
Your Total: 18

Hit? n

Opponent up card 9
Your Total: 6

Hit? y

Opponent up card 9
Your Total: 9

Hit? y
;Value: 0

