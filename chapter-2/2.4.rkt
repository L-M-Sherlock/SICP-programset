#lang racket

(require racket/trace)

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z(lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(trace cdr cons)

(cdr (cons 5 6))