

function u = direct_solve(A, f, L)
% Solves the linear system A*u=f, where A is an LxL tridiagonal matrix and f
% is a vector of length L, using the Thomas algorithm.
%
% Inputs:
% A - An LxL tridiagonal matrix
% f - A vector of length L
% L - The size of the linear system
%
% Outputs:
% u - The solution to the linear system A*u=f
if L == 2
    u = A\f;
else
    % Initialize variables
    alpha = zeros(L, 1);
    beta = zeros(L, 1);
    u = zeros(L, 1);

    % Forward sweep
    alpha(2) = A(2, 2);
    if alpha(2) == 0
    alpha(2) = 1e-10; % Set to a small value to avoid division by zero
    end
    beta(2) = f(2) / alpha(2);
    for i = 3:L
        alpha(i) = A(i, i) - A(i, i-1)*A(i-1, i)/alpha(i-1);
        beta(i) = (f(i) - A(i, i-1)*beta(i-1))/alpha(i);
    end

    % Backward sweep
    u(L) = beta(L);
    for i = L-1:-1:2
        u(i) = beta(i) - A(i, i+1)*u(i+1)/alpha(i);
    end
    u(1) = beta(1);
end
end

