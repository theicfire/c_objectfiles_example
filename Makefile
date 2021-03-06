all:
	@echo "Pick: static, dynamic1, dynamic2"

# -fPIC not needed anywhere, but (some) other programs like to have it (for some unkown reason to me)
static:
	gcc -Wall -fPIC -c sweet.c
	ar -cvq libsweet.a sweet.o
	@# List with ar -t libsweet.a... woahh note if we don't "make clean" the libsweet.a will just append
	@# the sweet.o. There will be multiple entries for it.
	gcc -o yaa main.c -L. -lsweet
	./yaa

dynamic1:
	gcc -Wall -fPIC -c sweet.c
	gcc -shared -o libsweet.so sweet.o
	gcc -o yaa main.c -L. -Wl,-rpath=`pwd` -lsweet
	./yaa

dynamic2:
	gcc -Wall -fPIC -c sweet.c
	gcc -shared -o libsweet.so sweet.o
	gcc -o yaa main.c -L. -lsweet

	@echo "====Note I have to change the library path!===="
	LD_LIBRARY_PATH=`pwd`:$LD_LIBRARY_PATH ./yaa



clean:
	rm -f *.a *.so *.o yaa
