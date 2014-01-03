(define (close? guess guess2)
  (< (/ (abs (- guess guess2)) guess) 0.001))

(define (improve y x)
  (/ (+ (/ x (* y y)) y y) 3))

(define (cube-root-iter guess1 guess2 x)
  (if (close? guess1 guess2)
    guess1
    (cube-root-iter (improve guess1 x)
               guess1
               x)))

(cube-root-iter 1.0 2.0 9)
;Value: 2.0800838232385224

(cube-root-iter 1.0 2.0 27)
;Value: 3.0000005410641766
