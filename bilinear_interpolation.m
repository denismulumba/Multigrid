

function u_fine = bilinear_interpolation(u_coarse, u_fine)
% Interpolate solution from coarse to fine grid using bilinear interpolation.

% Extract dimensions of coarse grid
[m_coarse, n_coarse] = size(u_coarse);

% Define dimensions of fine grid
m_fine = 2*m_coarse - 1;
n_fine = 2*n_coarse - 1;

% Initialize fine solution
if nargin == 1
    u_fine = zeros(m_fine, n_fine);
end

% Interpolate values
for i = 1:m_coarse
    for j = 1:n_coarse
        % Coarse indices
        ic = i;
        jc = j;
       
        % Fine indices
        if mod(i, 2) == 0
            i1 = 2*i-1;
            i2 = 2*i+1;
            ic = i/2;
        else
            i1 = 2*i;
            i2 = 2*i;
        end
       
        if mod(j, 2) == 0
            j1 = 2*j-1;
            j2 = 2*j+1;
            jc = j/2;
        else
            j1 = 2*j;
            j2 = 2*j;
        end
       
        % Interpolate
        if i > 1 && i < m_coarse && j > 1 && j < n_coarse
            u_fine(i1,j1) = u_coarse(ic-1,jc-1);
            u_fine(i2,j1) = u_coarse(ic+1,jc-1);
            u_fine(i1,j2) = u_coarse(ic-1,jc+1);
            u_fine(i2,j2) = u_coarse(ic+1,jc+1);
        else
            u_fine(i1,j1) = u_coarse(ic,jc);
        end
    end
end

end
