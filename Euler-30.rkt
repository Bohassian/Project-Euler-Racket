#lang racket

(define (digits n)
  (define (digits n ns)
    (cond
      [(= n 0) ns]
      [else (digits (quotient n 10) (cons (remainder n 10) ns))]))
  (digits n '()))

(define (fifth-power-of-digits ns)
  (map (lambda (n)
         (expt n 5))
       ns))

(define (sum-of-fifth-powers-of-digits n)
  (apply + (fifth-power-of-digits (digits n))))

(define (equal-to-sum-of-fifth-powers-of-digits? n)
  (equal? n (sum-of-fifth-powers-of-digits n)))

(define (numbers-written-as-sum-of-fifth-powers-of-digits (ns (range 10 1000000)))
  (filter equal-to-sum-of-fifth-powers-of-digits? ns))

(define (solution-30)
  (apply + (numbers-written-as-sum-of-fifth-powers-of-digits)))