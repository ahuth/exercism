#lang racket

(provide sum-of-squares square-of-sum difference)

(define (sum-of-squares num [sum 0])
  (if (zero? num)
      sum
      (sum-of-squares (- num 1) (+ sum (* num num)))))

(define (square-of-sum num [sum 0])
  (if (zero? num)
      (* sum sum)
      (square-of-sum (- num 1) (+ sum num))))

(define (difference num)
  (- (square-of-sum num) (sum-of-squares num)))
