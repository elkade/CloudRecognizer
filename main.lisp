(DEFUN FACTORIAL (N)
(COND
((= N 0) 1)
(T (* N (FACTORIAL (- N 1))))
))

;;;(print (factorial 5))

(load "db.lisp")
(princ data)
;;;(print (car (car data)))

(defun node-name (node) (car node))
(defun node-pos (node) (car (cdr node)))
(defun node-neg (node) (car (cdr (cdr node))))

(defun add_elem (_node _name _pos _neg)
	(cond
		((null _node) (cond
				((null (car _pos)) (list Nil _name))
				(T (list (car _pos) (add_elem Nil _name (remove (car _pos) _pos) _neg) Nil))
			))
		((null (car _node)) _node)
		((null (find _pos (car _node)))
			  (list (node-name _node) (add_elem (car (cdr _node)) _name (remove (car _node) _pos ) _neg) Nil))
		(T _node)
	)
)

(defun make-tree (_tree _data)
(cond ((null _data) _tree)
	(T (make-tree (add_elem _tree (node-name (car data)) (node-pos (car data)) (node-neg (car data)))(cdr _data)))
	)
) 

(trace add_elem)

(setq tree (make-tree Nil data))

(defun test (node)
	(cond
		((null node) Nil)
		((null (car node)) (car (cdr node)))
		(T (print (car node)) (setq ans (read)) 
			
			(cond
			((string-equal "Y" ans) (test (car (cdr node))) )
			(T (test (car (cdr (cdr node)))))
		))
	)
)
(print (test tree))

(defun save_rule ()
(setq suffix (read))
(with-open-file
	(str "db.lisp" :direction :output :if-exists :append)
	(format str "~%(setq data (append data (list ~%~a~%)))" suffix))
	)
;(save_rule)