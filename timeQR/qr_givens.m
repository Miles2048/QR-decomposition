function [Q, R] = qr_givens(A)
    % 输入参数：
    % A: 待分解的矩阵
    
    [m, n] = size(A);
    Q = eye(m); % 初始化正交矩阵 Q
    
    for j = 1:min(n, m-1)
        for i = m:-1:(j+1)
            % 选择非对角元素进行Givens旋转
            if A(i, j) ~= 0
                % 计算 Givens 旋转矩阵
                [c, s] = givens_rotation(A(j, j), A(i, j));
                
                % 应用 Givens 旋转矩阵到 A 和 Q
                A([j, i], j:n) = [c, -s; s, c] * A([j, i], j:n);
                Q([j, i], :) = [c, -s; s, c] * Q([j, i], :);
            end
        end
    end
    
    R = A; % 经过 Givens 变换后的上三角矩阵
end

function [c, s] = givens_rotation(a, b)
    % 计算 Givens 旋转矩阵的参数 c 和 s，使得 [c, -s; s, c] * [a; b] = [r; 0]
    if b == 0
        c = 1;
        s = 0;
    else
        if abs(b) > abs(a)
            r = a / b;
            s = 1 / sqrt(1 + r^2);
            c = s * r;
        else
            r = b / a;
            c = 1 / sqrt(1 + r^2);
            s = c * r;
        end
    end
end
