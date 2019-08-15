#lang racket

(require racket/trace)
(require "tools-function.rkt" )

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
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random 4294967087))))

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



(find-n-primes 10000000000 3)
(find-n-primes 100000000000 3)
(find-n-primes 1000000000000 3)
(find-n-primes 10000000000000 3)