MPI_Init, to initialize MPI  
MPI_Comm_rank to determine process ID number
MPI_Comm_rank to find number of processes
MPI_Reduce to perform reduction operation
MPI_Finalize Shut down MPI

Compile the program
-----
mpicc -O -o foo foo.c to compile the program

Run the program
-----
mpirun -np < p > foo
- -np <> is the number of processes

Submit a batch job
-----

