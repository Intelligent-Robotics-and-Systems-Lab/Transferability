% Sigmoid function
function y = sigm(x)
    % using the sigmoid 
    % f(x) = 1/(1 + exp^-x)
    temp_expx = exp(-x);
    y = 1/(1 + temp_expx);
    
end