(require 2htdp/image)
(require 2htdp/universe)

;; traffic-light-starter.rkt


; 
; PROBLEM:
; 
; Design an animation of a traffic light. 
; 
; Your program should show a traffic light that is red, then green, 
; then yellow, then red etc. For this program, your changing world 
; state data definition should be an enumeration.
; 
; Here is what your program might look like if the initial world 
; state was the red traffic light:
; .
; Next:
; .
; Next:
; .
; Next is red, and so on.
; 
; To make your lights change at a reasonable speed, you can use the 
; rate option to on-tick. If you say, for example, (on-tick next-color 1) 
; then big-bang will wait 1 second between calls to next-color.
; 
; Remember to follow the HtDW recipe! Be sure to do a proper domain 
; analysis before starting to work on the code file.
; 
; Note: If you want to design a slightly simpler version of the program,
; you can modify it to display a single circle that changes color, rather
; than three stacked circles. 
; 



;; the trafic light that changes with minitues from red to green to yello to red and so on

;; =================
;; Constants:
(define Width 500)
(define Height 700)
(define CTR-x (/ Width 2))
(define CTR-y (/ Height 2))

(define MTS (empty-scene Width Height))

;; I do not think about the constant 20 of the radius
;; I do not used the spacing between the lights
; the rectangle is constant it is the background in the solution

(define TheRectangleOfLightAll
  (overlay (above 
   (circle 20 "outline" "red")
   (circle 20 "outline" "yellow")
   (circle 20 "outline" "green"))
   (rectangle 50 150 "solid" "black"))
  )



  
(define TheRectangleOfLightRED
  (overlay (above 
   (circle 20 "solid" "red")
   (circle 20 "outline" "yellow")
   (circle 20 "outline" "green"))
   (rectangle 50 150 "solid" "black"))
  )

(define TheRectangleOfLightYellow
  (overlay (above 
   (circle 20 "outline" "red")
   (circle 20 "solid" "yellow")
   (circle 20 "outline" "green"))
   (rectangle 50 150 "solid" "black"))
  )

(define TheRectangleOfLightGreen
  (overlay (above 
   (circle 20 "outline" "red")
   (circle 20 "outline" "yellow")
   (circle 20 "solid" "green"))
   (rectangle 50 150 "solid" "black"))
  )


;; =================
;; Data definitions:

;; TrafficLight is one of:
;; - "red"
;; - "yello"
;; - "green"

; interp. the color of traffic light
;; <examples are redundant for enumerations>

;;Template:
#;
(define (fn-for-traffic-light tl)
  (cond [(string=? "red" tl) (...)]
        [(string=? "yellow" tl) (...)]
        [(string=? "green" tl) (...)]))

;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: "red"
;;  - atomic distinct: "yellow"
;;  - atomic distinct: "green"



;; =================
;; Functions:

;; TrafficLight -> TrafficLight
;; start the world with (main "red")

;; 
(define (main ws)
  (big-bang ws                   ; TrafficLight
            (on-tick   tock 1)     ; TrafficLight -> TrafficLight
            (to-draw   render))) ; TrafficLight -> Image
       
;; TrafficLight -> TrafficLight
;; produce the next traffic light, if is red then it is green, green to yello, yello to red, and so on

;; examples.
(check-expect (tock "red") "green")
(check-expect (tock "yellow") "red")
(check-expect (tock "green") "yellow")

;stub
;(define (tock t) "red")

;; use the template from TrafficLight
(define (tock tl)
  (cond [(string=? "red" tl) "green"]
        [(string=? "yellow" tl) "red"]
        [(string=? "green" tl) "yellow"]))


;; TrafficLight -> Image
;; render the color of the lights

;;examples
(check-expect (render "red")  (place-image TheRectangleOfLightRED CTR-x CTR-y MTS))
(check-expect (render "yellow") (place-image TheRectangleOfLightYellow CTR-x CTR-y MTS))
(check-expect (render "green") (place-image TheRectangleOfLightGreen CTR-x CTR-y MTS))

; the stub
;(define (render r) (place-image TheRectangleOfLightAll CTR-x CTR-y MTS))

;the template from TrafficLight:

(define (render tl)
  (cond [(string=? "red" tl) (place-image TheRectangleOfLightRED CTR-x CTR-y MTS)]
        [(string=? "yellow" tl) (place-image TheRectangleOfLightYellow CTR-x CTR-y MTS)]
        [(string=? "green" tl) (place-image TheRectangleOfLightGreen CTR-x CTR-y MTS)]))

; I used the MTS not only the background
