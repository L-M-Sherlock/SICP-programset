#lang racket

(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval))

(define (sub-interval x y)
  (make-interval (- (upper-bound x) (lower-bound x))
                 (- (lower-bound y) (upper-bound y))))

(define a (make-interval 2.9 3.1))
(define b (make-interval 1.9 2.1))
(sub-interval a b)