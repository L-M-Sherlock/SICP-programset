#lang racket

(require racket/trace)

(define (change-count amount)
  (cc 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 (+ (/ amount 5) 1) 1 2 4))

(define (even? u)
  (= (remainder u 2) 0))

(define (cc a b c d e f g h i j k l m n o p q x y)
         (cond ((= p q) a)
               ((even? q) (cc (- (+ y e j) o) a b c d e f g h i j k l m n p (+ q 1) x (+ y q 3)))
               (else (cc (- (+ x e j) o) a b c d e f g h i j k l m n p (+ q 1) (+ x q 3) y))))

(trace cc)

(change-count 1000)               