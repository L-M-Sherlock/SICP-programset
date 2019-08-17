#lang racket

(require "tools-function.rkt")

(define (cons x y)
  (* (fast-expt 2 x)
     (fast-expt 3 y)))

(define (car z)
  (define (iter a result)
    (if (even? a)
        (iter (/ a 2) (+ 1 result))
        result))
  (iter z 0))

(define (cdr z)
  (define (iter a result)
    (if (= (remainder a 3)
           0)
        (iter (/ a 3) (+ 1 result))
        result))
  (iter z 0))

(car (cons 5 6))
(cdr (cons 5 6))