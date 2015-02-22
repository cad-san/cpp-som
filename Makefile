all: test

clean:
	@if [ -e cpputest/Makefile_using_MakefileWorker ]; \
	then make clean_test; \
	else make clean_release; \
	fi

clean_all: clean cpputest_clean

### for release build
release: clean
	make -f build/release.mk

clean_release:
	make -i -f build/release.mk clean

### for test code
test: cpputest cpputest_ext
	make -f build/test.mk

gcov: cpputest cpputest_ext clean
	make -f build/test.mk CPPUTEST_USE_GCOV=Y gcov

clean_test:
	make -i -f build/test.mk clean

### for cpputest
cpputest: cpputest/lib/libCppUTest.a

cpputest_ext: cpputest/lib/libCppUTestExt.a

cpputest_clean:
	make -i -C cpputest -f Makefile_using_MakefileWorker clean
	make -i -C cpputest -f Makefile_using_MakefileWorker cleanExtensions

cpputest/lib/libCppUTest.a:
	make -i -C cpputest -f Makefile_using_MakefileWorker

cpputest/lib/libCppUTestExt.a:
	make -i -C cpputest -f Makefile_using_MakefileWorker extensions
