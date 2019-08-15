#lang racket

(require "tools-function.rkt")



(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

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
