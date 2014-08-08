all: ios osx

ios: clean_ios
	make -f Makefile.ios

osx: clean_osx
	make -f Makefile.osx

clean: 
	rm -rf ./build

clean_ios:
	make -f Makefile.ios clean

clean_osx: 
	make -f Makefile.osx clean
