(define (double n)
  (* 2 n))

(define (halve n)
  (/ n 2))

(define (mul a b)
  (cond ((= b 1) a)
        ((even? b) (double (mul a (halve b))))
        (else (+ a (mul a (- b 1))))))

(mul 3 4) ; 12

