GHC=ghc
GHC_RUNTIME_LINKER_FLAG=-lHSrts-ghc7.4.2.so

libffi-example.so: Example.o wrapper.o
	$(GHC) -o $@ -shared -dynamic -fPIC $^ $(GHC_RUNTIME_LINKER_FLAG)

Example_stub.h Example.o: Example.hs
	$(GHC) -c -dynamic -fPIC Example.hs

wrapper.o: wrapper.c Example_stub.h
	$(GHC) -c -dynamic -fPIC wrapper.c

clean:
	rm -f *.hi *.o *_stub.[ch]

clean-all:
	rm -f *.hi *.o *_stub.[ch] *.so


# Runs the example Python program
example: libffi-example.so
	python program.py
