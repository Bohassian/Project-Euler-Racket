#lang racket

(require math/number-theory)

(define (prime-sequence (max 775146))
  (define (prime-terms i acc)
    (cond
      [(> i max) acc]
      [(prime? i) (prime-terms (+ i 1) (cons i acc))]
      [else (prime-terms (+ i 1) acc)]))
  (prime-terms 2 '()))

(define (largest-factor ns (y 600851475143))
  (define (factor x acc y)
    (cond
      [(= (modulo y x) 0) x]
      [(factor (car acc) (cdr acc) y)]))
  (factor (car ns) (cdr ns) y))

(define (solution-03)
  (largest-factor (prime-sequence)))
