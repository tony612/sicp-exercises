(define (f g)
  (g 2))

; applicative-order
(f f)
; param f can't be expanded, so expand oprator f =>
(f 2)
; =>
(2 2)
; The object 2 is not applicable.
