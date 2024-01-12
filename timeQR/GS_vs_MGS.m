clc;clear;close all
compare_gs_mgs(5);
function compare_gs_mgs(n)
    % 生成一个随机矩阵
    A = randn(n);

    % GS分解
    tic;
    [Q_gs, R_gs] = gs(A);
    time_gs = toc;

    % MGS分解
    tic;
    [Q_mgs, R_mgs] = mgs(A);
    time_mgs = toc;

    % 打印结果
    disp('Original Matrix A:');
    disp(A);
    disp('GS Decomposition:');
    disp('Q_gs:');
    disp(Q_gs);
    disp('R_gs:');
    disp(R_gs);


    disp('---------------------');

    disp('MGS Decomposition:');
    disp('Q_mgs:');
    disp(Q_mgs);
    disp('R_mgs:');
    disp(R_mgs);
  
end



% GS算法
function [Q, R] = gs(A)
    [m, n] = size(A);
    Q = zeros(m, n);
    R = zeros(n, n);

    for k = 1:n
        Q(:, k) = A(:, k);

        for j = 1:k-1
            R(j, k) = Q(:, j)' * Q(:, k);
            Q(:, k) = Q(:, k) - R(j, k) * Q(:, j);
        end

        R(k, k) = norm(Q(:, k));
        Q(:, k) = Q(:, k) / R(k, k);
    end
end

% MGS算法
function [Q, R] = mgs(A)
    [m, n] = size(A);
    Q = zeros(m, n);
    R = zeros(n, n);

    for k = 1:n
        Q(:, k) = A(:, k);

        for j = 1:k-1
            R(j, k) = Q(:, j)' * Q(:, k);
            Q(:, k) = Q(:, k) - R(j, k) * Q(:, j);
        end

        R(k, k) = norm(Q(:, k));
        Q(:, k) = Q(:, k) / R(k, k);
    end
end


