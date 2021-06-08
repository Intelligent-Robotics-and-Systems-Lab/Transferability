% Function to calcualte angle districutions for the first structure
function total_out_wr = struct_human_angles(l1,l2)
    % unit of links is [mm]
    
    % th1, th2, th3 (x,y,z for shoulder)
    th1 = linspace_angles(-60,170);
    % th1 = linspace(0,50,num_pts);
    sz_th1 = size(th1, 2);
    th2 = linspace_angles(-170,10);
    % th2 = linspace(0,-50,num_pts);
    sz_th2 = size(th2, 2);
    th3 = linspace_angles(-60,90);
    % th3 = linspace(0,50,num_pts);
    sz_th3 = size(th3, 2);
    % th4 (x for elbow)
    th4 = linspace_angles(-90,60);
    % th4 = linspace(0,50,num_pts);
    sz_th4 = size(th4, 2);

    % Caculate angle distributions
    total_out_el = [];
    total_out_wr = [];
    for i1 = 1:sz_th1
        temp_th1 = th1(i1);
        for i2 = 1:sz_th2
            temp_th2 = th2(i2);
            for i3 = 1:sz_th3
                temp_th3 = th3(i3);

                % Elbow
                % pos and Jacobian
                temp_pos_el = cal_pos_el(temp_th1,temp_th2,temp_th3, l1);
                temp_J_el = cal_J_el(temp_th1,temp_th2,temp_th3, l1);
                % manipulabiloty measure
                mm_1 = sqrt(abs(det(temp_J_el*temp_J_el')));

                % save outputs
                % two rows are posx posy, and third row is manupulability
                temp_out_el = [temp_pos_el;mm_1];
                total_out_el = [total_out_el temp_out_el];

                % Loop for wrist
                for i4 = 1:sz_th4
                    temp_th4 = th4(i4);

                    % Wrist
                    % pos and Jacobian
                    temp_pos_wr = cal_pos_wr(temp_th1, temp_th2,temp_th3,...
                        temp_th4, l1, l2);
                    temp_J_wr = cal_J_wr(temp_th1, temp_th2,temp_th3,...
                        temp_th4, l1, l2);
                    % manipulabiloty measure
                    mm_2 = sqrt(abs(det(temp_J_wr*temp_J_wr')));
%                     mm_2 = sqrt(real(det(temp_J_wr*temp_J_wr')));

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