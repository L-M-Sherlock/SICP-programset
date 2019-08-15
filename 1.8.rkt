#lang racket

(define (cube-root-iter guess x)
  (if (good-enough? guess (improve guess x))
      (improve guess x)
      (cube-root-iter (improve guess x)
                      x)))
                      
(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
     3))
     
(define (good-enough? last-guess now-guess)
  (> 0.01
     (/ (abs (- now-guess last-guess))
             last-guess)))
             
(define (cube-root x)
  (cube-root-iter 1 x))

(cube-root 27.0)
(cube-root 0.001)
(cube-root 23849238492.0)