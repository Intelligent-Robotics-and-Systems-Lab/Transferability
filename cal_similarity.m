% convert KL divergence to similarity

function current_KL = cal_similarity(struct1, struct2)
    % Calculate max KL div with zeros struct
    % min KL Div is 0
    sz_test = size(struct1);
    re_struct1 = struct1 + 1e-6;
    zero_re = zeros(sz_test) + 1e-1;
    
    re_struct2 = struct2 + 1e-6;
    
%     % norm version
%     norm_val_zero = norm(re_struct1,2);
%     norm_val = norm(re_struct1 - re_struct2, 2);
%     norm_dist = norm_val/norm_val_zero;
%     norm_sim = 1 - norm_dist;
    
          
    % KL Div
    current_KL = KLDiv(struct1',struct2');
    
    
%     max_KL = KLDiv(re_struct1',zero_re');
%     norm_current_KL = current_KL/max_KL;
%     KL_sim = 1 - norm_current_KL;
%     
%     max_KL2 = KLDiv2(struct1',zero_re');
%     current_KL2 = KLDiv2(struct1',struct2');
%     norm_current_KL2 = current_KL2/max_KL2;
%     KL_sim2 = 1 - norm_current_KL2;
    
   
    
    
end

