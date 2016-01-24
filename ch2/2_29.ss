(define (make-mobile left right)
  (list left right))

(define (make-branch length struc)
  (list length struc))

; a
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

; b
(define (branch-weight branch)
  (cond ((null? branch) 0)
        ((not (pair? branch)) branch)
        (else (+ (left-branch branch)
                 (branch-weight (right-branch branch))))))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))

(define branch-l (make-branch 1 (make-branch 2 3)))

(define branch-r (make-branch 3 (make-branch 4 5)))

(define mobile (make-mobile branch-l branch-r))

(total-weight mobile) ; 18

; c
(define (is-balanced? mobile)
  (equal? (branch-weight (left-branch mobile))
          (branch-weight (right-branch mobile))))

(is-balanced? mobile) ; #f

(define branch-l2 (make-branch 1 (make-branch 2 3)))

(define branch-r2 (make-branch 3 (make-branch 2 1)))

(define mobile2 (make-mobile branch-l2 branch-r2))

(is-balanced? mobile2) ; #t

; d
(define (make-mobile left right)
  (cons left right))

(define (make-branch length struc)
  (cons length struc))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))
