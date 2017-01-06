(load "lib.lisp")
(setq data (list))
(load "db.lisp")
(setq q "")

(defun BODY () 

	(setq tree (make-tree Nil data))
	(princ tree)

	(print (test tree))

	(print "q to quit")
	(print "n to new rule")
	(print "a to ask again")
	(setq q (read))
	(cond ((string-equal q "N")
		(print "new rule:")
		(save_rule)
		(setq data (list))
		(load "db.lisp")
		)
	)
	)

(loop while (not (string-equal q "Q"))
	do(BODY)
)