#lang racket

(require "tools-function.rkt")

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

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (fast-prime? n 10))

(define (find-n-primes n count)
  (cond ((= count 0)
         (display "END"))
        ((prime? n)
         (timed-prime-test n)
         (newline)
         (find-n-primes (next-odd n) (- count 1)))
        (else (find-n-primes (next-odd n) count))))

(find-n-primes 10000 1)