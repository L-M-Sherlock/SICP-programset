#lang racket

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (let ((p1 (lower-bound y))
        (p2 (upper-bound y)))
    (if (or (= (* p1 p2) 0)
            (< (* p1 p2) 0))
        (display "*** Cannot divide by zero!")
        (mul-interval x
                      (make-interval (/ 1.0 p2)
                                     (/ 1.0 p1))))))

(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval))


(define a (make-interval 0 0.1))
(define b (make-interval 0.2 0.3))
(div-interval a b)