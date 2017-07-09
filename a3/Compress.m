function [Y, drop] = Compress(X, tol)
% Block size
BSIZE = 8;
% Get size of input matrix X
[row_cnt, col_cnt] = size(X);
% Pre-allocate memory
Y = zeros(row_cnt, col_cnt);
% Count of dropped blocks
drop_cnt = 0;
% Compress Process
for i = 1:BSIZE:row_cnt
    for j = 1:BSIZE:col_cnt
        % Get a block from input matrix
        in_block = X(i:i+BSIZE-1, j:j+BSIZE-1);
        % Calculate 2D FFT
        out_block = fft2(in_block);
        % Calculate threadhold
        abs_out_block = abs(out_block);
        F_max = max(abs_out_block(:));
        threshold = F_max*tol;
        % Dropping
        for k = 1:BSIZE
            for l = 1:BSIZE
                if abs(out_block(k,l)) < threshold
                    % Satisfy the condition, drop the DFT value of this pixel
                    out_block(k,l) = 0;
                    drop_cnt = drop_cnt + 1;
                end
            end
        end
        % Calculate 2D IFFT
        comp_block = ifft2(out_block);
        % Put the compressed pixel values to output
        Y(i:i+BSIZE-1, j:j+BSIZE-1) = real(comp_block);
    end
end
% calculate drop ratio
drop = double(drop_cnt)/double(row_cnt*col_cnt);
end