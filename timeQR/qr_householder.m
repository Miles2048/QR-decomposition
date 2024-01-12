function [Q, R] = qr_householder(A)
    % 输入参数：
    % A: 待分解的矩阵
    
    [m, n] = size(A);
    Q = eye(m); % 初始化正交矩阵 Q
    
    for k = 1:min(m-1, n)
        % 选择第 k 列到最后的列向量
        x = A(k:m, k);
        
        % 计算 Householder 向量
        v = x + sign(x(1))*norm(x)*eye(length(x), 1);
        v = v / norm(v);
        
        % 应用 Householder 变换到 A 和 Q
        A(k:m, k:n) = A(k:m, k:n) - 2*v*(v'*A(k:m, k:n));
        Q(k:m, :) = Q(k:m, :) - 2*v*(v'*Q(k:m, :));
    end
    
    R = A; % 经过 Householder 变换后的上三角矩阵
end
