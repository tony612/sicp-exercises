(define (double n)
  (* 2 n))

(define (halve n)
  (/ n 2))

(define (mul2 x y)
  (define (mul-iter a b n)
    (cond ((= b 0) n)
          ((even? b) (mul-iter (double a) (halve b) n))
          (else (mul-iter a (- b 1) (+ n a)))))
  (mul-iter x y 0))

(mul2 3 4) ; 12

