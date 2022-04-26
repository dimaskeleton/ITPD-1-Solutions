;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 236

; Given function
; Lon -> Lon
; Purpose: adds 1 to each item on the list 
(define (add1* l)
  (cond
    [(empty? l) '()]
    [else
     (cons
       (add1 (first l))
       (add1* (rest l)))]))


; Given function
; Lon -> Lon
; Purpose: adds 5 to each item on the list 
(define (plus5 l)
  (cond
    [(empty? l) '()]
    [else
     (cons
       (+ (first l) 5)
       (plus5 (rest l)))]))

; Test cases for first function to add 1 to each number in a list 
(check-expect(add1* '()) '())
(check-expect(add1* '(10)) '(11))
(check-expect(add1* '(5 10 15 23)) '(6 11 16 24))

; Test cases for the second function to add 5 to each number in a list 
(check-expect(plus5 '()) '())
(check-expect(plus5 '(5)) '(10))
(check-expect(plus5 '(5 10 15 23)) '(10 15 20 28))

; Lon -> Lon
; Takes input from a list of numbers and subtracts 2 from each number on a list 
(define (sub2 l)
  (cond
    [(empty? l) '()]
    [else
     (cons
       (- (first l) 2)
       (sub2 (rest l)))]))

; Test cases for the function sub2 which subtracts 2 from each number in a list 
(check-expect(sub2 '()) '())
(check-expect(sub2 '(2)) '(0))
(check-expect(sub2 '(5 10 15 79)) '(3 8 13 77))

; Exercise 241

; Data Definition: NEList-of-temperatures can either be a list containing values or an empty list example:
   ; (cons ListofTemps '())
   ; (cons ListofTemps '(NEList-of-temperatures))

; Data Definition: NEList-of-Booleans can be either true or false when the list is empty or can be true or false
; when the list is containing values so there are 4 possible cases for this and the examples are:
   ; (cons NEList-of-Booleans '() #true)
   ; (cons NEList-of-Booleans '() #false)
   ; (cons NEList-of-Booleans '(list containing values) #true)
   ; (cons NEList-of-Booleans '(list containing values) #false)

; Data Definition: Abstract definition for NEList-of can be a list of whatever value is given
   ; (cons NEList-of '())
   ; (cons NEList-of '(given values))


; Exercise 251

; Data Definition: 
; takes a list and if its empty it appends to the value y and if the list contains values it will append to the value x
(define(fold1 x y l)
  (cond
   [(empty? l) y]
   [else (x(first l)
            (fold1 x y(rest l)))]))

; takes the list values from the fold1 function and adds all the values in the list together 
(define (fold1add l)
(fold1 + 0 l))

; takes the list values from the fold1 function and multiplies all the values in the list together by 2
(define (fold1mult l)
  (fold1 * 2 l))

; Test cases for fold1add which adds all the values in the list into 1 number 
(check-expect(fold1add '()) 0)
(check-expect(fold1add '(1 2)) 3)
(check-expect(fold1add '(1 2 5 10)) 18)

; Test cases for fold1mult which multiplies all the values in the list into 1 number 
(check-expect(fold1mult '(0)) 0)
(check-expect(fold1mult '(1 2)) 4)
(check-expect(fold1mult '(1 2 5 10)) 200)

; Exercise 252

; Data Definition:
; similar to before this function takes a list and if its empty it appends to the value y and if the list contains
; values it will append to the value x based on whats given and would work for figure 94 (from the textbook) 
(define (fold2 x y l)
  (cond
   [(empty? l) y]
   [else (x(first l)
            (fold2 x y (rest l)))]))
