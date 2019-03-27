#lang racket

(define (pythagorean-triple m n)
  (define (a)
    (- (expt n 2) (expt m 2)))
  (define (b)
    (* (* 2 n) m))
  (define (c)
    (+ (expt n 2) (expt m 2)))
  (cond
    [(< m n) (list (a) (b) (c))]))

(define (pyth-triple-sum m n)
  (apply + (pythagorean-triple m n)))

(define (pyth-triple-product m n)
  (apply * (pythagorean-triple m n)))

(define (solution-09 (m 1) (n 2) (limit 1000))
  (cond
    [(= (pyth-triple-sum m n) limit) (pyth-triple-product m n)]
    [(> (pyth-triple-sum m n) limit) (solution-09 (+ m 1) (+ m 2) limit)]
    [else (solution-09 m (+ n 1) limit)]))