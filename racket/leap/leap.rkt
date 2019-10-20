#lang racket

(provide leap-year?)

(define (leap-year? year)
  (and
    (equal? (remainder year 4) 0)
    (or
      (not (equal? (remainder year 100) 0))
      (equal? (remainder year 400) 0))))
