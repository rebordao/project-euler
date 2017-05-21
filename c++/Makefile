# example: make run problem=32

_glib = `pkg-config --cflags --libs glib-2.0`

# gcc -c $(internal_deps) -lm $(_glib)  -Wall
internal_deps = ../c/includes/common.c ../c/includes/primes.c
build_deps = gcc -c $(internal_deps) -lm $(_glib) -o c_lib.o -Wall
compile_and_run = g++ $(internal_deps) -Wall -o $(1).o $(1).cpp $(_glib) -lm && time ./$(1).o && rm $(1).o
compile_and_run_mp = g++ $(internal_deps) -Wall -o $(1).o $(1).cpp $(_glib) -lm -fopenmp -lgomp && time ./$(1).o && rm $(1).o


run:
	$(call compile_and_run,$(problem))

run_mp:
	$(call compile_and_run_mp,$(problem))
