;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname SI_final_JohnieW) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
(require picturing-programs)



;;=====================================================
;;                UBCx HtC1x Final Project
;;                   Space Invaders!!
;;                       Coded by:
;;                   Johnie "5" Waddell
;;               Johnie5Waddell@outlook.com
;;                Original Submission Date:
;;                      !!/!!/!!!!
;;=====================================================



;;            <<<<<<<<< Constants >>>>>>>>>
;;=====================================================


;; ========== <Game State> Constants

(define WIDTH  600)  ;; Window Width
(define HEIGHT 800)  ;; Window Height


(define MTS (overlay (rectangle WIDTH HEIGHT "solid" "magenta")
                     (empty-scene WIDTH HEIGHT)))




;; ========== Missile Constants

(define PEWPEW (rotate 45 (ellipse 4 20 "solid" "yellow")))
(define PEWPEW-SPEED 15)
(define IMPACT-RADIUS 3)


;; Timer for Missile Rotations

(define TIMER
  (overlay PEWPEW (circle (image-width PEWPEW) "outline" "magenta")))

;; Rotation speed in degrees per second
(define PEW-SPEED-ROTATE (/ 360 60))

;; rotate-second : image -> image
;; produce image after one second rotation

(define (rotate-second image)
  (rotate (* -1 PEW-SPEED-ROTATE) image))

;; rotate1 : image -> image
;; rotates missile one degree

(define (rotate1 image) (rotate 1 image))

;; Bang Bang goes the universe!

(big-bang TIMER
          (on-tick rotate-second 1)
          (to-draw show-it))




;; ========== Ship Constants

(define SHIP (bitmap "SHIP.png"))

(define SHIP-SPEED 10)

(define SHIP-AMMO 4)




;; ========== Invader Constants

(define INVADER (bitmap "INVADER.png"))

(define INVADER-SPEED 5)

(define INVADER-AMMO 8)

(define POINTS 100)




;;         <<<<<<<<< Test and Check >>>>>>>>>
;;=====================================================

(check-expect (rotate-second TIMER)
              (rotate (* -1 PEW-SPEED-ROTATE) TIMER))      ;; Missile Timer Rotation Check

  
(check-expect (rotate1 PEWPEW) (rotate 1 PEWPEW))          ;; Missile Rotation Angle Check





;;        <<<<<<<<< Data Definitions >>>>>>>>>
;;=====================================================

;; Make-game (Listof INVADERS) (Listof PEWPEW) SHIP Natural)
;; interp. Current Game State

(define-struct game (INVADER PEWPEW SHIP s))


#;
(define (fn-for-game i)
  (... (fn-for-LOI (game-INVADER i))
       (fn-for-LOP (game-PEWPEW i))
       (fn-for-SHIP (game-SHIP i))))



;; PEWPEW , INVADER , SHIP are all location based
;; expressed as Posn
;; interp. represents the location of " "



;; ========== SHIP

;; SHIP movement is one of:
;; - RIGHT
;; - LEFT
;; interp. directional movement for player SHIP

#; (define (direction-fn d)
     (cond
       [(symbol=? d LEFT) ...]
       [(symbol=? d RIGHT) ...]))

;; ========== PEWPEW

;; PEWPEW posn
;; interp. location of PEWPEW

#;
(define (shoot PEWPEW)
     ... (posn-x PEWPEW) ...
     ... (posn-y PEWPEW) ...)



;; ========== INVADER

;; INVADER posn
;; interp. location of INVADER

#;
(define (


;; ========== <Game State>








;;            <<<<<<<<< Functions >>>>>>>>>
;;=====================================================


;; ========== <Game State>

;; Game -> Game
;; Render Game State

(define (main Game)
  (big-bang Game
            (on-tick update)       ;; Game -> Game
            (to-draw render)       ;; Game -> Image
            (on-release shoot)     ;; Keyevent -> Game
            (on-key ship-move)     ;; Keyevent -> Game
            (stop-when inv-win)))  ;; Game -> Boolean

            