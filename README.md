/!\ This is only for educationnal purpose /!\

I don't recommende to use these functions in C, I did not handle some error cases (overflow, malloc failed, ).
If you read french comments can help you understand how assembly works.
The functions works and can be exported in C.

Example of exporting a function in C :

Create the .obj file
	nasm -f win64 ft_strlen.asm

And compile with your .c file
	x86_64-w64-mingw32-gcc main.c ft_strlen.obj -o prog.exe

I recommend for linux user to use wine
	wine prog.exe

Example of main.c :

	#include <stdio.h>

	// Don't forget to add the prototype of the function, they are in comment in the .asm file
	int ft_strlen(char *s);

	int main(int argc, char ** argv)
	{
		char str[] = "Bonjour a tous";
		int size = ft_strlen(str);
		printf("Size of %s is %d\n", str, size);
		return 0;
	}
