; Question 1
; 
; Write a function, (count-primes low high), that takes as input an interval and returns the number of 
; prime numbers in the interval.
; eg., (count-primes 1 10) 5)

;prime?: num -> boolean
;purpose: to determine if the input number is prime
(define (prime? x)
  (local [(define y (floor (sqrt x)))
          ;prime-helper: num -> boolean
          ;Purpose: determine if the number is prime
          (define (prime-helper y)
            (cond [(= y 1) true]
                  [(= (remainder x y) 0) false]
                  [else (prime-helper (sub1 y))]))
          ]
    (prime-helper y)))

;Variabele to test when the interval is empty
(define (empty-intv? low high)
  (> low high))

;count primes takes 2 numbers as an interval and passes it through the prime? function to count the amount of prime numbers
(define (count-primes low high)
  (cond [(empty-intv? low high) 0]
        [(prime? low) (+ 1 (count-primes (add1 low) high))]
        [else (count-primes (add1 low) high)]))


(check-expect (count-primes 1 10) 5)

; Question 2
; 
; a) Write a function "TakePricelist" to obtain the price list (lon), and a natural number n (TakePricelist lon n).
;    This function should produce first "n" items from the "lon" or all of lon if it is smaller than "n".
;    (e.g., (TakePricelist (list 0 1 2 3 4 5 6) 4) (list 0 1 2 3))
; 
; b) Write a function "PriceDROP" to obtain the price list lon, and a natural number "n" (PriceDROP lon n).
;    This function should remove first n items from the list or '() if the lon is smaller than n.
;    (eg., (PriceDROP (list 0 1 2 5 6 7) 3) (list 5 6 7))


;Data Definition: To take a list and return a value below a certain number to indicate a price list
;Append-map function uses the map function and takes in the lon and n, its then used in the following functions for pricelist and pricedrop
;Purpose: to manipulate a list with a function that is later defined
(define (append-map lon n)
  (apply append (map lon n)))

;takepricelist takes a given list and returns the list with values that are lower than a given number using lambda and the append-map function
;Purpose: to return a list with numbers lower than a certain value 
(define (takepricelist lon n)
  (append-map (lambda (x)
                (if (<= x n)(list x)empty))lon))

;PriceDROP takes a given list and returns the list with values that are greater than a given number with help of the lambda and the append-map function
;Purpose: to return a list with numbers greater than a certain value
(define (PriceDROP lon n)
  (append-map (lambda (x)
                (if (<= n x)(list x)empty))lon))

(check-expect(takepricelist(list 0 1 2 3 4 5 6)3)(list 0 1 2 3))
(check-expect(PriceDROP(list 0 1 2 5 6 7) 3)(list 5 6 7))

; Question 3
; 
; Write a function "grade-merge",takes two lists- 1) with the points from term 1 and 2) with the points from
; term 2 (grade-merge lon1 lon2)each sorted in non-decreasing order, and that returns a list of grades sorted
; in non-decreasing order that contains the elements of term1(lon1) and term2(lon2).
; eg., (grade-merge (list 81 72 64) (list 83 75 66)) (list 64 66 72 75 81 83))


; merge: los los -> los
; Purpose: to merge two sorted lists of integers
; grades1 and grades2 are the lists that I will combine then sort
(define grades1 (list 81 72 64))
(define grades2 (list 83 75 66))

;grade-merge adds both lists together and the sort call right after it sorts the list from least to greatest 
(define grade-merge (append grades1 grades2))     
(sort grade-merge <)

; Not Completed 
