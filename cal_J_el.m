%% Function, calculate Jacobian
% For the first linkage 
function j_out = cal_J_el(th1, th2, th3, l1)
    % thetat degree 2 rad
    th1 = deg2rad(th1);
    th2 = deg2rad(th2);
    th3 = deg2rad(th3); % not use
    
    j_out = [0, l1*cos(th2), 0;...
        -l1*cos(th1)*cos(th2),  l1*sin(th1)*sin(th2), 0;...
        -l1*cos(th2)*sin(th1), -l1*cos(th1)*sin(th2), 0];
    
end
