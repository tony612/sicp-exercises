(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  ; (newline)
  ; (display n)
  (start-prime-test n (real-time-clock)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime n (- (real-time-clock) start-time))
      false))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-prime from)
  (define (search-iter from)
    (if (timed-prime-test from)
        "Done."
        (search-iter (+ from 2))))
  (search-iter (if (odd? from) from (+ 1 from))))

(search-for-prime 1000)    ; 1009 *** 5.
(search-for-prime 10000)   ; 10007 *** 5.
(search-for-prime 100000)  ; 100003 *** 6.
(search-for-prime 1000000) ; 1000003 *** 6.
; It too fast to see the diff
; So use a large number to test
(search-for-prime 1000000000) ; 1000000007 *** 10
(search-for-prime 10000000000) ; 10000000019 *** 12

