#lang racket

(require "tools-function.rkt")

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      (improve guess x)
      (sqrt-iter (improve guess x)
                 x)))
                  
(define (good-enough? last-guess now-guess)
  (> 0.01
     (/ (abs (- now-guess last-guess))
             last-guess)))
             
(define (sqrt x)
  (sqrt-iter 1 x))

(sqrt 90.0)
(sqrt 0.0001)
(sqrt 903492308203550230832.0)