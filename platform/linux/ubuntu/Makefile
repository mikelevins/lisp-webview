exe: so
	c++ test_webview.c `pkg-config --cflags --libs gtk+-3.0 webkit2gtk-4.0` -L. -lwebview -o test-webview

so:
	c++ version.c -shared -fPIC -std=c++11 `pkg-config --cflags --libs gtk+-3.0 webkit2gtk-4.0`  -o libwebview.so

clean:
	rm -f test-lisp-webview webview.so
	rm -f *~
