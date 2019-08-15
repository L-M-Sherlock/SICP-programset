#lang racket

(require racket/trace)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (trace f)
  (try first-guess))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.00001)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x) (+ (* x x x)
                 (* a x x)
                 (* b x)
                 c)))

(newtons-method (cubic 3 2 1) 1)

;(define (fast-expt b n)
;  (fast-expt-iter 1 b n))
  
;(define (fast-expt-iter a b n)
;  (cond ((= n 0) a)
;        ((even? n)(fast-expt-iter a (* b b) (/ n 2)))
;        (else (fast-expt-iter (* a b) b (- n 1)))))

;(define (n-sqrt x n)
;  (newtons-method (lambda (y) (- (fast-expt y n) x)) 1))

;(n-sqrt 1024 10)


  