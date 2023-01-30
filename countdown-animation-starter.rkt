(require 2htdp/image)
(require 2htdp/universe)

;; countdown-animation starter.rkt

; 
; PROBLEM:
; 
; Design an animation of a simple countdown. 
; 
; Your program should display a simple countdown, that starts at ten, and
; decreases by one each clock tick until it reaches zero, and stays there.
; 
; To make your countdown progress at a reasonable speed, you can use the 
; rate option to on-tick. If you say, for example, 
; (on-tick advance-countdown 1) then big-bang will wait 1 second between 
; calls to advance-countdown.
; 
; Remember to follow the HtDW recipe! Be sure to do a proper domain 
; analysis before starting to work on the code file.
; 
; >>> Once you are finished the simple version of the program, you can improve
; it by reseting the countdown to ten when you press the spacebar.
; 



;; A count down from 10 to 0 and stops on 0

;; =================
;; Constants:

(define Height 500)
(define Width 400)
(define CTR-y (/ Height 2))
(define CTR-x (/ Width 2))
(define MTS (empty-scene Width Height))

;; =================
;; Data definitions:

;; Countdown is a Natural ;:: I forget the interval[0,10]
;; interp. the countadown is a natural that decrese over time

;; examples
(define CN1 5)

;; template.
#;
(define (fn-for-count-down c)
  (... c)
  )
;; Template rules used:
;; - atomic non distinct

;; =================
;; Functions:

;; Countdown -> Countdown
;; start the world with (main 10)
;; 
(define (main c)
  (big-bang c                   ; Countdown
            (on-tick   tock 1)     ; Countdown -> Countdown
            (to-draw   render)   ; Countdown -> Image
            (on-key handle-key))) ; Countdown KeyEvent -> Countdown

;; Countdown -> Countdown
;; produce the next countdown 

;;examples
(check-expect (tock 5) 4) ; the middle
(check-expect (tock 10) 9); the starting point
(check-expect (tock 0) 0); the end
    ; the stub
;(define (tock c) 0)

;use tempalte from Countdown
(define (tock c)
  (if (> c 0)
      (- c 1)
      0)
  )

;; Countdown -> Image
;; render is a the countdown image at the approriate place on MTS
;; examples

(check-expect (render 4)(place-image (text "4" 30 "olive") CTR-x CTR-y MTS))
;; the stub
;(define (render c) (rectangle 20 30 "solid" "white"))

(define (render c)
  (place-image (text (number->string c) 30 "olive") CTR-x CTR-y MTS)
  )

 ; Countdown KeyEvent ->Countdown
;; purpose: reset countdown to 19 when the space bare is touch
;;examples
(check-expect (handle-key 10 " ") 10)
(check-expect (handle-key 10 "a") 10)
(check-expect (handle-key 0 " ") 10)
(check-expect (handle-key 0 "a") 0)
(check-expect (handle-key 5 " ") 10)

;; stub
;(define (handle-key c ke) 0)

;; use template from the site.
(define (handle-key c ke)
  (cond [(key=? ke " ") 10]
        [else c]))

