%% Convert pos with cubic (0.01, cubic length)
function draw_dist_pts(ave_final_dist_struct1, x_pos_dist, y_pos_dist, z_pos_dist,...
    x_min,x_max,y_min,y_max,z_min,z_max,l1,l2, max_mi)
    
       
    %% Drawing 

    % drawing (Wrist)
    init_pos_el = cal_pos_el(0,0,0, l1);
    init_el_T = [eye(3,3) init_pos_el;0 0 0 1];
    init_pos_wr = cal_pos_wr(0, 0, 0, 0, l1, l2);
    init_wr_T = [eye(3,3) init_pos_wr;0 0 0 1];
    init_sh_pos = [0;0;0;1];
    init_sh_T = [eye(3,3) [0;0;0];0 0 0 1];

    fig1 = figure('position', [50, 50, 600, 500]);
%     drawCoordinateAxes(init_sh_T, 'RShoulder');
    hold on;
%     drawCoordinateAxes(init_el_T, 'LElbow');
%     drawCoordinateAxes(init_wr_T, 'LWrist');
%     line([init_sh_pos(1) init_pos_el(1)], [init_sh_pos(2) init_pos_el(2)],...
%         [init_sh_pos(3) init_pos_el(3)], 'LineWidth',2);
%     line([init_pos_el(1) init_pos_wr(1)], [init_pos_el(2) init_pos_wr(2)],...
%         [init_pos_el(3) init_pos_wr(3)], 'LineWidth',2);


    % x,y,z indices of [ave_final_dist_struct1] 
    % values can be found from [temp_*_uniq]
    % when y is close to zero
    sz_final_dist = size(ave_final_dist_struct1);
    sz_x_dist = sz_final_dist(1);
    sz_y_dist = sz_final_dist(2);
    sz_z_dist = sz_final_dist(3);
    
    % get maximum manipulability measure (need to modify)
%     max_mi = round(max(ave_final_dist_struct1,[],'all'),2);
%     max_mi = max(ave_final_dist_struct1,[],'all');


    for i_x_v = 1:sz_x_dist
%         for i_y_v = 50:60
        % find y = 0 
%         indx_zeroy = find(abs(y_pos_dist) < 1e-6);
%         i_y_v = indx_zeroy;
        
        indx_zeroz = find(abs(z_pos_dist) < 1e-6);
        i_z_v = indx_zeroz;
        
        for i_y_v = 1:sz_y_dist
            % get true values for x,y,z
            temp_tr_x = x_pos_dist(i_x_v);
            temp_tr_y = y_pos_dist(i_y_v);
            temp_tr_z = z_pos_dist(i_z_v);

            % draw 
            % set color based on manipulability measure
            % 0 to 10 
            % R 255 ~ 0
            target_mi = ave_final_dist_struct1(i_x_v,i_y_v,i_z_v);
           
            temp_R = 1 -(target_mi/max_mi);
            % B 0 ~ 255
            temp_B = target_mi/max_mi;
            temp_color = [temp_R 0 temp_B];
            
           
            % ignore when a point does not have value 
            if target_mi >= 1e-6

            scatter3(temp_tr_x,temp_tr_y,temp_tr_z,70,'MarkerEdgeColor',temp_color,...
                      'MarkerFaceColor',temp_color,'LineWidth',0.5);
            end

        end
%         end
    end

    xlabel('x');
    ylabel('y');
    zlabel('z');
    grid on;
    axis equal;
    view([0,1,0]);
% 
    xlim([x_min-0.5 x_max+0.5]);
    zlim([z_min-0.5 z_max+0.5]);

%     xlim([x_min-50 x_max+50]);
%     zlim([z_min-50 z_max+50]);

    plot3(0,0,0,'r+');
    grid off;
    xlabel([]);
    zlabel([]);
    xticks([]);
    zticks([]);
    

end
