clc;clear;close all
% 设置矩阵行数范围
row_sizes = 100:50:300;

% 初始化存储运行时间的数组
time_qr = zeros(size(row_sizes));
time_householder = zeros(size(row_sizes));
time_givens = zeros(size(row_sizes));
time_schmidt = zeros(size(row_sizes));

% 遍历不同行数的矩阵
for i = 1:length(row_sizes)
    % 生成随机矩阵
    A = randn(row_sizes(i), row_sizes(i));

    % 测量 qr 函数执行时间
    tic;
    [Q_qr, R_qr] = qr(A);
    time_qr(i) = toc;

    % 测量 Householder 变换执行时间
    tic;
    [Q_householder, R_householder] = qr_householder(A);
    time_householder(i) = toc;

    % 测量 Givens 变换执行时间
    tic;
    [Q_givens, R_givens] = qr_givens(A);
    time_givens(i) = toc;

    % 测量 Schmidt 正交化执行时间
    tic;
    [Q_schmidt, R_schmidt] = qr_schmidt(A);
    time_schmidt(i) = toc;
end

% 绘制图表
figure;
plot(row_sizes, time_qr, '-o', 'DisplayName', 'QR');
hold on;
plot(row_sizes, time_householder, '-o', 'DisplayName', 'Householder');
plot(row_sizes, time_givens, '-o', 'DisplayName', 'Givens');
plot(row_sizes, time_schmidt, '-o', 'DisplayName', 'Schmidt');
xlabel('矩阵行数');
ylabel('运行时间 (秒)');
title('四种方法运行时间随矩阵行数变化的比较');
legend;
grid on;
