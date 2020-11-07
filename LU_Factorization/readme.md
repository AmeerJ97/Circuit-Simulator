# LU factorization function 
Takes in input of a square matrix A and decomposes it providing the Lower (L) and Upper (U) Matricies. Such that:
A = LU
## Calling convention
Called from the MATLAB terminal using LU_Factorization(A), where A is a square matrix. 
Example: LU_Factorization([1 2 3 ; 1 2 3 ; 1 2 3])

## Computational Relevance
This function is useful as matrix inversion is not numerically stable for certain sizes of the input matrix. Furthermore, LU decomposition makes solving any linear systems computationally much faster.
