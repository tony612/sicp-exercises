(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;; applicative-order
(if (= 0 0) 0 (p))
(if (= 0 0) 0 (p))
; ...
(if (= 0 0) 0 (p))
; ...

;; normal-order
(if (= 0 0) 0 (p))
(if #t 0 (p)) ; 0
