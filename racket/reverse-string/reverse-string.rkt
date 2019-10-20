#lang racket
(require threading)
(provide my-reverse)

(define (my-reverse s)
  (~> s
      (string->list)
      (reverse '())
      (list->string)))

(define (reverse l acc)
  (if (null? l) acc
      (reverse
        (cdr l)
        (cons (car l) acc))))
