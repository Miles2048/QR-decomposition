function [Q, R] = qr_givens(A)
    % ���������
    % A: ���ֽ�ľ���
    
    [m, n] = size(A);
    Q = eye(m); % ��ʼ���������� Q
    
    for j = 1:min(n, m-1)
        for i = m:-1:(j+1)
            % ѡ��ǶԽ�Ԫ�ؽ���Givens��ת
            if A(i, j) ~= 0
                % ���� Givens ��ת����
                [c, s] = givens_rotation(A(j, j), A(i, j));
                
                % Ӧ�� Givens ��ת���� A �� Q
                A([j, i], j:n) = [c, -s; s, c] * A([j, i], j:n);
                Q([j, i], :) = [c, -s; s, c] * Q([j, i], :);
            end
        end
    end
    
    R = A; % ���� Givens �任��������Ǿ���
end

function [c, s] = givens_rotation(a, b)
    % ���� Givens ��ת����Ĳ��� c �� s��ʹ�� [c, -s; s, c] * [a; b] = [r; 0]
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
