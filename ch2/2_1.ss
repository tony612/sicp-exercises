(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (define g (gcd n d))
  (let ((new-n (/ n g))
        (new-d (/ d g)))
    (if (>= (* new-n new-d) 0)
        (cons (abs new-n) (abs new-d))
        (cons (- (abs new-n)) (abs new-d)))))

(define (numer x) (car x))

(define (denom x) (cdr x))
