%% Convert pepper joint coordinate for visualization
function total_output = viz_convert_adulthuman(filename_human)
    % reconstruct to output excel file
    [~,temp_sheet_name] = xlsfinfo(filename_human);
    elementname = temp_sheet_name;
    for k = 4 : numel(elementname)
      [~,~,data_human{k-3}] = xlsread(filename_human,elementname{k});
    end

    sz_frames = size(data_human{1},1)-1;
    
    % Head {1}
    cell_Head = data_human{1};
    % translation
    Head = cell2mat(cell_Head(2:end,1:3));
    % quaternion
    Head_qvec = [cell2mat(cell_Head(2:end,7)) cell2mat(cell_Head(2:end,4:6))];
    
    % Neck {2}
    cell_Neck = data_human{2};
    % translation
    Neck = cell2mat(cell_Neck(2:end,1:3));
    % quaternion
    Neck_qvec = [cell2mat(cell_Neck(2:end,7)) cell2mat(cell_Neck(2:end,4:6))];

    % torso {3}
    cell_Torso = data_human{3};
    % translation
    Torso = cell2mat(cell_Torso(2:end,1:3));
    % quaternion
    Torso_qvec = [cell2mat(cell_Torso(2:end,7)) cell2mat(cell_Torso(2:end,4:6))];
    
    % LShoulder {4}
    cell_LShoulder = data_human{4};
    % translation
    LShoulder = cell2mat(cell_LShoulder(2:end,1:3));
    % quaternion
    LShoulder_qvec = [cell2mat(cell_LShoulder(2:end,7)) cell2mat(cell_LShoulder(2:end,4:6))];
    
    % LElbow {5}
    cell_LElbow = data_human{5};
    % translation
    LElbow = cell2mat(cell_LElbow(2:end,1:3));
    % quaternion
    LElbow_qvec = [cell2mat(cell_LElbow(2:end,7)) cell2mat(cell_LElbow(2:end,4:6))];
    
    % LHand {6}
    cell_LHand = data_human{6};
    % translation
    LHand = cell2mat(cell_LHand(2:end,1:3));
    % quaternion
%     LHand_qvec = [cell2mat(cell_LHand(2:end,7)) cell2mat(cell_LHand(2:end,4:6))];
    
    % RShoulder {7}
    cell_RShoulder = data_human{7};
    % translation
    RShoulder = cell2mat(cell_RShoulder(2:end,1:3));
    % quaternion
    RShoulder_qvec = [cell2mat(cell_RShoulder(2:end,7)) cell2mat(cell_RShoulder(2:end,4:6))];
    
    % RElbow {8}%
    cell_RElbow = data_human{8};
    % translation
    RElbow = cell2mat(cell_RElbow(2:end,1:3));
    % quaternion
    RElbow_qvec = [cell2mat(cell_RElbow(2:end,7)) cell2mat(cell_RElbow(2:end,4:6))];
    
    % RHand {9}
    cell_RHand = data_human{9};
    % translation
    RHand = cell2mat(cell_RHand(2:end,1:3));
    % quaternion
%     RHand_qvec = [cell2mat(cell_RHand(2:end,7)) cell2mat(cell_RHand(2:end,4:6))];
    
    % LHip {10}
    cell_LHip = data_human{10};
    % translation
    LHip = cell2mat(cell_LHip(2:end,1:3));
    % quaternion
    LHip_qvec = [cell2mat(cell_LHip(2:end,7)) cell2mat(cell_LHip(2:end,4:6))];
    
    % RHip {11}
    cell_RHip = data_human{11};
    % translation
    RHip = cell2mat(cell_RHip(2:end,1:3));
    % quaternion
    RHip_qvec = [cell2mat(cell_RHip(2:end,7)) cell2mat(cell_RHip(2:end,4:6))];
    
    % Make position output
    total_output = table(Head,Neck,Torso,...
        LShoulder,LElbow,LHand,...
        RShoulder,RElbow,RHand,...
        LHip,RHip);
 
end