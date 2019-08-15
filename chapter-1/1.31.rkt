#lang racket

(require "tools-function.rkt" racket/trace)

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (pro term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (trace iter)
  (iter a 1))

(define (count-pi n)
  (define (term x)
    (/ (numerator x)
       (denominator x)))
  (define (numerator x)
    (if (even? x)
        (+ x 2)
        (+ x 1)))
  (define (denominator x)
    (if (even? x)
        (+ x 1)
        (+ x 2)))
  (define (next a)
    (+ a 1))
  (* 4 (pro term 1.0 next n)))

(count-pi 100)