#lang racket

(require "tools-function.rkt")
(require racket/trace)
  
(define (fast-expt b n)
  (fast-expt-iter 1 b n))
  
(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n)(fast-expt-iter a (* b b) (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))))

(trace fast-expt-iter)

(fast-expt 2 1024)