%ECSE 472 Assignment 1 Question 2 : LU Factorization Function
%Ameer Ibrahim Osman 260682723
function LU = LU_factorization(A)
%%
%Finding L & U
n = size(A,1);  %Obtaining size of A's first dimension, assuming A is a square matrix
U = A;          %Intializing U as A
L = eye(n);     %Initializing L as Identity matrix

for k=1 : n-1
    for j=k+1 : n
        if U(k,k) == 0
            %Do nothing to handle dividing by 0
        elseif U(k,k) ~= -1
            %Selecting elements and dividing by pivot "U(k,k)" and 
            %storing in identity matrix i.e our "E" matricies that form L
            L(j,k) = U(j,k) ./ U(k,k);    
            %Subtracting obtained E matrix (so far)for that selected element 
            %and scaling for specific column element of U matrix
            U(j,k:n) = U(j,k:n) - L(j,k) .* U(k,k:n); 
    end
end
disp("L Matrix is:")
disp(L)
disp("U Matrix is:")
disp(U)

end
