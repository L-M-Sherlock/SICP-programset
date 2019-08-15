#lang racket

(require "tools-function.rkt" racket/trace)

(define (smooth f)
  (let ((dx 0.00001))
    (lambda (x) (/ (+ (f (- x dx))
                      (f x)
                      (f (+ x dx)))
                   3))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (compose f (repeated f (- n 1)))))

(define (smooth-n f n)
  ((repeated smooth n) f))

((smooth-n square 10) 5)