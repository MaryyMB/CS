(require 2htdp/image)
(require 2htdp/universe)

;; Flower Animation (if you click on it it create a flower that ground)
;;(@htdw WS)
;; =================
;; Constants:

(define flowerImage .)
(define Height 400)
(define Width 500)
(define MTS (empty-scene Width Height))


;; =================
;; Data definitions:

;; ScaleFlower is compoud data
(define-struct ScaleFlower (x y scl))

;; ScaleFlower is (make-ScaleFlower Natural Natural Natural)
;; interp. x is the xth position of the flower
;;         y is the yth position of the flower
;;         scl is the scale of the given image

;examples.

(define W1 (make-ScaleFlower 10  250 10)) ;
(define W2 (make-ScaleFlower 20  270 5)) ; 

;; template:

#;
(define (fn-for-ScaleFlower c)
  (... (ScaleFlower-x c)       ;Natural
       (ScaleFlower-y c)       ;Natural
       (ScaleFlower-scl c)))   ;Natural

;; Template rules used:
;;  - compound: 3 fields


;; =================
;; Functions:


;(@signature ScaleFlower -> ScaleFlower)
;; start the world with (main (make-ScaleFlower 0  0 0.5))
;;
;;(@template htdw-main)

(define (main ws)
  (big-bang ws ; ScaleFlower
    (on-tick tock) ; ScaleFlower -> ScaleFlower
    (to-draw render) ; ScaleFlower -> Image
    (on-mouse mymouse))) ; ScaleFlower Integer Integer MouseEvent -> ScaleFlower
 
;(@htdf tock)
;(@signature ScaleFlower -> ScaleFlower)
;; produce the next flower


;; stub
;(define (tock ws) ws)


;examples
(check-expect (tock (make-ScaleFlower 20  270 5)) (make-ScaleFlower 20  270 6))
;use tempalte from ScaleFlower
(define (tock c)
  (if (< (ScaleFlower-scl c) 7)
   (make-ScaleFlower (ScaleFlower-x c)  (ScaleFlower-y c) (+ 1 (ScaleFlower-scl c)))
   (make-ScaleFlower (ScaleFlower-x c)  (ScaleFlower-y c)  (ScaleFlower-scl c))))


;(@htdf render)
;(@signature ScaleFlower -> Image)
;; render the image of a flower

;; examples
(check-expect (render (make-ScaleFlower 10  250 10)) (place-image (scale 10 flowerImage) 10 250 MTS))

;(define (render ws) MTS) ;; stub


(define (render ws)
  (place-image (scale (ScaleFlower-scl ws) flowerImage) (ScaleFlower-x ws) (ScaleFlower-y ws) MTS)
  )




;;ScaleFlower Integer Integer MouseEvent -> ScaleFlower
;; purpose: if I click on the screen the cat go to the x coordinate

;; examples
(check-expect (mymouse W1 10 20 "button-down") (make-ScaleFlower 10  20 0.5))



;stub
;(define (mymouse ws x y me) 0)

;; use the template from the website
(define (mymouse ws x y me)
  (cond [(mouse=? me "button-down") (make-ScaleFlower x  y 0.5)]
        [else ws]))
