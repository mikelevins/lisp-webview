sbcl: 
	sbcl --load lisp-webview.asd --eval '(progn (asdf:load-system :lisp-webview)(make-test))'
clean:
	rm -f test-lisp-webview
