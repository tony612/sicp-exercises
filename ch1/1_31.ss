(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (product2 term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial x)
  (define (term a) a)
  (define (next a) (+ a 1))
  (product term 1 next x))

(factorial 5) ; 120

(define (pi)
  (define (next a)
    (+ a 2))
  (define (term a)
    (/ (- (* a a) 1) (* a a)))
  (* (product term 3 next 10000) 4.0))

(define (pi2)
  (define (next a)
    (+ a 2))
  (define (term a)
    (/ (- (* a a) 1) (* a a)))
  (* (product2 term 3 next 10000) 4.0))

(pi)
;Value: 3.1417497371492673
(pi2)
;Value: 3.1417497371492673

