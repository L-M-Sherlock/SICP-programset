#lang racket

(require "tools-function.rkt")
(require racket/trace)

(define (double n) (+ n n))

(define (halve n) (/ n 2))

(define (product a b)
  (cond ((= b 0) 0)
        ((even? b) (double (product a (halve b))))
        (else (+ a (product a (- b 1))))))
  
(trace product)

(product 32 64)