# example: make run problem=32

_glib = `pkg-config --cflags --libs glib-2.0`

compile_and_run = gcc includes/common.c -Wall -o $(1).o $(1).c $(_glib) -lm && ./$(1).o && rm $(1).o

run:
	$(call compile_and_run,$(problem))
