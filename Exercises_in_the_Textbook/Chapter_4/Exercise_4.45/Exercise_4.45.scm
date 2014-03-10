;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.45.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Mar 10th, 2014
;;                       Xi'an, China

;; Copyright (C) 2014 Lawrence X. Amlord(颜世敏, aka 颜序)
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

(load "/Users/Lawrence/Documents/CSAIL/SICP_Journey/Exercises_in_the_Textbook/Chapter_4/Exercise_4.45/ch4-ambeval.scm")
;Loading "Documents/CSAIL/SICP_Journey/Exercises_in_the_Textbook/Chapter_4/Exercise_4.45/ch4-ambeval.scm"...
;  Loading "Documents/CSAIL/SICP_Journey/Exercises_in_the_Textbook/Chapter_4/Exercise_4.45/ch4-mceval.scm"... done
;... done
;Value: amb-evaluator-loaded

(define the-global-environment (setup-environment))
;Value: the-global-environment

(driver-loop)


;;; Amb-Eval input:
(define (require p)
  (if (not p) (amb)))

;;; Amb-Eval input:
(define nouns '(nouns student professor cat class))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define verbs '(verb studies lectures eats sleeps))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define articles '(article the a))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (parse-word word-list)
  (require (not (null? *unparsed*)))
  (require (memq (car *unparsed*) (cdr word-list)))
  (let ((found-word (car *unparsed*)))
    (set! *unparsed* (cdr *unparsed*))
    (list (car word-list) found-word)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define *unparsed* '())

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (parse input)
  (set! *unparsed* input)
  (let ((sent (parse-sentence)))
    (require (null? *unparsed*))
    sent))
;;; Amb-Eval input:
(define prepositions '(prep for to in by with))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (parse-prepositional-phrase)
  (list 'prep-phrase
	(parse-word prepositions)
	(parse-noun-phrase)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (parse-sentence)
  (list 'sentence
	(parse-noun-phrase)
	(parse-verb-phrase)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (parse-verb-phrase)
  (define (maybe-extend verb-phrase)
    (amb verb-phrase
	 (maybe-extend (list 'verb-phrase
			     verb-phrase
			     (parse-prepositional-phrase)))))
  (maybe-extend (parse-word verbs)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (parse-simple-noun-phrase)
  (list 'simple-noun-phrase
	(parse-word articles)
	(parse-word nouns)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (parse-noun-phrase)
  (define (maybe-extend noun-phrase)
    (amb noun-phrase
	 (maybe-extend (list 'noun-phrase
			     noun-phrase
			     (parse-prepositional-phrase)))))
  (maybe-extend (parse-simple-noun-phrase)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(parse '(the professor lectures to the student in the class with the cat))

;;; Starting a new problem 
;;; Amb-Eval value:
(sentence
 (simple-noun-phrase (article the) (nouns professor))
 (verb-phrase
  (verb-phrase
   (verb-phrase
    (verb lectures)
    (prep-phrase (prep to)
		 (simple-noun-phrase
		  (article the) (nouns student))))
   (prep-phrase (prep in)
		(simple-noun-phrase
		 (article the) (nouns class))))
  (prep-phrase (prep with)
	       (simple-noun-phrase
		(article the) (nouns cat)))))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(sentence
 (simple-noun-phrase (article the) (nouns professor))
 (verb-phrase
  (verb-phrase
   (verb lectures)
   (prep-phrase (prep to)
		(simple-noun-phrase
		 (article the) (nouns student))))
  (prep-phrase (prep in)
	       (noun-phrase
		(simple-noun-phrase
		 (article the) (nouns class))
		(prep-phrase (prep with)
			     (simple-noun-phrase
			      (article the) (nouns cat)))))))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(sentence
 (simple-noun-phrase (article the) (nouns professor))
 (verb-phrase
  (verb-phrase
   (verb lectures)
   (prep-phrase (prep to)
		(noun-phrase
		 (simple-noun-phrase
		  (article the) (nouns student))
		 (prep-phrase (prep in)
			      (simple-noun-phrase
			       (article the) (nouns class))))))
  (prep-phrase (prep with)
	       (simple-noun-phrase
		(article the) (nouns cat)))))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(sentence
 (simple-noun-phrase (article the) (nouns professor))
 (verb-phrase
  (verb lectures)
  (prep-phrase (prep to)
	       (noun-phrase
		(noun-phrase
		 (simple-noun-phrase
		  (article the) (nouns student))
		 (prep-phrase (prep in)
			      (simple-noun-phrase
			       (article the) (nouns class))))
		(prep-phrase (prep with)
			     (simple-noun-phrase
			      (article the) (nouns cat)))))))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(sentence
 (simple-noun-phrase (article the) (nouns professor))
 (verb-phrase
  (verb lectures)
  (prep-phrase (prep to)
	       (noun-phrase
		(simple-noun-phrase
		 (article the) (nouns student))
		(prep-phrase (prep in)
			     (noun-phrase
			      (simple-noun-phrase
			       (article the) (nouns class))
			      (prep-phrase (prep with)
					   (simple-noun-phrase
					    (article the) (nouns cat)))))))))

;;; Amb-Eval input:
try-again

;;; There are no more values of
(parse (quote (the professor lectures to the student in the class with the cat)))

;;; Amb-Eval input:
;Quit!
