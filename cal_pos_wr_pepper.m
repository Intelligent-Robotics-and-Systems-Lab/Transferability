%% Function, calculate pos
% For the second linkage 
function pos_out = cal_pos_wr_pepper(th1, th2, th3, th4, th5, l1, l2)
    % thetat degree 2 rad
    th1 = deg2rad(th1);
    th2 = deg2rad(th2);
    th3 = deg2rad(th3);
    th4 = deg2rad(th4);
    th5 = deg2rad(th5);
    
    pos_out = [ - l2*(cos(th2)*cos(th3)*sin(th5) - cos(th5)*sin(th2)*sin(th4) + cos(th2)*cos(th4)*cos(th5)*sin(th3)) - l1*cos(th2)*sin(th3);...
        l1*(cos(th1)*cos(th3) - sin(th1)*sin(th2)*sin(th3)) - l2*(sin(th5)*(cos(th1)*sin(th3) + cos(th3)*sin(th1)*sin(th2)) - cos(th4)*cos(th5)*(cos(th1)*cos(th3) - sin(th1)*sin(th2)*sin(th3)) + cos(th2)*cos(th5)*sin(th1)*sin(th4));...
        l1*(cos(th3)*sin(th1) + cos(th1)*sin(th2)*sin(th3)) + l2*(cos(th4)*cos(th5)*(cos(th3)*sin(th1) + cos(th1)*sin(th2)*sin(th3)) - sin(th5)*(sin(th1)*sin(th3) - cos(th1)*cos(th3)*sin(th2)) + cos(th1)*cos(th2)*cos(th5)*sin(th4))];
    
    
end
