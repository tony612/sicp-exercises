; m is row, n is col. from 1 on.
(define (pasca m n)
  (if (or (= n 1) (= m n))
      1
      (+ (pasca (- m 1) (- n 1)) (pasca (- m 1) n))))
