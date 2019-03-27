#lang racket

(require math/number-theory)

; generates the nth triangle number
(define (triangle-number n)
  (/ (* n (+ n 1)) 2))

;generates the first n triangle numbers
(define (triangle-numbers n)
  (map (lambda (number)
         (triangle-number number))
       (range 1 (+ n 1))))

; finds number of divisors of the nth triangular number
(define (number-of-divisors n)
  (cond
    [(even? n) (* (multiply-exponents-of-prime-factors (factorize (/ n 2))) (multiply-exponents-of-prime-factors (factorize (+ n 1))))]
    [else (* (multiply-exponents-of-prime-factors (factorize n)) (multiply-exponents-of-prime-factors (factorize (/ (+ n 1) 2))))]))

(define (multiply-exponents-of-prime-factors pfs)
  (apply * (map (lambda (pair)
                  (+ (cadr pair) 1))
                pfs)))

(define (greater-than-five-hundred? n)
  (> n 500))

(define (over-five-hundred-divisors? n)
  (greater-than-five-hundred? (number-of-divisors n)))

(define (solution-12 n)
  (cond
    [(over-five-hundred-divisors? n) (triangle-number n)]
    [else (solution-12 (+ n 1))]))