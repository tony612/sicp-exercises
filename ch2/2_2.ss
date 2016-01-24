(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-segment a b) (cons a b))

(define (start-segment s) (car s))

(define (end-segment s) (cdr s))

(define (point-plus a b)
  (make-point (+ (x-point a) (x-point b)) (+ (y-point a) (y-point b))))

(define (point-div p d)
  (make-point (/ (x-point p) d) (/ (y-point p) d)))

(define (midpoint-segment s)
  (point-div (point-plus (start-segment s) (end-segment s)) 2))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
