;; HtDD Design Quiz

;; Age is Natural
;; interp. the age of a person in years
(define A0 18)
(define A1 25)

#;
(define (fn-for-age a)
  (... a))

;; Template rules used:
;; - atomic non-distinct: Natural


; Problem 1:
; 
; Consider the above data definition for the age of a person.
; 
; Design a function called teenager? that determines whether a person
; of a particular age is a teenager (i.e., between the ages of 13 and 19).

;;Natrual -> Boolean
;; purpose: knowing if the particular age is teenager, i.e. between 13 and 19

;;Examples
(check-expect (teenager? 13) true)  ; the strating point
(check-expect (teenager? 19) true)  ; the end point
(check-expect (teenager? 15) true)  ; the middle point
(check-expect (teenager? 11) false) ; too small to being a teenager
(check-expect (teenager? 20) false) ; too big to being a tennager

;stub
;(define (teenager? t) false)

;; the template used from Age
(define (teenager? a)
  (and (<= a 19) (>= a 13))
       )


; Problem 2:
; 
; Design a data definition called MonthAge to represent a person's age
; in months.

;; MonthAge is Natural
;; interp. this take a person age in months, like 100 months

;; Examples
(define MA1 1000)
(define MA2 2000)

#;
(define (fn-for-month-age a)
  (... a)
  )

;; Template Rules Used:
;; - atomic non distinct

; Problem 3:
; 
; Design a function called months-old that takes a person's age in years 
; and yields that person's age in months.
; 


;; Number->Number
;; purpose: produce the age of a person in months

;examples
(check-expect (months-old 1) 12)

(check-expect (months-old 2) (* 2 12))

;stub
;(define (months-old m) 0)

; Template used from MonthAge

(define (months-old a)
  (* a 12)
  )

; Problem 4:
; 
; Consider a video game where you need to represent the health of your
; character. The only thing that matters about their health is:
; 
;   - if they are dead (which is shockingly poor health)
;   - if they are alive then they can have 0 or more extra lives
; 
; Design a data definition called Health to represent the health of your
; character.
; 
; Design a function called increase-health that allows you to increase the
; lives of a character.  The function should only increase the lives
; of the character if the character is not dead, otherwise the character
; remains dead.

;;The Data definition

;; Health is one of:
;; - Natural
;; - false

;; interp: the false define the case where the charachter is dead, the natural present the lives of charachter

;; the examples are redendunt
(define H1 false); the dead case
(define H2 1)    ; he is alive
(define H3 100)  ; he is alive


#;
(define (fn-for-health h)
  (cond [(and (number? h)
              (>= h 1))
              (... h)]
         [(false? h)])) 


;; Template Rules Used:
;;  - one of: 2 cases
;;  - atomic non-distinct: Natural
;;  - atomic distinct: false

;; ===========================================
;; The functions

;; Health -> Health
;; puropose:  allows you to increase the lives of a character. if the lives are not false

;;examples
(check-expect (increase-health 1) 2)
(check-expect (increase-health 100) 101)
(check-expect (increase-health false) 0)

;; stub
;(define (increase-health h) 1)

;Template used from Health
(define (increase-health h)
  (cond [(and (number? h)
              (>= h 1))
              (+ h 1)]
         [(false? h) 0])) 







