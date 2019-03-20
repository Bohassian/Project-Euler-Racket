#lang racket

(define (factorial (n 100))
  (define (factorial-tr n acc)
    (cond
      [(= n 0) acc]
      [(= n 1) acc]
      [else (factorial-tr (- n 1) (* n acc))]))
  (factorial-tr n 1))

(define (digits n)
  (define (digits n ns)
    (cond
      [(= n 0) ns]
      [else (digits (quotient n 10) (cons (remainder n 10) ns))]))
  (digits n '()))

(define (solution-20)
  (apply + (digits (factorial))))