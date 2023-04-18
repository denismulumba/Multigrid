function u = direct_solve(f, h)
% Solves the 2D Poisson problem using direct solver with Dirichlet boundary conditions
% f: the right-hand side of the Poisson equation
% h: the grid spacing
% u: the solution of the Poisson equation

% Define the domain and grid size
% domain size
L = 65;
[X,Y] = meshgrid(linspace(0, 1, L-1), linspace(0, 1, L-1));

% Construct the coefficient matrix A and right-hand side vector f
A = zeros((L-1)*(L-1));
for i = 2:L-1 % interior points
    for j = 2:L-1
        k = (i-1)*L + j;
        A(k, k) = -4/h^2;
        A(k, k-1) = 1/h^2;
        A(k, k+1) = 1/h^2;
        A(k, k-L) = 1/h^2;
        A(k, k+L) = 1/h^2;
        f(k) = f(X(i,j), Y(i,j)); % evaluate f at (x_i, y_j)
    end
end

% Set Dirichlet boundary conditions
for j = 1:N % bottom and top boundaries
    k = j;
    A(k, k) = 1;
    f(k) = 0;
    k = (L-1)*L + j;
    A(k, k) = 1;
    f(k) = 0;
end
for i = 2:L-1 % left and right boundaries
    k = (i-1)*L + 1;
    A(k, k) = 1;
    f(k) = 0;
    k = i*L;
    A(k, k) = 1;
    f(k) = 0;
end

% Solve the system of linear equations
u = A\f;

% Reshape the solution vector into a 2D array
u = reshape(u, L, L);
end