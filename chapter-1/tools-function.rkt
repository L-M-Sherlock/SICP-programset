#lang racket

(provide inc)
(provide dec)
(provide improve)
(provide even?)
(provide divides?)
(provide square)
(provide double)
(provide halve)
(provide next-odd)
(provide runtime)
(provide fast-expt)

(define (inc x) (+ x 1))

(define (dec x) (- x 1))

(define (average x y)
  (/ (+ x y) 2))

(define (next-odd n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))

(define (divides? a b)
  (= (remainder b a) 0))

(define (improve guess x)
  (average guess (/ x guess)))

(define (even? n)
  (= (remainder n 2) 0))

(define (square x) (* x x))

(define (double n) (+ n n))

(define (halve n) (/ n 2))

(define (runtime) (current-milliseconds))

(define (fast-expt b n)
  (fast-expt-iter 1 b n))
  
(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n)(fast-expt-iter a (* b b) (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))))