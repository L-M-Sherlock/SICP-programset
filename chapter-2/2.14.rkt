#lang racket

(require "2.12.rkt")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define A (make-center-percent 15 1))
(define B (make-center-percent 15 1))
(par1 A B)
(par2 A B)
(div-interval A A)
