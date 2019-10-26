#lang racket

(require threading)
(provide to-rna)

(define (to-rna strand)
  (~>> strand
    string->list
    (map convert)
    list->string))

(define (convert nucleotide)
  (case nucleotide
    [(#\G )#\C]
    [(#\C) #\G]
    [(#\T) #\A]
    [(#\A) #\U]))
