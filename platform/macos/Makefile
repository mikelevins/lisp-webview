exe: dylib
	c++ test_webview.c -std=c++11 -framework WebKit webview.dylib -o test_webview

dylib:
	c++ version.c -dynamiclib -fPIC -std=c++11 -framework WebKit -o webview.dylib 

clean:
	rm -f test_webview webview.dylib
	rm -f *~
