;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_3.4.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 12th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-account

;Value: make-monitored

(define acc (make-account 100 'secret-password))
;Value: acc

((acc 'secret-password 'withdraw) 40)
;Value: 60

((acc 'secret-password 'deposit) 60)
;Value: 120

((acc 'secret-password 'deposit) 120)
;Value: 240

((acc 'some-other-password 'withdraw) 40)
;Value 23: "Incorrect password"

((acc 'secret-password 'deposit) 120)
;Value: 360

((acc 'open_the_account 'withdraw) 5)
;Value 23: "Incorrect password"

((acc 'unlocked_the_account 'withdraw) 5)
;Value 23: "Incorrect password"

((acc '123456 'withdraw) 5)
;Value 23: "Incorrect password"

((acc '12345678 'withdraw) 5)
;Value 23: "Incorrect password"

((acc 'I_am_Levis 'withdraw) 5)
;Value 23: "Incorrect password"

((acc 'Livis_account_open 'withdraw) 5)
;Value 23: "Incorrect password"

((acc 'This_is_Levis@1984 'withdraw) 5)
;Value 23: "Incorrect password"

((acc 'This_is_Levis@2013 'withdraw) 5)
;Value 24: "The account you're trying to access has been locked!"

((acc 'I_am_Levis@2013 'withdraw) 5)
;Value 24: "The account you're trying to access has been locked!"

