(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (* b 2) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* a b)))))

(define (expt b n)
  (fast-expt-iter b n 1))

(expt 2 10) ; 1024

