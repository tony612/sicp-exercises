(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(f 1)
(f 4) ; 11
(f 5) ; 25

(define (f2 n)
  (define (f2-iter a b c n)
    (if (= n 0)
        c
        (f2-iter (+ a (* 2 b) (* 3 c)) a b (- n 1))))
  (f2-iter 2 1 0 n))

(f2 4) ; 11
(f2 5) ; 25

