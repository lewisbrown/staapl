

all: pk2serial

clean:
	rm -rf *~ *.o pk2serial hidraw


pk2serial: pk2serial.c
	$(CC) -g -Wall -Os pk2serial.c -lusb -o pk2serial

hidraw: hidraw.c
	$(CC) hidraw.c -o hidraw