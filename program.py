#program.py

from ctypes import *

lib = cdll.LoadLibrary("./libffi-example.so")

lib.example_init()
x=lib.fibonacci_hs(42)
print x
lib.example_exit()

