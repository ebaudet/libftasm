
minima:
	nasm -f macho64 minima.s -o minima.o
	ld minima.o -macosx_version_min 10.12 -lSystem
	./a.out
libc:
	nasm -f macho64 libc.s -o libc.o
	ld libc.o -macosx_version_min 10.12 -lSystem
	./a.out
syscall:
	nasm -f macho64 syscall.s -o syscall.o
	ld syscall.o -macosx_version_min 10.12 -lSystem
	./a.out

.PHONY: exec