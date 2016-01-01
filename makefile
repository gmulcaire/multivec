CC = gcc
#The -Ofast might not work with older versions of gcc; in that case, use -O2
CFLAGS = -lm -pthread -march=native -Wall -funroll-loops -Ofast -Wno-unused-result
#CFLAGS = -lm -pthread -march=native -Wall -funroll-loops -O1 -Wno-unused-result -DDEBUG

all: bivec multivec word2phrase distance word-analogy compute-accuracy runCLDC

bivec : bivec.c
	$(CC) bivec.c -o bivec $(CFLAGS) #-DDEBUG
multivec : multivec.c
	$(CC) -g multivec.c -o multivec $(CFLAGS) #-DDEBUG
word2phrase : word2phrase.c
	$(CC) word2phrase.c -o word2phrase $(CFLAGS)
distance : distance.c
	$(CC) distance.c -o distance $(CFLAGS)
word-analogy : word-analogy.c
	$(CC) word-analogy.c -o word-analogy $(CFLAGS)
compute-accuracy : compute-accuracy.c
	$(CC) compute-accuracy.c -o compute-accuracy $(CFLAGS)
	chmod +x *.sh
runCLDC : runCLDC.c
	$(CC) runCLDC.c -o runCLDC $(CFLAGS)

clean:
	rm -rf bivec multivec word2phrase distance word-analogy compute-accuracy runCLDC
