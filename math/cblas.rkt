#lang racket
(require ffi/unsafe ffi/unsafe/define ffi/vector)

(define-ffi-definer define-cblas
  (ffi-lib "libcblas" #:fail #f))

(define-cblas cblas_dswap
  (_fun _int _f64vector _int _f64vector _int -> _void))
(define-cblas cblas_dscal
  (_fun _int _double* _f64vector _int -> _void))
(define-cblas cblas_dcopy
  (_fun _int _f64vector _int _f64vector _int -> _void))
(define-cblas cblas_daxpy
  (_fun _int _double* _f64vector _int _f64vector _int -> _void))
(define-cblas cblas_ddot
  (_fun _int _f64vector _int _f64vector _int -> _double))
(define-cblas cblas_dnrm2
  (_fun _int _f64vector _int -> _double))
(define-cblas cblas_dasum
  (_fun _int _f64vector _int -> _double))
(define-cblas cblas_idamax
  (_fun _int _f64vector _int -> _size))

(provide
  cblas_dswap cblas_dscal cblas_dcopy cblas_daxpy
  cblas_ddot cblas_dnrm2 cblas_dasum cblas_idamax)
