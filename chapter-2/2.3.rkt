#lang racket

(require "2.2.rkt" racket/trace)

(define (width rectangle)
  (length-width rectangle x-point get-width-1))

(define (length rectangle)
  (length-width rectangle y-point get-length-1))

(define (length-width rectangle point get)
  (let ((length-width (get rectangle)))
    (let ((start (start-segment length-width))
          (end (end-segment length-width)))
      (- (point end)
         (point start)))))

(define (perimeter rectangle)
  (* 2 (+ (width rectangle)
          (length rectangle))))

(define (area rectangle)
  (* (width rectangle)
     (length rectangle)))

(define (make-rectangle length-1 length-2 width-1 width-2)
  (cons (cons length-1 length-2)
        (cons width-1 width-2)))

(define (get-length-1 rectangle)
  (car (car rectangle)))

(define (get-length-2 rectangle)
  (cdr (car rectangle)))

(define (get-width-1 rectangle)
  (car (cdr rectangle)))

(define (get-width-2 rectangle)
  (cdr (cdr rectangle)))

(define l-1 (make-segment (make-point 0 0) (make-point 0 1)))

(define l-2 (make-segment (make-point 2 0) (make-point 2 1)))

(define w-1 (make-segment (make-point 0 0) (make-point 2 0)))

(define w-2 (make-segment (make-point 0 1) (make-point 2 1)))

(define r (make-rectangle l-1 l-2 w-1 w-2))

(define (print-rectangle r)
    (let ((l1 (get-length-1 r))
          (l2 (get-length-2 r))
          (w1 (get-width-1 r))
          (w2 (get-width-2 r)))
        
        (display "Length 1:")
        (newline)
        (print-point (start-segment l1))
        (print-point (end-segment l1))

        (display "Length 2:")
        (newline)
        (print-point (start-segment l2))
        (print-point (end-segment l2))

        (display "Width 1:")
        (newline)
        (print-point (start-segment w1))
        (print-point (end-segment w1))

        (display "Width 2:")
        (newline)
        (print-point (start-segment w2))
        (print-point (end-segment w2))))

;(print-rectangle r)
(area r)
(perimeter r)

