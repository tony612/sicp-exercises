(define (reverse list0)
  (define (reverse-iter list0 rev-list)
    (if (null? list0)
      rev-list
      (reverse-iter (cdr list0) (cons (car list0) rev-list))))
  (reverse-iter list0 '()))

(reverse (list 1 4 9 16 25)) ; (25 16 9 4 1)
