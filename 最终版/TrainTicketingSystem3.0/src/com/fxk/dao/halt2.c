#include "syscall.h"
#include "stdio.h"
#include "stdlib.h"
int mystr(char *buffer)
{
	int i;
	for(i=0;i<500;i++)
	{
		if(buffer[i]==0)
			return i;
	}
	return -1;
}
void main()
{
	int fd=0;
	char *filename="a.txt";
	int ByteNum;
	char * buffer="this is test for 2.1 \n";
	char buffersize=mystr(buffer);
	char buf[40];
	create(filename);
	printf("calling 'create(filename)'...");
	printf("done ! \n");
	fd=open(filename);
	printf("calling 'fd=open(filename)'...");
	printf("return value of fd=");
	print("\n");
	write(fd,buffer,buffersize);
	close(fd);
	printf("calling 'write(fd,buffer,buffersize)'...\n");
	fd=open(filename);
	int i;
	ByteNum=read(fd,buf,40);
	printf("calling 'read(fd,buf,40)'...\n");
	printf(buf);
	close(fd);
	halt();
}
