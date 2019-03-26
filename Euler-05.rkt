#lang racket

(require math/number-theory)

(define (primes-under (n 20))
  (filter positive? (prev-primes n n)))

(define (greatest-power n (l 20))
  (define (greatest-power-r k)
    (cond
      [(> (expt n k) l) (- k 1)]
      [else (greatest-power-r (+ k 1))]))
  (greatest-power-r 1))

(define (lcm (ns (primes-under)) (l 20))
  (define (lcm-tr ns acc)
    (cond
      [(null? ns) acc]
      [else (lcm-tr (cdr ns) (* acc (expt (car ns) (greatest-power (car ns) l))))]))
  (lcm-tr ns 1))