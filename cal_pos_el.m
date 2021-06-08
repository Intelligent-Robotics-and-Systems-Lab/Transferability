%% Function, calculate pos
% For the first linkage 
function pos_out = cal_pos_el(th1, th2, th3, l1)
    % thetat degree 2 rad
    th1 = deg2rad(th1);
    th2 = deg2rad(th2);
    th3 = deg2rad(th3); % not use
    
    pos_out = [l1*sin(th2);...
        -l1*cos(th2)*sin(th1);...
        l1*cos(th1)*cos(th2)];
    
end
