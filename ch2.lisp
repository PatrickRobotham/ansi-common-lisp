;; EXERCISE ONE:
;; Describe what happens when the following expressions are evaluated:
;; (a)
(+ (- 5 1) (+ 3 7))
;;     This evaluates to 14
;; (b)
(list 1 (+ 2 3))
;;     This evaluates to (1 5).  (The (+ 1 3) subexpression is evaluated and passed to the list function.)
;; (c)
(if (listp 1) (+ 1 2) (+ 3 4))
;;     This returns 7 (i.e. (+ 3 4))
;; (d)
(list (and (listp 3) t) (+ 1 2))
;;     This evaluates to (nil 3)
;; NB: We can evaluate lisp expressions in emacs by typing C-x C-e.
;;
;; EXERCISE TWO:
;; Give three distinct cons expressions that return (a b c)
;; 1.
(cons `a (cons `b (cons `c nil)))
;; 2.
`(a b c)
;; 3.
(list `a `b `c)
;;
;; EXERCISE THREE:
;; Using car and cdr, define a function to return the fourth element of a list
;;
 (defun fourth (lst)
  (car (cdr (cdr (cdr lst))))
  )
 (fourth `(a b c d))
;;
;; EXERCISE FOUR:
;; Define a function that takes two arguments and returns the greater of the two.
(defun max2 (a b)
  (if (> a b) a b)
  )
(max2 5 6)
(max2 6 5)

;; EXERCISE FIVE:
;; What do these functions do?
;; (a)
(defun enigma (x)
  (and (not (null x))
       (or (null (car x))
           (enigma (cdr x)))))
;; enigma checks if a list has at least one nil in it.
(enigma `(1 nil 2)) ;; returns t
(enigma `(1 2)) ;; returns nil
;; (b)
(defun mystery (x y)
(if (null y)
    nil
    (if (eql (car y) x)
        0
      (let ((z (mystery x (cdr y))))
        (and z (+ z 1))))))
;; mystery finds the position where the first instance of x occurs in y.
;; If x does not occur in y, mystery returns nil.
(mystery 3 `(1 3 3)) ;; returns 1
