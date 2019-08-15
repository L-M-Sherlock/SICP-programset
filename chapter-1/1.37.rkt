#lang racket

(require racket/trace)

(define (cont-frac n d k)
  (define (f i)
    (if (= i k)
        (/ (n k)
           (d k))
        (/ (n k)
           (+ (d k)
              (f (+ i 1))))))
  (trace f)
  (f 1))

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) result)))))
  (trace iter)
  (iter (- k 1)
        (/ (n k)
           (n d))))

              

(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)