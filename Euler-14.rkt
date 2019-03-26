#lang racket

(define (collatz-sequence n)
  (define (collatz-tr n acc)
    (cond
      [(= n 1) (cons n acc)]
      [(even? n) (collatz-tr (/ n 2) (cons n acc))]
      [else (collatz-tr (+ (* 3 n) 1) (cons n acc))]))
  (collatz-tr n '()))

(define (collatz-length n)
  (length (collatz-sequence n)))

(define (solution-14 (n 1000000))
  (argmax collatz-length (range 1 n)))