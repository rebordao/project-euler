# example: make run problem=32

_glib = `pkg-config --cflags --libs glib-2.0`

internal_deps = includes/common.c includes/primes.c
compile_and_run = gcc $(internal_deps) -Wall -o $(1).o $(1).c $(_glib) -lm && time ./$(1).o && rm $(1).o
compile_and_run_mp = gcc $(internal_deps) -Wall -o $(1).o $(1).c $(_glib) -lm -fopenmp -lgomp && time ./$(1).o && rm $(1).o


run:
	$(call compile_and_run,$(problem))

run_mp:
	$(call compile_and_run_mp,$(problem))
