haskell-from-python
===================

Example how to call Haskell from Python easily (using ctypes.cdll.LoadLibrary).

Originally from: https://bitbucket.org/darq/haskellfrompython


How to run the example
----------------------

Use `make` to compile the Haskell and C helper code.

Then run `python program.py` to run the example.

You might need to adjust some paths or versions in the `Makefile`.


Explanation
-----------

The Haskell function we want to call is `fibonacci :: Int -> Int` in `Example.hs`, and there is corresponding FFI function `fibonacci_hs`.

This Haskell code is compiled into a `libffi-example.so` object file loaded with `ctypes.cdll.LoadLibrary` in Python.
On the returned object, you can then call `fibonacci_hs(5)`.

Because the main entry point is now from Python instead from Haskell, we have to start the Haskell runtime system ourselves.
There is a small C wrapper `wrapper.c` to do that which is compiled into the object file together with the Haskell code.


### Removing the C wrapper

You can also entirely remove the C wrapper, if you like, and immediately call from Python:

```python
lib.hs_init(0, 0)        # Instead of lib.example_init()
# ...
lib.hs_exit()            # Instead of lib.example_exit()
```

It is your choice if you prefer this; the mediating C file type-checks it agains `HsFFI.h` so that you don't forget the `(0, 0)` arguments (this would result in a segfault) and that you get a compile-time error in case one of these functions changes in future.
