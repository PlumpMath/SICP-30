;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_3.3.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 12th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-account

(define acc (make-account 100 'secret-password))
;Value: acc

((acc 'secret-password 'withdraw) 40)
;Value: 60

((acc 'some-other-password 'deposit) 50)
;Value 19: "Incorrect password"

((acc 'secret-password 'deposit) 50)
;Value: 110

((acc 'some-other-password 'withdraw) 40)
;Value 19: "Incorrect password"

