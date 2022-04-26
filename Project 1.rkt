;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |cs proj|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

;exercise 83
; DATA DEF: takes text and renders it based on the cursor location

(define-struct editor [before after])

(define editor1 (make-editor "" "")) ; Empty string
(define editor2 (make-editor "" "computer science")) ; test case for cursor in the first letter
(define editor3 (make-editor "co" "mputer science")) ; test case for cursor at the second letter

; constant variables
(define TEXT-SIZE 12)
(define TEXT-COLOR "black")
(define LENGTH 200) 
(define HEIGHT 20)   

; empty scene parameters 
(define escene (empty-scene LENGTH HEIGHT))

; takes text input and orients it in render-text
(define (render-text txt)
  (text txt TEXT-SIZE TEXT-COLOR))

; orients the text
(define (render txt)
  (overlay/align "left" "center"
                 (beside (render-text (editor-before txt))
                         (render-text (editor-after txt)))escene))

; tests to ensure the program works 

(check-expect (render-text "")
              (text "" TEXT-SIZE TEXT-COLOR))
(check-expect (render-text "computer science")
              (text "computer science" TEXT-SIZE TEXT-COLOR))

(check-expect (render (make-editor "" ""))
              (overlay/align "left" "center"
                             (beside (render-text "")
                                     (render-text ""))escene))

(check-expect (render (make-editor "com" "puter science"))
              (overlay/align "left" "center"
                             (beside (render-text "com")
                                   (render-text "puter science"))escene))

; exercise 84
; DATA DEF: Takes a string and manipulates it based on the letters within it 

; removes the last character in the given strings
(define (REMOVE-LEFT x)
  (cond [(string=? (editor-before x) "")  x]
        [else
         (make-editor (REMOVELAST (editor-before x))
                      (editor-after x))]))

; adds a letter based on C to the right side 
(define (add-right x c)
  (make-editor (string-append (editor-before x) c) (editor-after x)))

; takes certain letters from a string 
(define (SELECT-FIRST str); takes the first letter in a string
  (if (> (string-length str) 0)
      (substring str 0 1)
      str))

(define (DROP-FIRST-LETTER str); takes all letters besides the first one in a string 
  (if (> (string-length str) 0)
      (substring str 1)
      str))

(define (SELECT-LAST str); takes the last letter in a string 
  (if (> (string-length str) 0)
      (substring str (- (string-length str) 1))
      str))

(define (REMOVELAST str); removes the last letter from a string 
  (if (> (string-length str) 0)
      (substring str 0 (sub1 (string-length str)))
      str))

; Tests to ensure the program works
(check-expect (REMOVELAST "") "")
(check-expect (REMOVELAST "a") "")
(check-expect (REMOVELAST "computer") "compute")
(check-expect (SELECT-LAST "za") "a")
(check-expect (SELECT-LAST "computer science") "e")
(check-expect (DROP-FIRST-LETTER "a") "")
(check-expect (DROP-FIRST-LETTER "computer") "omputer")
(check-expect (SELECT-FIRST "") "")
(check-expect (SELECT-FIRST "a") "a")
(check-expect (SELECT-FIRST "computer") "c")
(check-expect (REMOVE-LEFT (make-editor "com" "puter")) (make-editor "co" "puter"))
(check-expect (REMOVE-LEFT (make-editor "" "computer")) (make-editor "" "computer"))

; Exercise 85

; Renders the orientation of text to a scene (in ex:83)
(define (run x)
  (big-bang x 
            (to-draw render)  
            (on-key x)))   