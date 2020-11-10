function J = nlJacobian(X)
% Compute the jacobian of the nonlinear vector of the MNA equations as a 
% function of X
% input: X is the current value of the unknown vector.
% output: J is the jacobian of the nonlinear vector f(X) in the MNA
% equations. The size of J should be the same as the size of G.

global G DIODE_LIST
n = size (G);     %Size of the Jacobian matrix
J = zeros(n);    %Jacobian matrix assuming G is a square matrix
NbDiodes = size(DIODE_LIST, 2);

for i = 1: NbDiodes     %Iterating over each diode
    %Each diodes variables
    v1 = X(DIODE_LIST(i).node1);
    v2 = X(DIODE_LIST(i).node2);
    Vt = DIODE_LIST(i).Vt;  
    Is = DIODE_LIST(i).Is;
    %Populate Jacobian matrix, the diode node dictates the row to
    %populate
    if((DIODE_LIST(i).node1 ~= 0) && (DIODE_LIST(i).node2 ~=0)) 
        %The derivative will be this I current multiplied by Vt, the polarity
        %will be determined by the node. There are 4 entries for 2 nodes
        I1 = Is * (exp((v1-v2)/Vt));
        I2 = - I1;
        J(DIODE_LIST(i).node1,DIODE_LIST(i).node1) = (1/Vt) * I1;
        J(DIODE_LIST(i).node1,DIODE_LIST(i).node2) = (-1/Vt) * I1;
        J(DIODE_LIST(i).node2,DIODE_LIST(i).node1) = (1/Vt) * I2;
        J(DIODE_LIST(i).node2,DIODE_LIST(i).node2) = (-1/Vt) * I2;
    elseif (DIODE_LIST(i).node1 == 0)
        %Similarly, for one node there is 1 entry 
        I3 = Is * (exp(v2)/Vt);
        J(DIODE_LIST(i).node2,DIODE_LIST(i).node2) = (1/Vt) * I3;
    elseif(DIODE_LIST(i).node2 == 0)
        I4 = Is * (exp(v1)/Vt);
        J(DIODE_LIST(i).node1, DIODE_LIST(i).node1) = (1/Vt) * I4;
    end
end
