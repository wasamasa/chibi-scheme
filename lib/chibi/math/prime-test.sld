(define-library (chibi math prime-test)
  (export run-tests)
  (import (scheme base) (chibi math prime) (chibi test))
  (begin
    (define (run-tests)

      (test-begin "prime")

      (test 7 (modular-inverse 3 10))
      (test 4 (modular-inverse 3 11))
      (test 27 (modular-inverse 3 40))
      (test 43 (modular-inverse 3 64))

      (test #f (prime? 1))
      (test #t (prime? 2))
      (test #t (prime? 3))
      (test #f (prime? 4))
      (test #t (prime? 5))
      (test #f (prime? 6))
      (test #t (prime? 7))
      (test #f (prime? 8))
      (test #f (prime? 9))
      (test #f (prime? 10))
      (test #t (prime? 11))

      (test 2 (nth-prime 0))
      (test 3 (nth-prime 1))
      (test 5 (nth-prime 2))
      (test 7 (nth-prime 3))
      (test 11 (nth-prime 4))
      (test 997 (nth-prime 167))
      (test 1009 (nth-prime 168))
      (test 1013 (nth-prime 169))

      (test 2 (prime-above 1))
      (test 3 (prime-above 2))
      (test 5 (prime-above 3))
      (test 5 (prime-above 4))
      (test 7 (prime-above 5))
      (test 907 (prime-above 888))
      (test 911 (prime-above 907))
      (test-not (prime-below 2))
      (test 2 (prime-below 3))
      (test 3 (prime-below 4))
      (test 3 (prime-below 5))
      (test 5 (prime-below 6))
      (test 5 (prime-below 7))
      (test 797 (prime-below 808))

      (test 1 (totient 2))
      (test 2 (totient 3))
      (test 2 (totient 4))
      (test 4 (totient 5))
      (test 2 (totient 6))
      (test 6 (totient 7))
      (test 4 (totient 8))
      (test 6 (totient 9))
      (test 4 (totient 10))

      (test #f (perfect? 1))
      (test #f (perfect? 2))
      (test #f (perfect? 3))
      (test #f (perfect? 4))
      (test #f (perfect? 5))
      (test #t (perfect? 6))
      (test #f (perfect? 7))
      (test #f (perfect? 8))
      (test #f (perfect? 9))
      (test #f (perfect? 10))
      (test #t (perfect? 28))
      (test #t (perfect? 496))
      (test #t (perfect? 8128))

      (test '() (factor 1))
      (test '(2) (factor 2))
      (test '(3) (factor 3))
      (test '(2 2) (factor 4))
      (test '(5) (factor 5))
      (test '(2 3) (factor 6))
      (test '(7) (factor 7))
      (test '(2 2 2) (factor 8))
      (test '(3 3) (factor 9))
      (test '(2 5) (factor 10))
      (test '(11) (factor 11))
      (test '(2 2 3) (factor 12))
      (test '(2 3 3) (factor 18))
      (test '(2 2 2 3 3) (factor 72))
      (test '(3 3 3 5 7) (factor 945))
      (test-error (factor 0))

      (test 975 (aliquot 945))

      (do ((i 3 (+ i 2)))
          ((>= i 101))
        (test (number->string i) (prime? i)
          (probable-prime? i)))

      (test #t (probable-prime? 4611686020149081683))
      (test #t (probable-prime? 4611686020243253179))
      (test #t (probable-prime? 4611686020243253219))
      (test #t (probable-prime? 4611686020243253257))
      (test #f (probable-prime? 4611686020243253181))
      (test #f (probable-prime? 4611686020243253183))
      (test #f (probable-prime? 4611686020243253247))

      (test 5
          (modular-expt 7670626353261554806
                        5772301760555853353
                        (* 2936546443 3213384203)))

      (test "Miller-Rabin vs. Carmichael prime"
            #t (miller-rabin-composite? 118901521))

      (test-end))))
