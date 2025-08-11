
all:tls.asm.o tls.o
	gcc $^ -o tls.out -lm
	
tls.o:tls.c
	gcc -c $< -o $@

tls.asm.o:tls.asm		
	nasm -f elf64 -g $< -o $@

clean:
	rm -fr tls.o
	rm -fr tls.asm.o
	rm -fr tls.out