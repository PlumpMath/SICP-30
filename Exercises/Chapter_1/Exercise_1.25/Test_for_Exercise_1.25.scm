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

;;                       Test_for_Exercise_1.25.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 5th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;Value: search-for-primes

;Value: even?

;Value: timed-prime-test

;Value: start-prime-test

;Value: report-prime

;Value: fast-prime?

;Value: fermat-test

;Value: expmod

;Value: fast-expt

;Value: square

(search-for-primes 1000 1019)

1001
1003
1005
1007
1009 *** 6.0000000000002274e-2
1011
1013 *** .04999999999999716
1015
1017
1019 *** 6.0000000000002274e-2
Finished in searching for prime numbers.
;Unspecified return value

(search-for-primes 10000 10037)

10001
10003
10005
10007 *** 4.670000000000002
10009 *** 4.609999999999999
10011
10013
10015
10017
10019
10021
10023
10025
10027
10029
10031
10033
10035
10037 *** 4.650000000000006
Finished in searching for prime numbers.
;Unspecified return value

(search-for-primes 100000 100043)

100001
100003 *** 744.45
100005
100007
100009
100011
100013
100015
100017
100019 *** 746.82
100021
100023
100025
100027
100029
100031
100033
100035
100037
100039
100041
100043 *** 739.0699999999999
Finished in searching for prime numbers.
;Unspecified return value

