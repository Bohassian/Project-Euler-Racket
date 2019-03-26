#lang racket

(define (fibonacci n)
  (define (fibonacci-tr n acc1 acc2)
    (cond
      [(= n 1) acc1]
      [(= n 2) acc2]
      [else (fibonacci-tr (- n 1) acc2 (+ acc1 acc2))]))
  (fibonacci-tr n 1 1))

(define (digits n)
  (define (digits n ns)
    (cond
      [(= n 0) ns]
      [else (digits (quotient n 10) (cons (remainder n 10) ns))]))
  (digits n '()))

(define (one-thousand-digits? n)
  (equal? (length (digits (fibonacci n))) 1000))

(define (solution-25 (n 1))
  (cond
    [(one-thousand-digits? n) n]
    [else (solution-25 (+ n 1))]))
    