#lang racket

(provide collatz)

(define (collatz n [steps 0])
  (cond
    [(<= n 0) (error "Must be >= 1")]
    [(equal? n 1) steps]
    [(even? n) (collatz (/ n 2) (+ steps 1))]
    [else (collatz (+ 1 (* 3 n)) (+ steps 1))]))
