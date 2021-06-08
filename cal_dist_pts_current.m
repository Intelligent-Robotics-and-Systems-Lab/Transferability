%% Convert pos with cubic (0.01, cubic length)
function ave_final_dist_struct1 = cal_dist_pts_current(temp_total_out_wr, ...
    x_pos_dist, y_pos_dist, z_pos_dist)
    
    %% Set cubic distribution for Struct 1

%     pre_uniq_temp_total_out_wr = temp_total_out_wr(1:3,:);

%     % unique total
%     uniq_temp_total_out_wr = unique(pre_uniq_temp_total_out_wr.', 'rows').';
%     sz_uniq_temp = size(uniq_temp_total_out_wr,2);

    % uniq for each axis
    [temp_x_uniq, ia_x, ic_x] = unique(temp_total_out_wr(1,:));
    sz_temp_x_uniq = size(temp_x_uniq,2);
    [temp_y_uniq, ia_y, ic_y] = unique(temp_total_out_wr(2,:));
    sz_temp_y_uniq = size(temp_y_uniq,2);
    [temp_z_uniq, ia_z, ic_z] = unique(temp_total_out_wr(3,:));
    sz_temp_z_uniq = size(temp_z_uniq,2);

    % loop for all points 
    sz_total_wr = size(temp_total_out_wr,2);
    % initialize 4-dim x,y,z,ma(manipulability measure)
    sz_x_pos = size(x_pos_dist,2);
    sz_y_pos = size(y_pos_dist,2);
    sz_z_pos = size(z_pos_dist,2);
    final_dist_struct1 = zeros(sz_x_pos,sz_y_pos,sz_z_pos,1);
    final_dist_struct1_num = zeros(sz_x_pos,sz_y_pos,sz_z_pos,1);
    for i_t = 1:sz_total_wr
        temp_x = temp_total_out_wr(1,i_t);
        temp_y = temp_total_out_wr(2,i_t);
        temp_z = temp_total_out_wr(3,i_t);
        temp_m = temp_total_out_wr(4,i_t);

        % find x 
        tempx_diff = abs(x_pos_dist - temp_x);
%         [~, indx_j] = min(tempx_diff);
        [~, indx_j, ~] = find(tempx_diff < 1e-6);
        % find y 
        tempy_diff = abs(y_pos_dist - temp_y);
%         [~, indy_j] = min(tempx_diff);
        [~, indy_j, ~] = find(tempy_diff < 1e-6);
        % find z 
        tempz_diff = abs(z_pos_dist - temp_z);
%         [~, indz_j] = min(tempx_diff);
        [~, indz_j, ~] = find(tempz_diff < 1e-6);
        
        % temp 
        if isempty(indx_j) == 1
            a_test = 1;
        end
        
        % ind should be found in pos_dist
        if isempty(indx_j) == 0 && isempty(indy_j) == 0 && isempty(indz_j) == 0 
            % add number of match
            final_dist_struct1_num(indx_j,indy_j,indz_j) = ...
                final_dist_struct1_num(indx_j,indy_j,indz_j) + 1;
            % add values of match
            final_dist_struct1(indx_j,indy_j,indz_j) = ...
                final_dist_struct1(indx_j,indy_j,indz_j) + temp_m;
        end
    end

    % find non zero values in total counts
    sz_final_dist = size(final_dist_struct1_num);
    [indx_nzi,indx_nzj,indx_nzk] = ind2sub(sz_final_dist,...
        find(final_dist_struct1_num ~= 0));
    sz_nz = size(indx_nzi,1);
    ave_final_dist_struct1 = zeros(sz_x_pos,sz_y_pos,sz_z_pos,1);
    for i_nz = 1:sz_nz
        % calculate average when the counts are exist
        temp_count = final_dist_struct1_num(indx_nzi(i_nz),indx_nzj(i_nz),indx_nzk(i_nz));
        ave_final_dist_struct1(indx_nzi(i_nz),indx_nzj(i_nz),indx_nzk(i_nz)) = ...
            final_dist_struct1(indx_nzi(i_nz),indx_nzj(i_nz),indx_nzk(i_nz))/temp_count;
    end
 
    

end
