#lang racket

(provide my-length
         my-reverse
         my-map
         my-filter
         my-fold
         my-append
         my-concatenate)

(define (my-length list [count 0])
  (if (null? list) count
      (my-length (cdr list) (+ count 1))))

(define (my-reverse list [acc '()])
  (if (null? list) acc
      (my-reverse (cdr list) (cons (car list) acc))))

(define (my-map func list [acc '()])
  (if (null? list) (my-reverse acc)
      (my-map func (cdr list) (cons (func (car list)) acc))))

(define (my-filter func list [acc '()])
  (cond
    [(null? list) (my-reverse acc)]
    [(func (car list)) (my-filter func (cdr list) (cons (car list) acc))]
    [else (my-filter func (cdr list) acc)]))

(define (my-fold func acc list)
  (if (null? list) acc
      (my-fold func (func (car list) acc) (cdr list))))

(define (my-append a b)
  (if (null? a) b
      (cons (car a) (append (cdr a) b))))

(define (my-concatenate list)
  (if (null? list) null
      (my-append (car list) (my-concatenate (cdr list)))))
