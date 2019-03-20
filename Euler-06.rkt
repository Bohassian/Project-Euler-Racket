#lang racket

(define (square n)
  (expt n 2))

(define (sum-of-squares (ns (range 1 101)))
  (apply + (map (lambda (number)
                  (square number))
                ns)))

(define (square-of-sum (ns (range 1 101)))
  (square (apply + ns)))

(define (solution-06)
  (- (square-of-sum) (sum-of-squares)))