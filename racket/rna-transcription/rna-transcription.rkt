#lang racket

(require threading)
(require racket/match)
(provide to-rna)

(define (to-rna strand)
  (~>> strand
    string->list
    (map convert)
    list->string))

(define (convert nucleotide)
  (match nucleotide
    [#\G #\C]
    [#\C #\G]
    [#\T #\A]
    [#\A #\U]))
