(DEFUN FACTORIAL (N)
(COND
((= N 0) 1)
(T (* N (FACTORIAL (- N 1))))
))

;;;(print (factorial 5))

(setq data (list 
	(list 'nimbostratus 'pada_deszcz T 'zaslania_cale T )
	(list 'cumulonimbus 'pada_deszcz T 'zaslania_cale Nil )
))
;;;(print (car (car data)))

(setq tree '("pada_deszcz" '("zaslania_cale" '(Nil "nimbostratus") '(Nil "cumulonimbus")) Nil))

(defun test (node)
	(cond
		((null node) Nil)
		((null (car node)) (car (cdr node)))
		(T (print (car node)) (setq ans (read)) 
			
			(cond
			((string-equal "Y" ans) (test (eval(car (cdr node)))) )
			(T (test (eval(car (cdr (cdr node))))))
		))
	)
)
(print (test tree))