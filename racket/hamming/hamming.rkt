#lang racket

(provide hamming-distance)

(define (hamming-distance a b)
  (compute-distance
    (string->list a)
    (string->list b)
    0))

(define (compute-distance a b count)
  (cond
    [(and (null? a) (null? b)) count]
    [(or (null? a) (null? b)) (error "Length mismatch")]
    [(equal? (car a) (car b)) (compute-distance (cdr a) (cdr b) count)]
    [else (compute-distance (cdr a) (cdr b) (+ 1 count))]))
