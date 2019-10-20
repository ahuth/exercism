#lang racket

(require threading)
(provide rebase)

(define (rebase digits in-base out-base)
  (~> digits
      (from-base in-base 0)
      (to-base out-base '())))

(define (from-base digits base sum)
  (cond
        [(< base 2) #f]
        [(null? digits) sum]
        [(< (car digits) 0) #f]
        [(>= (car digits) base) #f]
        [else (from-base
                (cdr digits)
                base
                (+ sum (* (car digits) (round (expt base (- (length digits) 1))))))]))

(define (to-base number base digits)
  (cond
        [(< base 2) #f]
        [(equal? number #f) #f]
        [(and (equal? number 0) (null? digits)) '(0)]
        [(equal? number 0) digits]
        [else (to-base
                (floor (/ number base))
                base
                (cons (remainder number base) digits))]))
