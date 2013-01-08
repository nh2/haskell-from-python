from ctypes import *


lib = cdll.LoadLibrary("./libffi-example.so")

lib.example_init()

for x in xrange(10):
    print "Haskell fib(%d): %d" % (x, lib.fibonacci_hs(x))

lib.example_exit()

