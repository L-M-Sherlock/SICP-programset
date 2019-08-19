#lang racket

(require "2.12.rkt")

(define A (make-center-percent 1.5 1))
(define B (make-center-percent 1.5 1))

(define C (mul-interval A B))

(* (* (center A)
      (center B))
   (+ 1
      (* (percent A)
         (percent B)
         0.0001)))
      
(center C)

(+ (percent A)
   (percent B))

(percent C)

;;A=[cA(1-pA),c(1+pA)],B=[cB(1-pB),c(1+pB)]
;;C=A*B=[cA*cB(1-pA-pB+pA*pB),cA*cB(1+pA+pB+pA*pB)]
;;so pC is close to (pA+pB)