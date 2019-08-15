#lang racket

(require "tools-function.rkt" racket/trace)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (n-average-damp f n)
  ((repeated average-damp n) f))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (trace try)
  (try first-guess))

(define (fast-expt b n)
  (fast-expt-iter 1 b n))
  
(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n)(fast-expt-iter a (* b b) (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))))

(define (n-sqrt x n)
  (fixed-point (n-average-damp (lambda (y) (/ x (fast-expt y (- n 1)))) (times n)) 1.0))

(define (times n)
  (lg n))

(define (lg n)
    (cond ((> (/ n 2) 1)
            (+ 1 (lg (/ n 2))))
          ((< (/ n 2) 1)
            0)
          (else
            1)))

(n-sqrt 1024 10)