(define (last-pair list)
  (define (last-pair-iter list elem)
    (if (null? list)
      elem
      (last-pair-iter (cdr list) (car list))))
  (last-pair-iter list (car list)))

(last-pair (list 23 42 12 94)) ; 94

(last-pair (list 23)) ; 23
