#lang racket
(require rackunit rackunit/text-ui srfi/1 math/blas)

(define eps 1e-8)
(define (=. a b) (< (abs (- a b)) eps))
(define (=v a b) (every =. a b))

(define l1-tests
  (test-suite "Tests for Level1 BLAS"
    ; Test for SWAP
    (let ((x (vect 1. 2. 3.))
          (y (vect 4. 5. 6.)))
      (SWAP x y)
      (check =v (vect->list x) '(4. 5. 6.))
      (check =v (vect->list y) '(1. 2. 3.)))
    ; Test for SCAL
    (let ((x (vect 1. 2. 3.)))
      (SCAL 2 x)
      (check =v (vect->list x) '(2. 4. 6.))
      (SCAL 0.5 x)
      (check =v (vect->list x) '(1. 2. 3.)))
    ; Test for COPY
    (let ((x (vect 1. 2. 3.))
          (y (vect 4. 5. 6.)))
      (COPY x y)
      (check =v (vect->list x) '(1. 2. 3.))
      (check =v (vect->list x) '(1. 2. 3.)))
    ; Test for AXPY
    (let ((x (vect 1. 2. 3.))
          (y (vect 9. 8. 7.)))
      (AXPY 0.5 x y)
      (check =v (vect->list x) '(1.0 2.0 3.0))
      (check =v (vect->list y) '(9.5 9.0 8.5))
      (AXPY -1 x y)
      (check =v (vect->list x) '(1.0 2.0 3.0))
      (check =v (vect->list y) '(8.5 7.0 5.5)))
    ; Test for DOT_
    (let ((x (vect 1. 2. 3.))
          (y (vect 4. 5. 6.)))
      (check =. (DOT_ x y) 32.))
    ; Test for NRM2
    (let ((x (vect 3. -4.)))
      (check =. (NRM2 x) 5.))
    ; Test for ASUM
    (let ((x (vect 3. -4.)))
      (check =. (ASUM x) 7.))
    ; Test for IAMX
    (check-eq? (IAMX (vect 5. 8. -11.)) 2)
    (check-eq? (IAMX (vect 5. 11. -8.)) 1)
    ))

(time (run-tests l1-tests))
