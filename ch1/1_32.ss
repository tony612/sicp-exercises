(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (accumulate2 combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate2 combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(sum cube 1 inc 2)

(define (inc n) (+ n 1))
(define (cube x) (* x x x))
(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10) ; 3025

(define (product term a next b)
  (accumulate * 1 term a next b))
