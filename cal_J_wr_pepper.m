%% Function, calculate Jacobian
% For the two linkages
function j_out = cal_J_wr_pepper(th1, th2, th3, th4, th5, l1, l2)
    % thetat degree 2 rad
    th1 = deg2rad(th1);
    th2 = deg2rad(th2);
    th3 = deg2rad(th3);
    th4 = deg2rad(th4);
    th5 = deg2rad(th5);
    
    % first col
    j_c1_1 = 0;
    j_c1_2 = - l1*(cos(th3)*sin(th1) + cos(th1)*sin(th2)*sin(th3)) - l2*(cos(th4)*cos(th5)*(cos(th3)*sin(th1) + cos(th1)*sin(th2)*sin(th3)) - sin(th5)*(sin(th1)*sin(th3) - cos(th1)*cos(th3)*sin(th2)) + cos(th1)*cos(th2)*cos(th5)*sin(th4));
    j_c1_3 = l1*(cos(th1)*cos(th3) - sin(th1)*sin(th2)*sin(th3)) - l2*(sin(th5)*(cos(th1)*sin(th3) + cos(th3)*sin(th1)*sin(th2)) - cos(th4)*cos(th5)*(cos(th1)*cos(th3) - sin(th1)*sin(th2)*sin(th3)) + cos(th2)*cos(th5)*sin(th1)*sin(th4));
    j_c1 = [j_c1_1;j_c1_2;j_c1_3];
    % second col    
    j_c2_1 = l2*(cos(th3)*sin(th2)*sin(th5) + cos(th2)*cos(th5)*sin(th4) + cos(th4)*cos(th5)*sin(th2)*sin(th3)) + l1*sin(th2)*sin(th3);
    j_c2_2 = - l2*(cos(th2)*cos(th3)*sin(th1)*sin(th5) - cos(th5)*sin(th1)*sin(th2)*sin(th4) + cos(th2)*cos(th4)*cos(th5)*sin(th1)*sin(th3)) - l1*cos(th2)*sin(th1)*sin(th3);
    j_c2_3 = l2*(cos(th1)*cos(th2)*cos(th3)*sin(th5) - cos(th1)*cos(th5)*sin(th2)*sin(th4) + cos(th1)*cos(th2)*cos(th4)*cos(th5)*sin(th3)) + l1*cos(th1)*cos(th2)*sin(th3);
    j_c2 = [j_c2_1;j_c2_2;j_c2_3];
    % third col    
    j_c3_1 = l2*(cos(th2)*sin(th3)*sin(th5) - cos(th2)*cos(th3)*cos(th4)*cos(th5)) - l1*cos(th2)*cos(th3);
    j_c3_2 = - l1*(cos(th1)*sin(th3) + cos(th3)*sin(th1)*sin(th2)) - l2*(sin(th5)*(cos(th1)*cos(th3) - sin(th1)*sin(th2)*sin(th3)) + cos(th4)*cos(th5)*(cos(th1)*sin(th3) + cos(th3)*sin(th1)*sin(th2)));
    j_c3_3 = - l1*(sin(th1)*sin(th3) - cos(th1)*cos(th3)*sin(th2)) - l2*(sin(th5)*(cos(th3)*sin(th1) + cos(th1)*sin(th2)*sin(th3)) + cos(th4)*cos(th5)*(sin(th1)*sin(th3) - cos(th1)*cos(th3)*sin(th2)));
    j_c3 = [j_c3_1;j_c3_2;j_c3_3];
    % fourth col    
    j_c4_1 = l2*(cos(th4)*cos(th5)*sin(th2) + cos(th2)*cos(th5)*sin(th3)*sin(th4));
    j_c4_2 = -l2*(cos(th5)*sin(th4)*(cos(th1)*cos(th3) - sin(th1)*sin(th2)*sin(th3)) + cos(th2)*cos(th4)*cos(th5)*sin(th1));
    j_c4_3 = -l2*(cos(th5)*sin(th4)*(cos(th3)*sin(th1) + cos(th1)*sin(th2)*sin(th3)) - cos(th1)*cos(th2)*cos(th4)*cos(th5));
    j_c4 = [j_c4_1;j_c4_2;j_c4_3];
    
    j_out = [j_c1 j_c2 j_c3 j_c4];
    
end
% for two links 