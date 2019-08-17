#lang racket

(provide make-segment start-segment end-segment make-point x-point y-point print-point)

(define (make-segment a b)
  (cons a b))

(define (start-segment n)
  (car n))

(define (end-segment n)
  (cdr n))

(define (make-point x y)
  (cons x y))

(define (x-point n)
  (car n))

(define (y-point n)
  (cdr n))

(define A (make-point 1 2))
(define B (make-point 2 5))
(define AB (make-segment A B))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define (average x y)
  (/ (+ x y) 2))

(define (midpoint-segment S)
  (make-point (average (x-point (start-segment S))
                       (x-point (end-segment S)))
              (average (y-point (start-segment S))
                       (y-point (end-segment S)))))

(define C (midpoint-segment AB))
;(print-point C)