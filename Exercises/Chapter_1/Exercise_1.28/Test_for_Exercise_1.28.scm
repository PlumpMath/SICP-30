Copyright (C) 2011 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Tuesday November 8, 2011 at 10:45:46 PM
  Release 9.1.1     || Microcode 15.3 || Runtime 15.7 || SF 4.41
  LIAR/x86-64 4.118 || Edwin 3.116
;You are in an interaction window of the Edwin editor.
;Type `C-h' for help, or `C-h t' for a tutorial.
;`C-h m' will describe some commands.
;`C-h' means: hold down the Ctrl key and type `h'.
;Package: (user)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_1.28.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 7th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: expmod

;Value: nontri-sqrt?

;Value: even?

;Value: square

;Value: miller-rabin-test

;Value: fast-prime?

(fast-prime? 2 1000)
;Value: #t

(fast-prime? 3 1000)
;Value: #t

(fast-prime? 4 1000)
;Value: #f

(fast-prime? 5 1000)
;Value: #t

(fast-prime? 6 1000)
;Value: #f

(fast-prime? 7 1000)
;Value: #t

(fast-prime? 8 1000)
;Value: #f

(fast-prime? 9 1000)
;Value: #f

(fast-prime? 10 1000)
;Value: #f


;; Test for the Carmichael numbers.

(fast-prime? 561 1000)
;Value: #f

(fast-prime? 1105 1000)
;Value: #f

(fast-prime? 1729 1000)
;Value: #f

(fast-prime? 2465 1000)
;Value: #f

(fast-prime? 2821 1000)
;Value: #f

(fast-prime? 6601 1000)
;Value: #f

