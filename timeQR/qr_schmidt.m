function [Q, R] = qr_schmidt(A)
    % 输入参数：
    % A: 待分解的矩阵
    
    [m, n] = size(A);
    Q = zeros(m, n); % 初始化正交矩阵 Q
    R = zeros(n);    % 初始化上三角矩阵 R
    
    for j = 1:n
        v = A(:, j);
        for i = 1:j-1
            % 对每个已经处理过的列进行正交化
            R(i, j) = Q(:, i)' * A(:, j);
            v = v - R(i, j) * Q(:, i);
        end
        R(j, j) = norm(v); % R的对角线元素是v的模长
        Q(:, j) = v / R(j, j); % 归一化v作为Q的列向量
    end
end
