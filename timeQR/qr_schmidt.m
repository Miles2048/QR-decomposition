function [Q, R] = qr_schmidt(A)
    % ���������
    % A: ���ֽ�ľ���
    
    [m, n] = size(A);
    Q = zeros(m, n); % ��ʼ���������� Q
    R = zeros(n);    % ��ʼ�������Ǿ��� R
    
    for j = 1:n
        v = A(:, j);
        for i = 1:j-1
            % ��ÿ���Ѿ���������н���������
            R(i, j) = Q(:, i)' * A(:, j);
            v = v - R(i, j) * Q(:, i);
        end
        R(j, j) = norm(v); % R�ĶԽ���Ԫ����v��ģ��
        Q(:, j) = v / R(j, j); % ��һ��v��ΪQ��������
    end
end
