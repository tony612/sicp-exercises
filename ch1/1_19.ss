; a1 = bq + a(p + q)
; b1 = bp + aq
; a2 = b(2pq + q^2) + a(p^2 + 2q^2 + 2pq)
; b2 = b(p^2 + q^2) + a(q^2 + 2pq) 
; p' = q^2 + p^2
; q' = q^2 + 2pq

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (square q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(fib 5) ; 5
(fib 6) ; 8
(fib 7) ; 13
(fib 8) ; 21
(fib 20); 6765

