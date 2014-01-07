(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  ; (newline)
  ; (display n)
  (start-prime-test n (real-time-clock)))

(define (start-prime-test n start-time)
  (if (prime? n)
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

(search-for-prime 1000)    ; 1009 *** 0.
(search-for-prime 10000)   ; 10007 *** 1.
(search-for-prime 100000)  ; 100003 *** 2.
(search-for-prime 1000000) ; 1000003 *** 3.
; It too fast to see the diff
; So use a large number to test
(search-for-prime 1000000000) ; 1000000007 *** 51
(search-for-prime 10000000000) ; 10000000019 *** 154

