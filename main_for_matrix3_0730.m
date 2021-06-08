% Only consider coincidence areas for the source and target 

%% Transferability
% requried functions 
% struct_1_angles
% struct_2_angles
% linspace_angles
% cal_dist_pts
% draw_dist_pts
% cal_similarity
% KLDiv
% cal_dist_pts_current
% cal_dist_pts_target

%% Calcualte human links 
adult_l1 = -309.7219;
adult_l2 = 299.5953;

pre_adult_l1 = -adult_l1;
pre_adult_l2 = adult_l2;
sum_adult1 = pre_adult_l1 + pre_adult_l2;
adult_l1 = -pre_adult_l1/sum_adult1;
adult_l2 = pre_adult_l2/sum_adult1;


kid_l1 = -233.7146;
kid_l2 = 233.6531;

pre_kid_l1 = -kid_l1;
pre_kid_l2 = kid_l2;
sum_kid1 = pre_kid_l1 + pre_kid_l2;
kid_l1 = -pre_kid_l1/sum_kid1;
kid_l2 = pre_kid_l2/sum_kid1;

% kid_l1 = -1;
% kid_l2 = 1;


pre_pepper_l1 = norm([15, 181.20, 0.13]);
pre_pepper_l2 = norm([-23.60, 150, 22.84]);
sum_pepper = pre_pepper_l1 + pre_pepper_l2;
pepper_l1 = pre_pepper_l1/sum_pepper;
pepper_l2 = pre_pepper_l2/sum_pepper;

%%
% current = total_out_wr1
% target = total_out_wr2
% First structure 
total_out_wr2 = struct_human_angles(adult_l1,adult_l2);

% % Secodn structure
% total_out_wr2 = struct_human_angles(kid_l1,kid_l2);

% pepper struct
total_out_wr1 = struct_pepper_angles(pepper_l1, pepper_l2);
% pepper_jv = total_out_wr2(4,:);


%% Convert pos with cubic (0.01, cubic length)
% Limit decimal it may be 2 later 
% num_decimal = -1;
num_decimal = 1;
% length of cubic it may be 0.01 later 
% length_cubic = 10;
length_cubic = 0.1;
% First struct
temp_total_out_wr = [];
temp_total_out_wr(1,:) = round(total_out_wr1(1,:),num_decimal);
temp_total_out_wr(2,:) = round(total_out_wr1(2,:),num_decimal);
temp_total_out_wr(3,:) = round(total_out_wr1(3,:),num_decimal);
temp_total_out_wr(4,:) = total_out_wr1(4,:);
% Second struct
temp_total_out_wr2 = [];
temp_total_out_wr2(1,:) = round(total_out_wr2(1,:),num_decimal);
temp_total_out_wr2(2,:) = round(total_out_wr2(2,:),num_decimal);
temp_total_out_wr2(3,:) = round(total_out_wr2(3,:),num_decimal);
temp_total_out_wr2(4,:) = total_out_wr2(4,:);

% get min max based on the current structure
all_out = temp_total_out_wr;
% save all min max 
x_min = min(all_out(1,:));
% add 10 for pos dist
x_max = max(all_out(1,:));
y_min = min(all_out(2,:));
y_max = max(all_out(2,:));
z_min = min(all_out(3,:));
z_max = max(all_out(3,:));
% calculate boundaries and position distributions
x_diff = (x_max - x_min) + length_cubic;
x_deno = x_diff/length_cubic;
x_pos_dist = linspace(x_min,x_max,int16(x_deno));

y_diff = (y_max - y_min) + length_cubic;
y_deno = y_diff/length_cubic;
y_pos_dist = linspace(y_min,y_max,int16(y_deno));

z_diff = (z_max - z_min) + length_cubic;
z_deno = z_diff/length_cubic;
z_pos_dist = linspace(z_min,z_max,int16(z_deno));


%% calculate manipulabiltiy and drawing (y = 0)
% struct 1 
ave_final_dist_struct1 = cal_dist_pts_current(temp_total_out_wr, ...
     x_pos_dist, y_pos_dist, z_pos_dist);
sz_st1_x = size(ave_final_dist_struct1,1);
sz_st1_y = size(ave_final_dist_struct1,2);
sz_st1_z = size(ave_final_dist_struct1,3);
% struct 2 
% only for drawing
ave_final_dist_struct2_draw = cal_dist_pts_current(temp_total_out_wr2, ...
     x_pos_dist, y_pos_dist, z_pos_dist);

% Calcualte max_mi
max_mi1 = max(ave_final_dist_struct1,[],'all');
max_mi2 = max(ave_final_dist_struct2_draw,[],'all');
max_mi = max([max_mi1 max_mi2]);
% 
% max_mi = max_mi2;
% % real value of structure 2
% ave_final_dist_struct2 = cal_dist_pts_target(temp_total_out_wr2, ...
%      x_pos_dist, y_pos_dist, z_pos_dist, ave_final_dist_struct1);
% 
% % draw struct 1
draw_dist_pts_zeroZ(ave_final_dist_struct1, x_pos_dist, y_pos_dist, z_pos_dist,...
    x_min,x_max,y_min,y_max,z_min,z_max,adult_l1,adult_l2, max_mi);
% % % 
% % draw struct 2
% draw_dist_pts_3d_forD(ave_final_dist_struct2_draw, x_pos_dist, y_pos_dist, z_pos_dist,...
%     x_min,x_max,y_min,y_max,z_min,z_max,kid_l1,kid_l2,max_mi);
% 
% 
% % zero Z 
% draw_dist_pts_zeroZ(ave_final_dist_struct1, x_pos_dist, y_pos_dist, z_pos_dist,...
%     x_min,x_max,y_min,y_max,z_min,z_max,kid_l1,kid_l2,max_mi);
% 
% draw_dist_pts_zeroZ(ave_final_dist_struct2_draw, x_pos_dist, y_pos_dist, z_pos_dist,...
%     x_min,x_max,y_min,y_max,z_min,z_max,kid_l1,kid_l2,max_mi);


%% Caculate similability between two matrices new 
% new way considering only coincident areas 
sz_total = sz_st1_x*sz_st1_y*sz_st1_z;
lin_shape_struct1_new = reshape(ave_final_dist_struct1,[1,sz_total]);
lin_shape_struct2_new = reshape(ave_final_dist_struct2_draw,[1,sz_total]);

[row,col,~] = find(lin_shape_struct1_new > 1e-6);
sz_total = size(lin_shape_struct1_new,2);
temp_str1 = zeros(1,sz_total);
temp_str1(row,col) = 1;

[row2,col2,~] = find(lin_shape_struct2_new > 1e-6);
temp_str2 = zeros(1,sz_total);
temp_str2(row2,col2) = 1;

tot_temp_area = temp_str1 + temp_str2;
[row3,col3,~] = find(tot_temp_area == 2);

% calculate whole coincident areas
sz_co = size(col3);
fin_lin_str1 = zeros(sz_co);
fin_lin_str2 = zeros(sz_co);
for i_co = 1:sz_co(1,2)
    % for str1
    fin_lin_str1(1,i_co) = lin_shape_struct1_new(1,col3(1,i_co));
    % for str2
    fin_lin_str2(1,i_co) = lin_shape_struct2_new(1,col3(1,i_co));
end
% lack manipulability of target
diff_lack_d = fin_lin_str1 - fin_lin_str2;
[~,low_lack,~] = find(diff_lack_d > 0);

sz_low_lack = size(low_lack);
fin2_lin_str1 = zeros(sz_low_lack);
fin2_lin_str2 = zeros(sz_low_lack);
for i_co2 = 1:sz_low_lack(1,2)
    % for str1
    fin2_lin_str1(1,i_co2) = fin_lin_str1(1,low_lack(1,i_co2));
    % for str2
    fin2_lin_str2(1,i_co2) = fin_lin_str2(1,low_lack(1,i_co2));
end


current_KL3 = cal_similarity(fin2_lin_str1,fin2_lin_str2)
% lack_ratio = size(low_lack,2)/size(diff_lack_d,2)

%% Capability new - sufficient ratio 
diff_suff_d = fin_lin_str2 - fin_lin_str1;
[~,low_suff,~] = find(diff_suff_d > 0);
suff_ratio = size(low_suff,2)/sz_co(1,2)

