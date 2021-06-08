%% Function of KL Divergence
% dist = KLDiv(P,Q) Kullback-Leibler divergence of two discrete probability
% distributions.
% P and Q  are automatically normalised to have the sum of one on rows
% have the length of one at each .

% P =  n x nbins
% Q =  1 x nbins or n x nbins(one to one)
% dist = n x 1

function dist = KLDiv(P, Q)
    sz_P = size(P,1);
    sz_Q = size(Q,1);
    if sz_P ~= sz_Q
        error('the number of columns in P and Q should be the same');
    end
    
    % Normalizing the P and Q 
    Q_norm = Q ./ sum(Q);
    P_norm = P ./ sum(P);

    for i = 1:sz_P
        % convert zero to 1e-6 to avoid infinity or NAN
        sigma = 1e-6;
        if P_norm(i) == 0
            P_norm(i) = sigma;
        end
        if Q_norm(i) == 0
            Q_norm(i) = sigma;
        end
        temp_p(i) = P_norm(i)*log((P_norm(i))/(Q_norm(i)));
    end
    dist = sum(temp_p);
end