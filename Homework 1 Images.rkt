;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |c.s. hw 1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; alien ship code

    ;creates shapes needed for image
(define square1(square 100 "solid" "black"))
(define circle1(circle 50 "solid" "red"))
(define rectangle3(rectangle 170 30 "solid" "red"))

    ;overlays all the images into one image
(define alienship(overlay rectangle3 circle1 square1))

    ;prints out image from the overlay variable
     alienship

; banner code

    ;creates shapes needed for image
(define rectangle1(rectangle 400 150 "solid" "darkgreen"))
(define rectangle2(rectangle 390 140 "solid" "green"))
(define name1(text "Homework" 70 "black"))

    ;overlays all the images into one image
(define namebanner (overlay name1 rectangle2 rectangle1))

    ;prints out image from the overlay variable
     namebanner

;smiley face code (used Dr.Racket helpdesk to learn image positioning)


    ;creates and positions all the shapes to make a smileyface
(place-image
   (square 30 "solid" "black")
     100 100

(place-image
   (rectangle 70 20 "solid" "black")
     100 150

(place-image
    (square 20 "solid" "black")
     56 130
(place-image
    (square 20 "solid" "black")
     144 130
      
(place-image
    (star 30 "solid" "gold")
     65 49
  
(place-image
   (circle 25 "solid" "black")
     65 50
  
(place-image
   (star 30 "solid" "gold")
     140 49
  
(place-image
   (circle 25 "solid" "black")
     140 50

   (circle 100 "solid" "yellow")))))))))


; shadow triangle code

    ;creates shapes needed for image 
(define square2(square 104 "solid" "black"))
(define triangle1(crop/align "middle" "top" 95 105 (flip-vertical(triangle/sas 70 50 95 "solid" "red"))))
(define triangle2(crop/align "middle" "bottom" 95 105 (triangle/sas 70  50 95 "solid" "white")))

    ;overlays all the images into one image
(define shadowtriangle(overlay triangle2 triangle1 square2))

    ;prints out image from the overlay variable
    shadowtriangle