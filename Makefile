sbcl: 
	sbcl --load lisp-webview.asd --eval '(make-test)'
clean:
	rm -f test-lisp-webview
