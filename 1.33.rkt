#lang racket

(require "tools-function.rkt" racket/trace)

(define (miller-rabin? base n)
  (and (not (= base 1))
       (not (= base (- n 1)))
       (= 1 (remainder (square base) n))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((miller-rabin? base m) 0)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (fast-prime? n (ceiling (/ n 2))))

(define (filtered-accumulate combiner null-value term a next b vaild?)
  (if (> a b)
      null-value
      (if (vaild? a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value term (next a) next b vaild?))
          (filtered-accumulate combiner null-value term (next a) next b vaild?))))

(define (f x) x)

(define (sum-prime a b)
  (filtered-accumulate + 0 f a next-odd b prime?))

(sum-prime 2 10)

(define (pro-gcd n)
  (define (gcd? a)
    (= (gcd a n) 1))
  (filtered-accumulate * 1 f 1 inc n gcd?))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(pro-gcd 10)

