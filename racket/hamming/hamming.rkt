#lang racket

(provide hamming-distance)

(define (hamming-distance a b)
  (count
    (negate equal?)
    (string->list a)
    (string->list b)))
