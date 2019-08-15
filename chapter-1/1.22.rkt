#lang racket

(require "tools-function.rkt" "1.21.rkt")
  
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
  
(define (start-prime-test n start-time)
  (when (prime? n)
      (report-prime (- (runtime) start-time))))
      
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
  
(define (next-odd n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))
      
(define (find-n-primes n count)
  (cond ((= count 0)
         (display "END"))
        ((prime? n)
         (timed-prime-test n)
         (newline)
         (find-n-primes (next-odd n) (- count 1)))
        (else (find-n-primes (next-odd n) count))))
        
(find-n-primes 10000000000 3)
(find-n-primes 100000000000 3)
(find-n-primes 1000000000000 3)
(find-n-primes 10000000000000 3)