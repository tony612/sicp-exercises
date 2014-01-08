(define (check-special a n)
  (if (not (or (= a 1) (= a (- n 1))))
      (= (remainder (square a) n) 1)
      false))

(check-special 4 15)

(define (expmod2 base exp m)
  (cond ((check-special base m) 0)
        ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod2 base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod2 base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-special mod-or-0 a)
    (if (= mod-or-0 0)
        false
        (= mod-or-0 1)))
  (define (try-it a)
    (try-special (expmod2 a (- n 1) n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 13 100)   ; #t
(fast-prime? 15 100)   ; #f
(fast-prime? 561 100)  ; #f
(fast-prime? 1105 100) ; #f
(fast-prime? 1729 100) ; #f
(fast-prime? 2465 100) ; #f
(fast-prime? 2821 100) ; #f
(fast-prime? 6601 100) ; #f


