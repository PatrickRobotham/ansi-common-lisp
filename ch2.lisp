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

;; EXERCISE SIX:
;; What could occur in place of the x in each of the following exchanges?
;; (a)
(car (x cdr `(a (b c) d))) ;; returns b

;; (b)
(x 13 (/ 1 0)) ;; returns 13

;; (c)
(x #'list 1 nil) ;; returns (1)

;; (a) car, (b) or, (c) apply

;; EXERCISE SEVEN:
;; Using only operators introduced in this chapter, define a function that
;; takes a list as an argument and returns true if one of its elements is a
;; list.

(defun has-list (lst)
  (if (null lst)
      nil
      (if (listp (car lst))
          t
          (has-list (cdr lst)))))

(has-list '(1 (2 3) 4)) ;; returns t
(has-list '(1 2)) ;; returns nil

;; EXERCISE EIGHT:
;; Give iterative and recursive definitions of a function that
;; (a) takes a positive integer and prints that many dots.
;; (b) takes a list and returns the number of times the symbol 'a' occurs in it.

;; (a) iterative
(defun ndots (n)
  (do ((i 1 (+ i 1)))
      ((> i n) (format t "~%"))
      (format t ".")))
;; (a) recursive
(defun ndots (n)
  (if (<= n 0)
      (format t "~%")
      (or (format t ".")
          (ndots (- n 1)))))

;; (b) iterative
(defun count-a (lst)
  (let ((len 0))
    (dolist (obj lst)
      (if (eql obj 'a)
          (setf len (+ len 1))
        nil))
    len))
;; (b) recursive
(defun count-a (lst)
  (if (null lst)
      0
      (if (eql 'a (car lst))
          (let ((count (count-a (cdr lst))))
            (+ count 1))
        0)))
