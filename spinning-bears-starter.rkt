;; spinning-bears-starter.rkt

(require 2htdp/image)
(require 2htdp/universe)

; PROBLEM:
; 
; In this problem you will design another world program. In this program the changing 
; information will be more complex - your type definitions will involve arbitrary 
; sized data as well as the reference rule and compound data. But by doing your 
; design in two phases you will be able to manage this complexity. As a whole, this problem 
; will represent an excellent summary of the material covered so far in the course, and world 
; programs in particular.
; 
; This world is about spinning bears. The world will start with an empty screen. Clicking
; anywhere on the screen will cause a bear to appear at that spot. The bear starts out upright,
; but then rotates counterclockwise at a constant speed. Each time the mouse is clicked on the 
; screen, a new upright bear appears and starts spinning.
; 
; So each bear has its own x and y position, as well as its angle of rotation. And there are an
; arbitrary amount of bears.
; 
; To start, design a world that has only one spinning bear. Initially, the world will start
; with one bear spinning in the center at the screen. Clicking the mouse at a spot on the
; world will replace the old bear with a new bear at the new spot. You can do this part 
; with only material up through compound. 
; 
; Once this is working you should expand the program to include an arbitrary number of bears.
; 
; Here is an image of a bear for you to use: .



;; Bear Animation (if you click on it it create a flower that ground)
;;(@htdw WS)
;; =================
;; Constants:

(define BearImage .)
(define Height 400)
(define Width 500)
(define MTS (empty-scene Width Height))
(define Angulanr-Speed 2)

;; =================
;; Data definitions:

;; BearRotation is compoud data
(define-struct BearRotation (x y a))

;; ScaleFlower is (make-ScaleFlower Natural Natural)
;; interp. x is the xth position of the flower
;;         y is the yth position of the flower
;;         a is the angle of rotation

;examples.

(define B1 (make-BearRotation 10  250 2)) ;
(define B2 (make-BearRotation 20  270 5)) ; 

;; template:

#;
(define (fn-for-BearRotation b)
  (... (BearRotation-x b)       ;Natural
       (BearRotation-y b)       ;Natural
       (BearRotation-a b)       ;Natural
       ))
;; Template rules used:
;;  - compound: 3 fields
;;  - atomic non distinct (BearRotation-x b) is natural
;;  - atomic non distinct (BearRotation-y b) is natural
 ;;  - atomic non distinct (BearRotation-a b) is natural

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ListOfBear is one of :
;; - empty
;;  - (cons BearRotation ListOfBear)
;; interp. is a list of BearRotation

; examples
(define Scene1 empty)
(define Scene2 (cons B1 (cons B2  empty )))


#;
(define (fn-for-lob lob) 
  (cond [(empty? lob) (...)]
        [else
         (... (first lob)
              (fn-for-lob (rest lob)))]))

;; Template rules used: 
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons   BearRotation ListOfBear)
;; - reference: (first lob) is BearRotation
;; - self-reference: (rest lob) is ListOfBear

;; =================
;; Functions:


;(@signature ListOfBear -> ListOfBear)
;; start the world with (main (cons (make-BearRotation (/ Height 2)  (/ Width 2) 0) empty))
;;
;;(@template htdw-main)

(define (main ws)
  (big-bang ws ; ListOfBear
    (on-tick tock) ; ListOfBear -> ListOfBear
    (to-draw render) ; ListOfBear -> Image
    (on-mouse mymouse))) ; ListOfBear Integer Integer MouseEvent -> ListOfBear
 
;(@htdf tock)
;(@signature ListOfBear -> ListOfBear)
;; produce the next list of bears #non bien exprimé


;; stub
;(define (tock ws) ws)


;examples
(check-expect (tock empty) empty)
(check-expect (tock (cons B1 (cons B2  empty ))) (cons   (make-BearRotation 10  250 (+ Angulanr-Speed  2))
                                                      (cons   (make-BearRotation 20  270 (+ Angulanr-Speed  5))
                                                         empty )                  
                                                      ))


;use tempalte from ListOfBear
(define (tock lob) 
  (cond [(empty? lob) empty]
        [else
         (cons (addSpeed (first lob)) (tock (rest lob)))]))



;;function: addSpeed

;(@signature BearRotation -> BearRotation)
;; adding the angular speed


;; stub
;(define (addSpeed ws) ws)


;examples
(check-expect (addSpeed (make-BearRotation 20  270 2)) (make-BearRotation 20  270 (+ Angulanr-Speed  2)))


;use tempalte from BearRotation
(define (addSpeed b)
   (make-BearRotation (BearRotation-x b)  (BearRotation-y b) (+ Angulanr-Speed (BearRotation-a b)))
   )



;(@htdf render)
;(@signature ListOfBear -> Image)
;; render the image of a flower

;; examples
(check-expect (render empty)  MTS)
(check-expect (render (cons (make-BearRotation 10  250 10) empty)) (place-image (rotate 10 BearImage)  10 250 MTS))
(check-expect (render (cons (make-BearRotation 10  250 2) (cons (make-BearRotation 20  270 5)  empty )))
              (place-image (rotate 2 BearImage)  10 250
                   (place-image (rotate 5 BearImage)  20 270 MTS)))
                      
;(define (render ws) MTS) ;; stub



(define (render lob) 
  (cond [(empty? lob) MTS]
        [else
         (place-image (rotate (BearRotation-a (first lob)) BearImage) (BearRotation-x (first lob)) (BearRotation-y (first lob)) (render (rest lob))
              )]))


;;ListOfBear Integer Integer MouseEvent -> ListOfBear
;; purpose: if I click on the screen the bear go to the x y coordinate

;; examples
;;(check-expect (mymouse empty 10 20 "button-down") empty)
;;(check-expect (mymouse (cons (make-BearRotation 10 250 10) empty) 30 40 "button-down")(cons (make-BearRotation 30  40 0) empty ))



;stub
;(define (mymouse ws x y me) 0)

;; use the template from the website
#;
(define (mymouse ws x y me)
  (cond [(and (mouse=? me "button-down") (not (empty? ws))) (cons (make-BearRotation x  y 0) empty)]
        [else empty]))
#;
(define (mymouse lob x y me) 
  (cond [(empty? lob) empty]
        [else
         (if (mouse=? me "button-down")
          (cons (make-BearRotation x  y 0) (mymouse (rest lob) x y me))
           lob)]))


;; ListOfBear Integer Integer MouseEvent -> ListOfBear
;; On mouse-click, adds a bear with 0 rotation to the list at the x, y location
(check-expect (mymouse empty 5 4 "button-down") (cons (make-BearRotation 5 4 0) empty))
(check-expect (mymouse empty 5 4 "move") empty)

;(define (handle-mouse lob x y mev) empty)


;; Templated according to MouseEvent large enumeration.
(define (mymouse lob x y mev)
  (cond [(mouse=? mev "button-down") (cons (make-BearRotation x y 0) lob)]
        [else lob]))













