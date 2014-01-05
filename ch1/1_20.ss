; normal-order
(gcd 206 40)
; =>
(if (= 40 0)
    206
    (gcd 40 (redmainder 206 40)))
; =>
(gcd 40 (redmainder 206 40))
; =>
(if (= (redmainder 206 40) 0)
    40
    (gcd (redmainder 206 40) (redmainder 40 (redmainder 206 40))))
; =>
(if (= 6 0) ; 1 time
    40
    (gcd (redmainder 206 40) (redmainder 40 (redmainder 206 40))))
; =>
(gcd (redmainder 206 40) (redmainder 40 (redmainder 206 40)))
; =>
(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))))
; =>
(if (= 4 0) ; + 2 times
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))))
; =>
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40))))
; ...
; Total: 1+2+4+7+4=18

; applicative-order
(gcd 206 4)
; =>
(if (= 40 4)
    206
    (gcd 40 (redmainder 206 40)))
; =>
(gcd 40 (redmainder 206 40))
; =>
(gcd 40 6) ; 1 time
; =>
(gcd 6 4)  ; +1 time
; =>
(gcd 4 2)  ; +1 time
; =>
(gcd 2 0)  ; +1 time
; => 2
; Total: 1+1+1+1=4
