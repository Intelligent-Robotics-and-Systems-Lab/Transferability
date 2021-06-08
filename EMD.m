function [x, fval] = EMD(Feature_vec1,Feature_vec2,Weights1,Weights2,Ground_Distance_Function)

    % treat Feature_vec1 as the suppliers (the dirt pile)
    % treat Feature_vec2 as the consumers (the holes) 
    % ground distance matrix d_ij
    d = gdm(Feature_vec1,Feature_vec2,Ground_Distance_Function)
 
    
    % number of feature vectors (m and n) with criteria 
    [m, a] = size(Feature_vec1);
    [n, a] = size(Feature_vec2);

    % inequality constraints
    A1 = zeros(m,m*n);
    A2 = zeros(n,m*n);

    for i_it = 1:m
        for j_it = 1:n
            k = j_it + (i_it-1)*n;
            A1(i_it,k) = 1;
            A2(j_it,k) = 1;
        end
    end
    A = [A1;A2];
    b = [Weights1;Weights2];

    % equality constraints
    Aeq = ones(m+n,m*n);
    beq = ones(m+n,1)*min(sum(Weights1),sum(Weights2));
    
    % lower bound
    lb = zeros(1,m*n);
    % linear programming
    [x,fval] = linprog(d,A,b,Aeq,beq,lb,[]);

    fval = fval/sum(x);
end

function [f] =gdm(F1,F2,Func)
    % number and length of feature vectors
    [m a] = size(F1);
    [n a] = size(F2);
    % ground distance matrix
    for i = 1:m
        for j = 1:n
            f(i, j) = Func(F1(i, 1:a), F2(j, 1:a));
        end
    end
    % gdm in column-vector form
    f = f';
    f = f(:);
end
