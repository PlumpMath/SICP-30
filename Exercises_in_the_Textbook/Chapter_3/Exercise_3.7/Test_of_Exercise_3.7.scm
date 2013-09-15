;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_3.7.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 15th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-joint

;Value: make-account

(define peter-acc (make-account 100 'secret-password))
;Value: peter-acc

((peter-acc 'secret-password 'withdraw) 40)
;Value: 60

((peter-acc 'secret-password 'deposit) 100)
;Value: 160

((peter-acc 'some-other-password 'deposit) 100)
;Value 19: "Incorrect password"

(define paul-acc
  (make-joint peter-acc 'secret-password 'private-password))
;Value: paul-acc

((paul-acc 'private-password 'deposit) 100)
;Value: 260

((paul-acc 'some-other-password 'withdraw) 20)
;Value 20: "Incorrect password"

(define tom-acc
  (make-joint peter-acc 'peter-my-dear 'tom-like-cakes))
;Value: tom-acc

((tom-acc 'tom-like-cakes 'withdraw) 30)
;Value 19: "Incorrect password"

