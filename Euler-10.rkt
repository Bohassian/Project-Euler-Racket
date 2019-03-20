#lang racket

(require math/number-theory)

(define (solution-10)
  (apply + (filter prime? (range 2000000))))