


function F_coarse = restrict(F_fine)
% Restricts the residual from the fine grid to the coarser grid

[m_fine, n_fine] = size(F_fine);

% Define dimensions of coarse grid
m_coarse = floor((m_fine-1)/2) + 1;
n_coarse = floor((n_fine-1)/2) + 1;

% Initialize coarse residual
F_coarse = zeros(m_coarse, n_coarse);

% Restrict values
for i = 1:m_coarse
    for j = 1:n_coarse
        if i == 1 || j == 1 || i == m_coarse || j == n_coarse
            % Coarse grid boundary values
            F_coarse(i,j) = F_fine(2*i-1, 2*j-1);
        else
            % Coarse grid interior values
            F_coarse(i,j) = (1/4)*(F_fine(2*i-1,2*j-1) + F_fine(2*i-2,2*j-1) ...
                             + F_fine(2*i-1,2*j-2) + F_fine(2*i-1,2*j));
        end
    end
end

end
