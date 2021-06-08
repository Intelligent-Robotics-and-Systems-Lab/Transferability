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
% units [mm]
% filename_adult = 'realAdultTrial.xlsx';
% [adult_l1, adult_l2] = cal_human_links(filename_adult);
% adult_l1 = -2.61;
% adult_l2 = 2.83;

pre_adult_l1 = 261;
pre_adult_l2 = 283;
sum_adult1 = pre_adult_l1 + pre_adult_l2;
adult_l1 = -pre_adult_l1/sum_adult1;
adult_l2 = pre_adult_l2/sum_adult1;

% adult_l1 = -1;
% adult_l2 = 1;


% filename_kid = 'realKidOtherTrial.xlsx';
% [kid_l1, kid_l2] = cal_human_links(filename_kid);
% kid_l1 = -2.06;
% kid_l2 = 2.08;

pre_kid_l1 = 206;
pre_kid_l2 = 208;
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
total_out_wr1 = struct_human_angles(adult_l1,adult_l2);

% % Secodn structure
total_out_wr2 = struct_human_angles(kid_l1,kid_l2);

% pepper struct
% total_out_wr1 = struct_pepper_angles(pepper_l1, pepper_l2);
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

% max_mi = max_mi2;
% % real value of structure 2
% ave_final_dist_struct2 = cal_dist_pts_target(temp_total_out_wr2, ...
%      x_pos_dist, y_pos_dist, z_pos_dist, ave_final_dist_struct1);

% % draw struct 1
draw_dist_pts_3d_forD(ave_final_dist_struct1, x_pos_dist, y_pos_dist, z_pos_dist,...
    x_min,x_max,y_min,y_max,z_min,z_max,adult_l1,adult_l2, max_mi);
% % 
% draw struct 2
draw_dist_pts_3d_forD(ave_final_dist_struct2_draw, x_pos_dist, y_pos_dist, z_pos_dist,...
    x_min,x_max,y_min,y_max,z_min,z_max,kid_l1,kid_l2,max_mi);
% % 
% % 
% % % zero Z 
% % draw_dist_pts_zeroZ(ave_final_dist_struct1, x_pos_dist, y_pos_dist, z_pos_dist,...
% %     x_min,x_max,y_min,y_max,z_min,z_max,kid_l1,kid_l2,max_mi);
% % 
% draw_dist_pts_zeroZ(ave_final_dist_struct2_draw, x_pos_dist, y_pos_dist, z_pos_dist,...
%     x_min,x_max,y_min,y_max,z_min,z_max,kid_l1,kid_l2,max_mi);


%% Caculate similability between two matrices new 

% % Case 1
% % struct 1 --> struct 2
% sz_total = sz_st1_x*sz_st1_y*sz_st1_z;
% lin_shape_struct1_new = reshape(ave_final_dist_struct1,[1,sz_total]);
% lin_shape_struct2_new = reshape(ave_final_dist_struct2_draw,[1,sz_total]);
% 
% % calculate diff 
% diff_new = lin_shape_struct1_new - lin_shape_struct2_new;
% [row,col,val] = find(diff_new >= 0);
% sz_total = size(diff_new,2);
% temp_zero = zeros(1,sz_total);
% re_struct1_new = temp_zero;
% re_struct1_new(row,col) = lin_shape_struct1_new(row,col);
% 
% re_struct2_new = temp_zero;
% re_struct2_new(row,col) = lin_shape_struct2_new(row,col);
% 
% % remove values for struct1 when struct2 does not have manipulability
% [row2,col2,val2] = find(lin_shape_struct2_new < 1e-6);
% re_struct1_new2 = re_struct1_new;
% re_struct1_new2(row2,col2) = 0;
% 
% current_KL = cal_similarity(re_struct1_new,re_struct2_new)
% current_KL2 = cal_similarity(re_struct1_new2,re_struct2_new)



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


% % test 
% dis = [0.0557;0.0359;0.6723;1.0869;0.6765;1.1072];
% capa = 0.01*[71.27;73.55;56.4;82.51;56.48;82.29];
% leng = [0.761;0.761;0.6158;0.6158;0.8092;0.8092];
% for i = 1:6
%     total(i,1) = leng(i)*(capa(i) + ((1-capa(i))*(1-dis(i))));
% end
% 
% 
% dis = [0.1029;0.0623;0.5913;2.7205;0.5916;2.7391];
% capa = 0.01*[71.27;73.55;56.4;82.51;56.48;82.29];
% leng = [0.761;0.761;0.6158;0.6158;0.8092;0.8092];
% for i = 1:6
%     total2(i,1) = leng(i)*(capa(i) + ((1-capa(i))*(1-dis(i))));
% end
% 




%% Capability new 
% remap lin_shape_struct1 S1
re_lin_shape_struct1 = lin_shape_struct1_new;
re_lin_shape_struct2 = lin_shape_struct2_new;
[r_source,l_source,~] = find(re_lin_shape_struct1 >= 1e-6);
sz_s1_source = size(l_source);
temp_source_a = zeros(sz_s1_source);
temp_target_a = zeros(sz_s1_source);
for i_s1 = 1:sz_s1_source(1,2)
    temp_source_a(1,i_s1) = re_lin_shape_struct1(1,l_source(i_s1));
    temp_target_a(1,i_s1) = re_lin_shape_struct2(1,l_source(i_s1));
end
diff_s_t = temp_target_a - temp_source_a;
[r_suff,l_suff,~] = find(diff_s_t >= 0);
sz_suff = size(l_suff);
capa_0 = sz_suff(1,2)/sz_s1_source(1,2)

sum = temp_target_a + temp_source_a;
[~,temp_l1,~] = find(temp_target_a ~= 0);
[~,temp_l2,~] = find(temp_source_a ~= 0);
[~,temp_l3,~] = find(sum ~= 0);

% remap lin_shape_struct1 S2
% calculate unreachable area of target in source area 
count_un_re = 0;
for i_s2 = 1:sz_s1_source(1,2)
    % source >= 1e-6 %% target <= 1e-6
    if temp_source_a(1,i_s2) >= 1e-6 && temp_target_a(1,i_s2) <= 1e-6
        count_un_re = count_un_re + 1;
    end
end
capa_2 = (sz_suff(1,2) + count_un_re)/sz_s1_source(1,2)

% %% old version
% re_lin_shape_struct1(re_lin_shape_struct1 <= 1e-6 ) = 100;
% 
% [r,c,v] = find(re_lin_shape_struct1 < 99);
% total_num = size(c,2);
% 
% diff_capa = lin_shape_struct2_new - re_lin_shape_struct1;
% ind_diff_capa = find(diff_capa >= 0);
% sz_over = size(ind_diff_capa,2);
% capability1 = sz_over/total_num
% 
% 
% 
% 
% % remap lin_shape_struct1 S2
% re_lin_shape_struct1 = lin_shape_struct1_new;
% re_lin_shape_struct1(re_lin_shape_struct1 <= 1e-6 ) = 100;
% 
% % remove values for struct1 when struct2 does not have manipulability
% [row2,col2,val2] = find(lin_shape_struct2_new < 1e-6);
% re_lin_shape_struct1(row2,col2) = 100;
% 
% [r,c,v] = find(re_lin_shape_struct1 < 99);
% total_num = size(c,2);
% 
% diff_capa = lin_shape_struct2_new - re_lin_shape_struct1;
% ind_diff_capa = find(diff_capa >= 0);
% sz_over = size(ind_diff_capa,2);
% capability2 = sz_over/total_num




% % capability visualization part
% % ave_final_dist_struct1
% % ave_final_dist_struct2_draw
% source_str = ave_final_dist_struct1;
% target_str = ave_final_dist_struct2_draw;
% diff_capa_viz = ave_final_dist_struct2_draw - ave_final_dist_struct1;
% % ind_diff_capa_viz = findND(diff_capa_viz >= 0);
% 
% diff_capa_viz(diff_capa_viz < 0) = 0;
% 
% 
% draw_dist_pts_3d(diff_capa_viz, x_pos_dist, y_pos_dist, z_pos_dist,...
%     x_min,x_max,y_min,y_max,z_min,z_max,adult_l1,adult_l2, max_mi);
% 
% draw_dist_pts_zeroZ(diff_capa_viz, x_pos_dist, y_pos_dist, z_pos_dist,...
%     x_min,x_max,y_min,y_max,z_min,z_max,adult_l1,adult_l2, max_mi);
% 
% 
% diff_capa_viz2 = ave_final_dist_struct1 - ave_final_dist_struct2_draw;
% % ind_diff_capa_viz2 = findND(diff_capa_viz2 >= 0);
% 
% draw_dist_pts_3d_forD(target_str, x_pos_dist, y_pos_dist, z_pos_dist,...
%     x_min,x_max,y_min,y_max,z_min,z_max,adult_l1,adult_l2, max_mi);
% 
% draw_dist_pts_zeroZ(diff_capa_viz2, x_pos_dist, y_pos_dist, z_pos_dist,...
%     x_min,x_max,y_min,y_max,z_min,z_max,adult_l1,adult_l2, max_mi);


% %% draw concept plots for dissimilarity 
% x = [-8:.1:8];
% y = normpdf(x,0,3);
% plot(x-2,y, 'b', 'LineWidth',5 );
% xlim([-6 6]);
% ylim([0 0.3]);
% hold on
% plot(x+2,y, 'r','LineWidth',5 );  
% grid off;
% xlabel([]);
% zlabel([]);
% ylabel([]);
% xticks([]);
% zticks([]);
% yticks([]);




%% Test bed 2 for human 

% % shoulder rotation only for Y and X axes 
% syms th1 th2 th3 th4
% sh_x_rot = [1 0 0; 0 cos(th1) -sin(th1);0 sin(th1) cos(th1)];
% sh_y_rot = [cos(th2) 0 sin(th2);0 1 0;-sin(th2) 0 cos(th2)];
% sh_z_rot = [cos(th3) -sin(th3) 0;sin(th3) cos(th3) 0;0 0 1];
% 
% syms l1 l2; % l1, l2 < 0 
% % Rotations of shoulder: th1, th2, th3 (x, y, z)
% ori_sh_rot = sh_x_rot*sh_y_rot*sh_z_rot;
% ori_sh_pos = [0;0;0];
% ori_sh_T = [ori_sh_rot ori_sh_pos;0 0 0 1];
% 
% % Rotations of shoulder: th4 (x)
% sh_el_rot = [1 0 0; 0 cos(th4) -sin(th4);0 sin(th4) cos(th4)];
% sh_el_pos = [0;0;l1];
% sh_el_T = [sh_el_rot sh_el_pos;0 0 0 1];
% 
% el_wr_rot = eye(3,3);
% el_wr_pos = [0;l2;0];
% el_wr_T = [el_wr_rot el_wr_pos;0 0 0 1];
% 
% % pos at elbow relative to origin
% ori_el_T = ori_sh_T*sh_el_T;
% el_pos = ori_el_T(1:3,4);
% % Jacobian
% el_J = jacobian(el_pos, [th1, th2, th3]);
% 
% % pos at wrist relative to origin 
% ori_wr_T = ori_sh_T*sh_el_T*el_wr_T;
% wr_pos = ori_wr_T(1:3,4);
% % Jacobian
% wr_J = jacobian(wr_pos, [th1, th2, th3, th4]);



% %% Test bed 2 for pepper 
% 
% % shoulder rotation only for Y and X axes 
% syms th1 th2 th3 th4 th5
% sh_x_rot = [1 0 0; 0 cos(th1) -sin(th1);0 sin(th1) cos(th1)];
% sh_y_rot = [cos(th2) 0 sin(th2);0 1 0;-sin(th2) 0 cos(th2)];
% sh_z_rot = [cos(th3) -sin(th3) 0;sin(th3) cos(th3) 0;0 0 1];
% 
% syms l1 l2; % l1, l2 < 0 
% % Rotations of shoulder: th1, th2, th3 (x, y, z)
% ori_sh_rot = sh_x_rot*sh_y_rot*sh_z_rot;
% ori_sh_pos = [0;0;0];
% ori_sh_T = [ori_sh_rot ori_sh_pos;0 0 0 1];
% 
% % Rotations of shoulder: th4 (x) th5 (z)
% sh_elx_rot = [1 0 0; 0 cos(th4) -sin(th4);0 sin(th4) cos(th4)];
% sh_elz_rot = [cos(th5) -sin(th5) 0;sin(th5) cos(th5) 0;0 0 1];
% sh_el_rot = sh_elx_rot*sh_elz_rot;
% sh_el_pos = [0;l1;0];
% sh_el_T = [sh_el_rot sh_el_pos;0 0 0 1];
% 
% el_wr_rot = eye(3,3);
% el_wr_pos = [0;l2;0];
% el_wr_T = [el_wr_rot el_wr_pos;0 0 0 1];
% 
% % pos at elbow relative to origin
% ori_el_T = ori_sh_T*sh_el_T;
% el_pos = ori_el_T(1:3,4);
% % Jacobian
% el_J = jacobian(el_pos, [th1, th2, th3]);
% 
% % pos at wrist relative to origin 
% ori_wr_T = ori_sh_T*sh_el_T*el_wr_T;
% wr_pos = ori_wr_T(1:3,4);
% % Jacobian
% wr_J = jacobian(wr_pos, [th1, th2, th3, th4, th5]);


