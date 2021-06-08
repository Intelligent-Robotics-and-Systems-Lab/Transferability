% Function to calcualte angle districutions for the first structure
function total_out_wr = struct_pepper_angles(l1, l2)
    
    % th1, th2, th3 (x,y,z for shoulder)
%     th1 = linspace_angles(-119.5,119.5);
    th1 = linspace_angles(-120,120);
    sz_th1 = size(th1, 2);
%     th2 = linspace_angles(-119.5,119.5);
    th2 = linspace_angles(-120,120);
    sz_th2 = size(th2, 2);
%     th3 = linspace_angles(-89.5,-0.5);
    th3 = linspace_angles(-90,0);
    sz_th3 = size(th3, 2);
    
    % th4, th5 (y, z for elbow)
%     th4 = linspace_angles(-104.5,104.5);
    th4 = linspace_angles(-105,105);
    sz_th4 = size(th4, 2);
%     th5 = linspace_angles(0.5,89.5);
    th5 = linspace_angles(0,90);
    sz_th5 = size(th5, 2);


    % Caculate angle distributions
    total_out_el = [];
    total_out_wr = [];
    for i1 = 1:sz_th1
        temp_th1 = th1(i1);
        for i2 = 1:sz_th2
            temp_th2 = th2(i2);
            for i3 = 1:sz_th3
                temp_th3 = th3(i3);

%                 % Elbow
%                 % pos and Jacobian
%                 temp_pos_el = cal_pos_el_pepper(temp_th1,temp_th2,temp_th3, l1);
%                 temp_J_el = cal_J_el_pepper(temp_th1,temp_th2,temp_th3, l1);
%                 % manipulabiloty measure
%                 mm_1 = sqrt(abs(det(temp_J_el*temp_J_el')));
% 
%                 % save outputs
%                 % two rows are posx posy, and third row is manupulability
%                 temp_out_el = [temp_pos_el;mm_1];
%                 total_out_el = [total_out_el temp_out_el];

                % Loop for wrist
                for i4 = 1:sz_th4
                    temp_th4 = th4(i4);
                    
                    for i5 = 1:sz_th5
                        temp_th5 = th5(i5);

                        % Wrist
                        % pos and Jacobian
                        temp_pos_wr = cal_pos_wr_pepper(temp_th1, temp_th2,temp_th3,...
                            temp_th4,temp_th5, l1, l2);
                        temp_J_wr = cal_J_wr_pepper(temp_th1, temp_th2,temp_th3,...
                            temp_th4,temp_th5, l1, l2);
                        % manipulabiloty measure
                        mm_2 = sqrt(abs(det(temp_J_wr*temp_J_wr')));

                        % save outputs
                        % two rows are posx posy, and third row is manupulability
                        % for loop i2
                        temp_out_wr = [temp_pos_wr;mm_2];
                        total_out_wr = [total_out_wr temp_out_wr];
                    end
                end        
            end
        end
    end
end