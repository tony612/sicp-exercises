(define (filtered-accumulate combiner null-value filter? term a next b)
  (define (find-next a)
    (cond ((> a b) null-value)
          ((filter? (next a)) (next a))
          (else (find-next (next a)))))
  (define (iter a result)
    (if (> a b)
        result
        (iter (find-next a) (combiner result (term a)))))
  (iter (if (filter? a)
            a
            (find-next a)) null-value))

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

(define (prime? n) (fast-prime? n 1000))

(define (sum-prime a b)
  (define (term a) a)
  (define (next a) (+ a 1))
  (filtered-accumulate + 0 prime? term a next b))

(sum-prime 3 10)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product n)
  (define (filter? i) (= (gcd n i) 1))
  (define (term a) a)
  (define (next a) (+ a 1))
  (filtered-accumulate * 1 filter? term 1 next n))

(product 10) ; 189
