#lang racket

(require threading)
(provide armstrong-number?)

(define (armstrong-number? n)
  (~>> n
    (number->string)
    (string->list)
    (map string)
    (map string->number)
    (map (raise-to-the (count-digits n)))
    (apply +)
    (= n)))

(define (raise-to-the n)
  (lambda (x)
    (expt x n)))

(define (count-digits n)
  (string-length (number->string n)))
