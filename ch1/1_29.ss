(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sinpson f a b n)
  (define (h)
    (/ (- b a) n))
  (define (next x) (+ x (h)))
  (define (mul x)
    (cond ((odd? (/ (- x a) (h))) 4)
          ((= (/ (- x a) (h)) n) 1)
          (else 2)))
  (define (term x)
    (* (mul x) (f x)))
  (* (sum term 0 next b) (/ (h) 3.0)))

(define (cube x) (* x x x))

(sinpson cube 0 1 10)
;Value: .25
(sinpson cube 0 1 100)
;Value: .25
(sinpson cube 0 1 1000)
;Value: .25
(sinpson cube 0 1 10000)
;Value: .25
