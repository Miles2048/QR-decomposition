function [Q, R] = qr_householder(A)
    % ���������
    % A: ���ֽ�ľ���
    
    [m, n] = size(A);
    Q = eye(m); % ��ʼ���������� Q
    
    for k = 1:min(m-1, n)
        % ѡ��� k �е�����������
        x = A(k:m, k);
        
        % ���� Householder ����
        v = x + sign(x(1))*norm(x)*eye(length(x), 1);
        v = v / norm(v);
        
        % Ӧ�� Householder �任�� A �� Q
        A(k:m, k:n) = A(k:m, k:n) - 2*v*(v'*A(k:m, k:n));
        Q(k:m, :) = Q(k:m, :) - 2*v*(v'*Q(k:m, :));
    end
    
    R = A; % ���� Householder �任��������Ǿ���
end
