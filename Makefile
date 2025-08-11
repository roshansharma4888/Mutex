
all:xchg.asm.o xchg.o
	gcc $^ -o xchg.out -lm
	
xchg.o:xchg.c
	gcc -c $< -o $@

xchg.asm.o:xchg.asm		
	nasm -f elf64 -g $< -o $@

clean:
	rm -fr xchg.o
	rm -fr xchg.asm.o
	rm -fr xchg.out