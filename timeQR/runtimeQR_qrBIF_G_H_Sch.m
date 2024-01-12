clc;clear;close all
% 生成一个示例矩阵
A = randn(500, 500);

% 使用qr函数进行Givens QR分解并测量时间
tic;
[Q_qr, R_qr] = qr(A, 0);
time_qr = toc;

% 使用Givens变换进行QR分解并测量时间
tic;
[Q_givens, R_givens] = qr_givens(A);
time_givens = toc;

% 使用Housholder变换进行QR分解并测量时间
tic;
[Q_householder, R_householder] = qr_householder(A);
time_householder = toc;

% 使用Schmidt正交化进行QR分解并测量时间
tic;
[Q_schmidt, R_schmidt] = qr_schmidt(A);
time_schmidt = toc;

% 显示执行时间
disp('qr函数执行时间:');
disp(time_qr);

disp('Givens变换执行时间:');
disp(time_givens);

disp('HouseHolder变换执行时间:');
disp(time_givens);

disp('Schmidt正交化执行时间:');
disp(time_schmidt);
