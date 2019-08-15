#lang racket

(define (sum-of-two-big-of-three a1 a2 a3)
   (if (or (> a3 a1)
           (> a3 a2))
       (+ a3 (if (> a1 a2)
                 a1
                 a2))
       (+ a1 a2)))

(sum-of-two-big-of-three 11 23 53)
(sum-of-two-big-of-three 96 23 53)
(sum-of-two-big-of-three 11 88 53)