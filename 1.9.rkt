#lang racket

(require "tools-function.rkt")
(require racket/trace)

(define (add-1 a b)
  (if (= a 0)
      b
      (inc (add-1 (dec a) b))))
      
(define (add-2 a b)
  (if (= a 0)
      b
      (add-2 (dec a) (inc b))))

(trace add-1)
(trace add-2)

(add-1 6 32)
(add-2 6 32)
