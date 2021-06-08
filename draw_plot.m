%% Drawing function

function draw_plot(total_out_wr)
    % initial arm pos
    init_pos_el = cal_pos_el(0,0,0, l1);
    init_el_T = [eye(3,3) init_pos_el;0 0 0 1];
    init_pos_wr = cal_pos_wr(0, 0, 0, 0, l1, l2);
    init_wr_T = [eye(3,3) init_pos_wr;0 0 0 1];
    init_sh_pos = [0;0;0;1];
    init_sh_T = [eye(3,3) [0;0;0];0 0 0 1];

    figure
    drawCoordinateAxes(init_sh_T, 'RShoulder');
    hold on;
    drawCoordinateAxes(init_el_T, 'LElbow');
    drawCoordinateAxes(init_wr_T, 'L_Wrist');
    line([init_sh_pos(1) init_pos_el(1)], [init_sh_pos(2) init_pos_el(2)],...
        [init_sh_pos(3) init_pos_el(3)], 'LineWidth',2);
    line([init_pos_el(1) init_pos_wr(1)], [init_pos_el(2) init_pos_wr(2)],...
        [init_pos_el(3) init_pos_wr(3)], 'LineWidth',2);
    
    % draw wrist 
    % select region
    
    % first farest region from shoulder(0,0,0)
    

    
    
end