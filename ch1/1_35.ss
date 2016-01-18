(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point cos 1.0)

; f(x) = 1 + 1/x
(define (goden-ratio x) (+ 1 (/ 1 x)))

(fixed-point goden-ratio 1.0)
; => 1.6180327868852458
