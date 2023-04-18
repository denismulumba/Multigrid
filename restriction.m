

function r = restriction(u)
% Restrict a 2D array of grid values to a coarser grid
%using full-weighting restriction
    
    [m,n] = size(u);
    m_coarse = floor((m-1)/2)+1;
    n_coarse = floor((n-1)/2)+1;
    r = zeros(m_coarse, n_coarse);
    
    % loop over coarse grid points
    
    for i = 1:m_coarse
        for j = 1:n_coarse
            % determine indices of neigbouring fine grid points
    
            i1 = 2*i - 1;
            i2 = 2*i;
            j1 = 2*j -1;
            j2 = 2*j;
    
            %compute the restricted value
            r(i,j) = 0.25*(u(i1,j1)+u(i1,j2)+u(i2,j1)+u(i2,j2));
    
        end
    end
end

