# Description
This section includes a Jacobian function to compute the derivative of a nonlinear function (Function that includes e.g diodes) as well as perform the DC analysis using the Newton-Raphson Method.
# Circuit components
This function can perform the DC analysis on Resistors, Capacitors, Voltage Sources, Current Sources, and Diodes. 
# Calling Convention
Modify the Circuit_diodeck1.m file to include the circuit components.
## Examples
vol(Node1, Node2, Value)   
res(Node1,Node2,Value)  
res(Node1,Node2,Value)  
cap(Node1,Node2,Value);  
diode('Diode Name',Node1,Node22,Is,Vt);  
