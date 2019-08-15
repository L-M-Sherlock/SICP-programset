#lang racket

(require "tools-function.rkt" racket/trace)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a)
                          result))))
  (trace iter)
  (iter a 0))
  
(define (cube x)
  (* x x x))

(define (xps f a b n)
  (define h (/ (- b a) n))
  
  (define (y k)
    (f (+ a
          (* k h))))
  
  (define (factor k)
    (cond ((or (= k 0)
               (= k n))
           1)
          ((even? k)
           2)
          (else 4)))
  (define (term k)
    (* (factor k)
       (y k)))
  
  (define (next k)
    (+ k 1))
  
  (* (/ h 3)
     (sum term 0 next n)))

(xps cube 0 1 100)