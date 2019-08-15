#lang racket

(require racket/trace)

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) result)))))
  ;(trace iter)
  (iter (- k 1)
        (/ (n k)
           (n d))))

(define (count-e k)
  (define (n x)
    (if (remain-2? x)
        (* (/ (+ x 1)
              3)
           2)
        1))
  (define (remain-2? x)
    (= (remainder x 3) 2))
  (+ (cont-frac-iter (lambda (i) 1.0)
                     n
                     k)
     2))

(count-e 100)