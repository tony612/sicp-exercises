(define (average x y)
  (/ (+ x y) 2))

(average 1 3)

(define (improve guess x)
  (average guess (/ x guess)))

(improve 1 9)

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(good-enough? 2 4)

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(sqrt-iter 1.0 9)

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x)
                     x)))

(define (new-sqrt-iter2 guess x)
  (cond ((good-enough? guess x) guess)
        (else (new-sqrt-iter2 (improve guess x)
                              x))))

(new-sqrt-iter 1.0 9)
; Aborting!: maximum recursion depth exceeded

(new-sqrt-iter2 1.0 9)
; Value: 3.00009155413138

(define (foo x)
  (new-if (< x 0)
          x
          (foo (- x 1))))

(foo 0)
; Aborting!: maximum recursion depth exceeded

(define (foo2 x)
  (cond ((< x 0) x)
        (else (foo2 (- x 1)))))

(foo2 5)
; -1


;; Because the interpreter is applicative order, so the foo will be
;; computed from the smallest part
(new-if #f
        0
        (foo -1))
; then the `foo` will be computed
(new-if #f
        0
        (new-if #t
                (foo -)))
; and so on...
