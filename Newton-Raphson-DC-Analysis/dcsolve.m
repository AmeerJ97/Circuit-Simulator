function [Xdc dX] = dcsolve(Xguess,maxerr)
% Compute dc solution using newtwon iteration
% input: Xguess is the initial guess for the unknown vector. 
%        It should be the correct size of the unknown vector.
%        maxerr is the maximum allowed error. Set your code to exit the
%        newton iteration once the norm of DeltaX is less than maxerr
% Output: Xdc is the correction solution
%         dX is a vector containing the 2 norm of DeltaX used in the 
%         newton Iteration. the size of dX should be the same as the number
%         of Newton-Raphson iterations. See the help on the function 'norm'
%         in matlab.
global G C b DIODE_LIST
x_g = Xguess;
%Initializing non-linear vector and it's derivative'
df = nlJacobian(x_g);
f = f_vector(x_g);
%Define Phi
phi = G * x_g + f - b;
%Define dPhi
dphi = G + df; 
%Define dx
d_x = - dphi \ phi;
%Tracking number of iterations 
i = 1; 
%Initializing dX with first iteration of NR's d_x
dX(i) = norm(d_x);
while (norm(d_x) > maxerr)
    %updating our new guess
    x_new = x_g + d_x;
    x_g = x_new;
    %updating our phi and dphi matricies
    phi = G * x_g + f_vector(x_g) - b;
    dphi = G + nlJacobian(x_g);
    %updating delta x, the number of iterations, and dX
    d_x = -(dphi)\(phi);
    i = i + 1;
    dX(i) = norm(d_x)
end
% Parsing the final solution which is our updated x guess
Xdc = x_g
dX
