

function x = jacobi(A,b,x0,steps,omega)
% Jacobi smoother
% INPUT:   A      matrix
%          b      right hand side
%          x0     initial guess
%          steps  number of iteration steps
%          omega  relaxation parameter
% OUTPUT:  x      approximate solution

D = diag(A);
inv_D = 1./D;
x = x0;
for k = 1:steps
    x = x + omega*inv_D.*(b - A*x);
end
