(define (sum term x next y)
  (define (iter a result)
    (if (> a y)
        result
        (iter (next a) (+ result (term a)))))
  (iter x 0))

(define (cube x) (* x x x))
(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10)
