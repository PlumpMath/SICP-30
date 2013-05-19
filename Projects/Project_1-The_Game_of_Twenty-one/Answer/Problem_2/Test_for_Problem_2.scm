;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Problem_2.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 19, 2013
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

(twenty-one hit? (stop-at 16))

Opponent up card 6
Your Total: 8
Hit? 

Hit? y
Opponent up card 6
Your Total: 9
Hit? 

Hit? y
Opponent up card 6
Your Total: 12
Hit? 

Hit? y
;Value: 0
;; player bursts

(twenty-one hit? (stop-at 16))

Opponent up card 3
Your Total: 7
Hit? 

Hit? y
Opponent up card 3
Your Total: 11
Hit? 

Hit? y
Opponent up card 3
Your Total: 19
Hit? 

Hit? n
;Value: 1

(twenty-one hit? (stop-at 16))

Opponent up card 3
Your Total: 7
Hit? 

Hit? y
Opponent up card 3
Your Total: 15
Hit? 

Hit? y
Opponent up card 3
Your Total: 17
Hit? 

Hit? n
;Value: 0
;; the house wins in a tie or has a total of 18, 19, 20 or 21

(twenty-one hit? (stop-at 16))

Opponent up card 9
Your Total: 6
Hit? 

Hit? y
Opponent up card 9
Your Total: 12
Hit? 

Hit? y
Opponent up card 9
Your Total: 21
Hit? 

Hit? n
;Value: 1


(twenty-one (stop-at 16) hit?)

Opponent up card 3
Your Total: 1
Hit? 

Hit? y
Opponent up card 3
Your Total: 11
Hit? 

Hit? y
Opponent up card 3
Your Total: 13
Hit? 

Hit? y
Opponent up card 3
Your Total: 18
Hit? 

Hit? n
;Value: 1

(twenty-one (stop-at 16) hit?)

Opponent up card 9
Your Total: 10
Hit? 

Hit? y
Opponent up card 9
Your Total: 12
Hit? 

Hit? y
Opponent up card 9
Your Total: 17
Hit? 

Hit? y
;Value: 1

(twenty-one (stop-at 16) hit?)

Opponent up card 8
Your Total: 1
Hit? 

Hit? y
Opponent up card 8
Your Total: 10
Hit? 

Hit? y
Opponent up card 8
Your Total: 14
Hit? 

Hit? y
Opponent up card 8
Your Total: 19
Hit? 

Hit? n
;Value: 0
;; the house wins in a tie or has a total of 20 or 21



(twenty-one (stop-at 16) (stop-at 12))
;Value: 1

(twenty-one (stop-at 16) (stop-at 12))
;Value: 1

(twenty-one (stop-at 16) (stop-at 12))
;Value: 0
;; player bursts

(twenty-one (stop-at 16) (stop-at 12))
;Value: 0
;; player bursts

(twenty-one (stop-at 16) (stop-at 12))
;Value: 1



(twenty-one (stop-at 18) (stop-at 8))
;Value: 1

(twenty-one (stop-at 18) (stop-at 8))
;Value: 0
;; player bursts


(twenty-one (stop-at 18) (stop-at 8))
;Value: 1

(twenty-one (stop-at 18) (stop-at 8))
;Value: 1


;; player always bursts 

(twenty-one (stop-at 22) (stop-at 8))
;Value: 0

(twenty-one (stop-at 22) (stop-at 4))
;Value: 0

(twenty-one (stop-at 22) (stop-at 2))
;Value: 0

(twenty-one (stop-at 22) (stop-at 1))
;Value: 0


;; house always bursts

(twenty-one (stop-at 8) (stop-at 22))
;Value: 1

(twenty-one (stop-at 6) (stop-at 22))
;Value: 1

(twenty-one (stop-at 4) (stop-at 22))
;Value: 1

(twenty-one (stop-at 2) (stop-at 22))
;Value: 1
