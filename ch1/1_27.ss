(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (check-carm n)
  (define (check-each i)
    (cond ((= i n) true)
          ((= (expmod i n n) i)
           (check-each (+ i 1)))
          (else false)))
  (check-each 1))

(check-carm 561)  ; #t
(check-carm 1105) ; #t
(check-carm 1729) ; #t
(check-carm 2465) ; #t
(check-carm 2821) ; #t
(check-carm 6601) ; #t
