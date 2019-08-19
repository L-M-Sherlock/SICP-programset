#lang racket

(provide mul-interval div-interval add-interval make-interval make-center-percent percent center)

(define (mul-interval x y)
  (let ((x-l (lower-bound x))
        (x-u (upper-bound x))
        (y-l (lower-bound y))
        (y-u (upper-bound y)))
    (cond ((and (> x-l 0) (> y-l 0))
           (make-interval (* x-l y-l) (* x-u y-u)))
          ((and (< x-u 0) (< y-u 0))
           (make-interval (* x-u y-u) (* x-l y-l)))
          ((and (< x-l 0) (> x-u 0) (> y-l 0))
           (make-interval (* x-l y-u) (* x-u y-u)))
          ((and (> x-l 0) (< y-l 0) (> y-u 0))
           (make-interval (* x-u y-l) (* x-u y-u)))
          ((and (< x-u 0) (> y-l 0))
           (make-interval (* x-l y-u) (* x-u y-l)))
          ((and (< x-u 0) (< y-l 0) (> y-u 0))
           (make-interval (* x-l y-u) (* x-l y-l)))
          ((and (< x-l 0) (> x-u 0) (< y-u 0))
           (make-interval (* x-u y-l) (* x-l y-l)))
          ((and (> x-l 0) (< y-u 0))
           (make-interval (* x-u y-l) (* x-l y-u)))
          (else (let ((p1 (* (lower-bound x) (lower-bound y)))
                      (p2 (* (lower-bound x) (upper-bound y)))
                      (p3 (* (upper-bound x) (lower-bound y)))
                      (p4 (* (upper-bound x) (upper-bound y))))
                  (make-interval (min p1 p2 p3 p4)
                                 (max p1 p2 p3 p4)))))))

(define (div-interval x y)
  (let ((p1 (lower-bound y))
        (p2 (upper-bound y)))
    (if (or (= (* p1 p2) 0)
            (< (* p1 p2) 0))
        (display "*** Cannot divide by zero!")
        (mul-interval x
                      (make-interval (/ 1.0 p2)
                                     (/ 1.0 p1))))))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p-of-100)
  (let ((p (/ p-of-100 100)))
    (make-center-width c (* c p))))

(define (percent i)
  (* (/ (width i) (center i))
     100))

;(make-center-percent 100 5)

