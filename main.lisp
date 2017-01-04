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

(defun contains (_elem _list)
	(cond
		((null _list) Nil)
		((null (car _list)) Nil)
		((string-equal (car _list) _elem) T)
		(T (contains _elem (cdr _list)))
	)
)

(defun remove-str (_elem _list)
	(cond
		((null _list) Nil)
		((null (car _list)) Nil)
		((string-equal (car _list) _elem) (remove-str _elem (cdr _list)))
		(T (append (list (car _list)) (remove-str _elem (cdr _list))))
	)
)
;(trace remove-str)

;(trace contains)
(defun add_elem (_node _name _pos _neg)
	(cond
		((null _node)
			(cond
				((and (null (car _pos)) (null (car _neg))) (list Nil _name))
				(T (cond 
					((null (car _pos))	(list (car _neg) Nil (add_elem Nil _name _pos (remove-str (car _neg) _neg))))
					(T 					(list (car _pos) (add_elem Nil _name (remove-str (car _pos) _pos) _neg) Nil))
					)
				)
			)
		)
		((null (car _node)) _node)
		((null (contains (car _node) _pos))
			  (list (node-name _node) (node-pos _node) (add_elem (node-neg _node) _name _pos (remove-str (car _node) _neg ))))
		((null (contains (car _node) _neg))
			  (list (node-name _node) (add_elem (node-pos _node) _name (remove-str (car _node) _pos ) _neg) (node-neg _node)))
		(T _node)
	)
)

(defun make-tree (_tree _data)
(cond ((null _data) _tree)
	(T (make-tree (add_elem _tree (node-name (car _data)) (node-pos (car _data)) (node-neg (car _data)))(cdr _data)))
	)
) 

;(trace make-tree)

;(setq tree (add_elem Nil (node-name (car data)) (node-pos (car data)) (node-neg (car data))))
;(setq data (cdr data))
;(princ tree)
(setq tree (make-tree Nil data))
;(setq tree (add_elem tree (node-name (car data)) (node-pos (car data)) (node-neg (car data))))
(princ tree)
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