;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Red Light Green Light|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)
(require 2htdp/image)

; Constants 

(define STOPLIMIT 12)

(define SOLID-R(circle 30 'solid 'red))
(define OUTLINE-R(circle 30 'outline 'red))

(define SOLID-Y(circle 30 'solid 'yellow))
(define OUTLINE-Y(circle 30 'outline 'yellow))

(define SOLID-G(circle 30 'solid 'green))
(define OUTLINE-G(circle 30 'outline 'green))

(define Bwidth 80)
(define Bheight 220)

(define background (rectangle Bwidth Bheight 'solid 'white))

; Constants that switch with each light signal 

(define R-ON(place-image SOLID-R(/ Bwidth 2)40
                         (place-image OUTLINE-Y (/ Bwidth 2) 110 (place-image OUTLINE-G (/ Bwidth 2) 180 background))))
(define Y-ON(place-image OUTLINE-R(/ Bwidth 2)40
                         (place-image SOLID-Y (/ Bwidth 2) 110 (place-image OUTLINE-G (/ Bwidth 2) 180 background))))
(define G-ON(place-image OUTLINE-R(/ Bwidth 2)40
                         (place-image OUTLINE-Y (/ Bwidth 2) 110 (place-image SOLID-G (/ Bwidth 2) 180 background))))
; Ticks
(define-struct world(img ticks))

; Different World Types
(define INIT-WORLD(make-world R-ON 0))
(define YWORLD(make-world Y-ON 2))
(define GWORLD(make-world G-ON 1))


(define(main nm) 
  (big-bang INIT-WORLD
    (name nm)
    (on-draw draw-world)
    (on-tick update-world 1)))

(define(draw-world w)
  (world-img w))

; Condition statement to switch between traffic signals
(define(update-world w)
  (cond [(image=?(world-img w)R-ON)
         (make-world G-ON(add1(world-ticks w)))]
        [(image=?(world-img w)G-ON)
         (make-world Y-ON(add1(world-ticks w)))]
        [else(make-world R-ON(add1(world-ticks w)))]))

; Calls the condition and returns the program 
(update-world INIT-WORLD)
(update-world GWORLD)
(update-world YWORLD)


(check-expect(draw-world INIT-WORLD)R-ON)
(check-expect(draw-world YWORLD)Y-ON)
(check-expect(draw-world GWORLD)G-ON)
(check-expect(update-world INIT-WORLD)GWORLD)
(check-expect(update-world YWORLD)(make-world R-ON 3))
(check-expect(update-world GWORLD)YWORLD)

(main "run-function")
