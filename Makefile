CC=cc
CFLAGS=\-o
EXEC=mpiexec

build: main.c
	$(CC) -o3 $(CFLAGS) body3 main.c

local: main.c
	mpicc $(CFLAGS) body3 main.c

clean: cleanOutput
	rm body3

cleanOutput: 
	rm particles_out*.txt

run: local
	$(EXEC) -n 4 ./body3 ./test/partg_5.txt ./particles_out 3 1 -v

runtest: local
	$(EXEC) -n 4 ./body3 ./input.txt ./particles_out 1 0.5 -v
