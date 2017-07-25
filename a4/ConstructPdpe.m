function [P, d, p, e] = ConstructPdpe(G)
% Get size of matrix G
[row_cnt, col_cnt] = size(G);
% Init. P, d, p, e
P = sparse(row_cnt, col_cnt);
d = sparse(row_cnt, 1);
p = sparse(ones(row_cnt, 1) / row_cnt);
e = sparse(ones(row_cnt, 1));
% Set values
for j = 1:1:col_cnt
    % Get the count of all links from node j
    link_cnt = full(sum(G(:,j)));
    if link_cnt ~= 0
        for i = 1:1:row_cnt
            is_link = full(G(i, j));
            if is_link ~= 0
                P(i, j) = 1.0 / link_cnt;
            end
        end
    else
        % node j is a dead end
        d(j, 1) = 1;
    end
end
        
