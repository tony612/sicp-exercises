(define (my-reverse list0)
  (define (reverse-iter list1 acc)
    (cond ((null? list1) acc)
          ((not (pair? list1)) list1)
          (else (reverse-iter (cdr list1)
                              (cons (my-reverse (car list1)) acc)))))
  (reverse-iter list0 '()))

(my-reverse (list 1 4 9 16 25)) ; (25 16 9 4 1)

(define x (list (list 1 2) (list 3 4)))

(my-reverse x) ; ((4 3) (2 1))
