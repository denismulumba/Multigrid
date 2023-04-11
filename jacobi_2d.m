

function u = jacobi_2d(u, f, dx, dy, max_iters)
% Jacobi method for smoothing a 2D poisson problem
% u: initial guess for solution
% f: right hand side of poisson problem
% dx: grid spacing in x-direction
% dy: grid spacing in y-direction
% max_iters: maximum number of iterations
    
    [m,n] = size(u);
    for iter = 1:max_iters
        u_old = u;
        for i = 2:m-1
            for j = 2:n-1
                u(i,j) = (1/4) * (u_old(i+1,j) + u_old(i-1,j) + u_old(i,j+1) + u_old(i,j-1) - dx^2*dy^2*f(i,j));

            end
        end
    end
end




