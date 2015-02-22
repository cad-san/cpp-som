all: test

clean: clean_test

clean_all: clean cpputest_clean

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
