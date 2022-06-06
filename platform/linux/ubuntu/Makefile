all:
	c++ main.cc `pkg-config --cflags --libs gtk+-3.0 webkit2gtk-4.0` -o test-lisp-webview

clean:
	rm -f test-lisp-webview webview.so
	rm -f *~
