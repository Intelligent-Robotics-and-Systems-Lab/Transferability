% Calculate human links
function [l1, l2] = cal_human_links(filename)
    % read file
    total_output = viz_convert_adulthuman(filename);
    ini_head = total_output.Head(1,:);
    ini_torso = total_output.Torso(1,:);
    ini_neck = total_output.Neck(1,:);
    ini_RShoulder = total_output.RShoulder(1,:);
    ini_RElbow = total_output.RElbow(1,:);
    ini_RHand = total_output.RHand(1,:);
%     ini_LShoulder = total_output.LShoulder(1,:);
%     ini_LElbow = total_output.LElbow(1,:);
%     ini_LHand = total_output.LHand(1,:);

    arr_neck_head = [ini_neck;ini_head];
    dist_neck_head = 1000*pdist(arr_neck_head);

    arr_torso_neck = [ini_torso;ini_neck];
    dist_torso_neck = 1000*pdist(arr_torso_neck);

    arr_neck_RShoulder = [ini_neck;ini_RShoulder];
    dist_neck_RShoulder = 1000*pdist(arr_neck_RShoulder);

    arr_RShoulder_RElbow = [ini_RShoulder;ini_RElbow];
    dist_RShoulder_RElbow = 1000*pdist(arr_RShoulder_RElbow);

    arr_RElbow_RHand = [ini_RElbow;ini_RHand];
    dist_RElbow_RHand = 1000*pdist(arr_RElbow_RHand);
% 
%     arr_neck_LShoulder = [ini_neck;ini_LShoulder];
%     dist_neck_LShoulder = 1000*pdist(arr_neck_LShoulder);
% 
%     arr_LShoulder_LElbow = [ini_LShoulder;ini_LElbow];
%     dist_LShoulder_LElbow = 1000*pdist(arr_LShoulder_LElbow);
    l1 = dist_RShoulder_RElbow;
    l2 = dist_RElbow_RHand;
    
%     l1 = round(dist_RShoulder_RElbow);
%     l2 = round(dist_RElbow_RHand);
    
    
end