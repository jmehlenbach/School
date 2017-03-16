#include <mpi.h>
#include <stdio.h>

int main (int argc, char *argv[]){
	int i;
	int id;
	int p;
	
	MPI_Init(&argc,&argv);
	MPI_Comm_size (MPI_COMM_WORLD, &p);
	MPI_Comm_rank (MPI_COMM_WORLD, &id);
	
	printf("Process %d is done\n", id);
	printf("hello world");
	fflush (stdout);
	
	MPI_Finalize();
	
	return 0;
}