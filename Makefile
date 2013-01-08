GHC=ghc-6.12.1

libffi-example.so: Example.o wrapper.o Example_stub.o
	$(GHC) -o $@ -shared -dynamic -fPIC $^ -lHSrts-ghc6.12.1

Example_stub.c Example_stub.h Example.o: Example.hs
	$(GHC) -c -dynamic -fPIC Example.hs

Example_stub.o: Example_stub.c
	$(GHC) -c -dynamic -fPIC Example_stub.c

wrapper.o: wrapper.c Example_stub.h
	$(GHC) -c -dynamic -fPIC wrapper.c

clean:
	rm -f *.hi *.o *_stub.[ch]

clean-all:
	rm -f *.hi *.o *_stub.[ch] *.so
