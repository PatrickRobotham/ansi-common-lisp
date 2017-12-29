;; EXERCISE ONE: 
;; Describe what happens when the following expressions are evaluated:
;; (a) (+ (- 5 1) (+ 3 7))
;;     This evaluates to 14
;; (b) (list 1 (+ 2 3))
;;     This evaluates to (1 5).  (The (+ 1 3) subexpression is evaluated and passed to the list function.)
;; (c) (if (listp 1) (+ 1 2) (+ 3 4))
;;     This returns 7 (i.e. (+ 3 4))
;; (d) (list (and (listp 3) t) (+ 1 2))
;;     This evaluates to (nil 3
