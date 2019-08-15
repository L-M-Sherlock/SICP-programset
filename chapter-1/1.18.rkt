#lang racket

(require "tools-function.rkt")
(require racket/trace)

(define (product a b)
  (product-iter 0 a b))
  
(define (product-iter pro a b)
  (cond ((= b 0) pro)
        ((even? b) (product-iter pro (double a) (halve b)))
        (else (product-iter (+ pro a) a (- b 1)))))

(trace product-iter)

(product 32 64)
