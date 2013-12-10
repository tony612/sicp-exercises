(define (max a b c)
  (cond ((and (> a c) (> b c)) (+ a b))
        ((and (> a b) (> c b)) (+ a c))
        (else (+ b c))))

(max 1 2 3) ; 5

(max 3 2 1) ; 5

(max 2 1 3) ; 5

