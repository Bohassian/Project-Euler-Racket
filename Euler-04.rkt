#lang racket

(require math/number-theory)

(define (digits n)
  (define (digits n ns)
    (cond
      [(= n 0) ns]
      [else (digits (quotient n 10) (cons (remainder n 10) ns))]))
  (digits n '()))

(define (palindrome? n)
  (equal? (digits n) (reverse (digits n))))

(define (three-digits? n)
  (and (> n 99) (< n 1000)))

(define (three-digit-divisors n)
  (filter three-digits? (divisors n)))

(define (product-of-two-three-digit-numbers? n)
  (ormap three-digits? (map (lambda (number)
         (/ n number))
       (three-digit-divisors n))))

(define (solution-04)
  (car (filter product-of-two-three-digit-numbers? (reverse (filter palindrome? (range 1000000))))))