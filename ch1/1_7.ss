(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(sqrt-iter 1.0 9)

(sqrt-iter 1.0 0.001)
;Value: .04124542607499115

(sqrt-iter 1.0 100000000)
;Value: 10000.

(define (better-enough? guess guess2)
  (< (/ (abs (- guess guess2)) guess) 0.001))

(define (sqrt-iter2 guess guess2 x)
  (if (better-enough? guess guess2)
      guess
      (sqrt-iter2 (improve guess x)
                 guess
                 x)))

(sqrt-iter2 1.0 2.0 0.001)
;Value: .03162278245070105

(sqrt-iter2 1.0 2.0 100000000)
;Value: 10000.000000082462
