clc;clear;close all
% ���þ���������Χ
row_sizes = 100:50:300;

% ��ʼ���洢����ʱ�������
time_qr = zeros(size(row_sizes));
time_householder = zeros(size(row_sizes));
time_givens = zeros(size(row_sizes));
time_schmidt = zeros(size(row_sizes));

% ������ͬ�����ľ���
for i = 1:length(row_sizes)
    % �����������
    A = randn(row_sizes(i), row_sizes(i));

    % ���� qr ����ִ��ʱ��
    tic;
    [Q_qr, R_qr] = qr(A);
    time_qr(i) = toc;

    % ���� Householder �任ִ��ʱ��
    tic;
    [Q_householder, R_householder] = qr_householder(A);
    time_householder(i) = toc;

    % ���� Givens �任ִ��ʱ��
    tic;
    [Q_givens, R_givens] = qr_givens(A);
    time_givens(i) = toc;

    % ���� Schmidt ������ִ��ʱ��
    tic;
    [Q_schmidt, R_schmidt] = qr_schmidt(A);
    time_schmidt(i) = toc;
end

% ����ͼ��
figure;
plot(row_sizes, time_qr, '-o', 'DisplayName', 'QR');
hold on;
plot(row_sizes, time_householder, '-o', 'DisplayName', 'Householder');
plot(row_sizes, time_givens, '-o', 'DisplayName', 'Givens');
plot(row_sizes, time_schmidt, '-o', 'DisplayName', 'Schmidt');
xlabel('��������');
ylabel('����ʱ�� (��)');
title('���ַ�������ʱ������������仯�ıȽ�');
legend;
grid on;
