close all 
%Define problem parameterts

L = 65; % number of grid points in each direction
[X, Y] = meshgrid(linspace(0, 1, L-1), linspace(0, 1, L-1));

f = rhs_func(X,Y);
u_exact = exact_soultion(x,y);

%Set up the initial guess

uo = zeros(L-1,L-1);
disp(size(uo))

%Set up multigrid parameters
Ncycles = 4;
Npre = 2;
Npost = 2;

disp(size(f))
%disp(f)




% Solve using multigrid V -cycle with Jacobi smoother and bilinear
% interpolation

%u = multigrid_v_cycle_jacobi(uo, f, L, Ncycles, Npre, Npost);

% Plot numerical solution and exact solution

% 
% figure;
% subplot(1, 2, 1);
% surf(X, Y, u);
% title('Numerical solution');
% xlabel('x');
% ylabel('y');
% zlabel('u');
% subplot(1, 2, 2);
% surf(X, Y, u_exact(X, Y));
% title('Exact solution');
% xlabel('x');
% ylabel('y');
% zlabel('u');
% 
