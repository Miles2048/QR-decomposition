clc;clear;close all
% ����һ��ʾ������
A = randn(500, 500);

% ʹ��qr��������Givens QR�ֽⲢ����ʱ��
tic;
[Q_qr, R_qr] = qr(A, 0);
time_qr = toc;

% ʹ��Givens�任����QR�ֽⲢ����ʱ��
tic;
[Q_givens, R_givens] = qr_givens(A);
time_givens = toc;

% ʹ��Housholder�任����QR�ֽⲢ����ʱ��
tic;
[Q_householder, R_householder] = qr_householder(A);
time_householder = toc;

% ʹ��Schmidt����������QR�ֽⲢ����ʱ��
tic;
[Q_schmidt, R_schmidt] = qr_schmidt(A);
time_schmidt = toc;

% ��ʾִ��ʱ��
disp('qr����ִ��ʱ��:');
disp(time_qr);

disp('Givens�任ִ��ʱ��:');
disp(time_givens);

disp('HouseHolder�任ִ��ʱ��:');
disp(time_givens);

disp('Schmidt������ִ��ʱ��:');
disp(time_schmidt);
