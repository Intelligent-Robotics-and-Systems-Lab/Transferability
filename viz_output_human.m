%% function find_match_pepper 
function  viz_output_human(trained_human_real,output_path)
    
    % Convert pepper trained dataset
    total_human_real = viz_convert_adulthuman(trained_human_real);
    
    sz_frames = size(total_human_real.Torso,1);
    
    % Initialize human real
    a_torso = total_human_real.Torso;
    a_torso = [-a_torso(:,3) -a_torso(:,1) a_torso(:,2)];
    a_Head_pos_torso = total_human_real.Head;
    a_Head_pos_torso = [-a_Head_pos_torso(:,3) -a_Head_pos_torso(:,1) a_Head_pos_torso(:,2)];
    a_Neck_pos_torso = total_human_real.Neck;
    a_Neck_pos_torso = [-a_Neck_pos_torso(:,3) -a_Neck_pos_torso(:,1) a_Neck_pos_torso(:,2)];
    a_LShoulder_pos_torso = total_human_real.LShoulder;
    a_LShoulder_pos_torso = [-a_LShoulder_pos_torso(:,3) -a_LShoulder_pos_torso(:,1) a_LShoulder_pos_torso(:,2)];
    a_LElbow_pos_torso = total_human_real.LElbow;
    a_LElbow_pos_torso = [-a_LElbow_pos_torso(:,3) -a_LElbow_pos_torso(:,1) a_LElbow_pos_torso(:,2)];
    a_LHand_pos_torso = total_human_real.LHand;
    a_LHand_pos_torso = [-a_LHand_pos_torso(:,3) -a_LHand_pos_torso(:,1) a_LHand_pos_torso(:,2)];
    a_RShoulder_pos_torso = total_human_real.RShoulder;
    a_RShoulder_pos_torso = [-a_RShoulder_pos_torso(:,3) -a_RShoulder_pos_torso(:,1) a_RShoulder_pos_torso(:,2)];
    a_RElbow_pos_torso = total_human_real.RElbow;
    a_RElbow_pos_torso = [-a_RElbow_pos_torso(:,3) -a_RElbow_pos_torso(:,1) a_RElbow_pos_torso(:,2)];
    a_RHand_pos_torso = total_human_real.RHand;
    a_RHand_pos_torso = [-a_RHand_pos_torso(:,3) -a_RHand_pos_torso(:,1) a_RHand_pos_torso(:,2)];
    a_LHip_torso = total_human_real.LHip;
    a_LHip_torso = [-a_LHip_torso(:,3) -a_LHip_torso(:,1) a_LHip_torso(:,2)];
    a_RHip_torso = total_human_real.RHip;
    a_RHip_torso = [-a_RHip_torso(:,3) -a_RHip_torso(:,1) a_RHip_torso(:,2)];
    
    % drawing
    if sz_frames > 50
        sz_frames = 50;
    end
    fig1 = figure;
    for i = 1:sz_frames
        
        
        % For pepper real
        temp_total_human_real = [a_torso(i,:);a_Head_pos_torso(i,:);a_Neck_pos_torso(i,:);...
            a_LShoulder_pos_torso(i,:);a_LElbow_pos_torso(i,:);a_LHand_pos_torso(i,:);...
            a_RShoulder_pos_torso(i,:);a_RElbow_pos_torso(i,:);a_RHand_pos_torso(i,:);...
            a_LHip_torso(i,:);a_RHip_torso(i,:)];
        % draw all joints points
        scatter3(temp_total_human_real(:,1),temp_total_human_real(:,2),temp_total_human_real(:,3),'*b');
%         % draw torso
%         scatter3(torso(i,1),torso(i,2),torso(i,3),'*r');
%         % draw hip
%         scatter3(Hip(i,1),Hip(i,2),Hip(i,3),'*b');
        axis equal;
        hold on;
        
        widths = 1;
        % draw lines between joints
        legend1 = line([a_torso(i,1) a_Neck_pos_torso(i,1)],[a_torso(i,2) a_Neck_pos_torso(i,2)],[a_torso(i,3) a_Neck_pos_torso(i,3)],'Color','b','LineWidth',widths);
        line([a_Neck_pos_torso(i,1) a_Head_pos_torso(i,1)],[a_Neck_pos_torso(i,2) a_Head_pos_torso(i,2)],[a_Neck_pos_torso(i,3) a_Head_pos_torso(i,3)],'Color','b','LineWidth',widths);
        
        line([a_Neck_pos_torso(i,1) a_LShoulder_pos_torso(i,1)],[a_Neck_pos_torso(i,2) a_LShoulder_pos_torso(i,2)],[a_Neck_pos_torso(i,3) a_LShoulder_pos_torso(i,3)],'Color','b','LineWidth',widths);
        line([a_LShoulder_pos_torso(i,1) a_LElbow_pos_torso(i,1)],[a_LShoulder_pos_torso(i,2) a_LElbow_pos_torso(i,2)],[a_LShoulder_pos_torso(i,3) a_LElbow_pos_torso(i,3)],'Color','b','LineWidth',widths);
        line([a_LElbow_pos_torso(i,1) a_LHand_pos_torso(i,1)],[a_LElbow_pos_torso(i,2) a_LHand_pos_torso(i,2)],[a_LElbow_pos_torso(i,3) a_LHand_pos_torso(i,3)],'Color','b','LineWidth',widths);
        
        line([a_Neck_pos_torso(i,1) a_RShoulder_pos_torso(i,1)],[a_Neck_pos_torso(i,2) a_RShoulder_pos_torso(i,2)],[a_Neck_pos_torso(i,3) a_RShoulder_pos_torso(i,3)],'Color','b','LineWidth',widths);
        line([a_RShoulder_pos_torso(i,1) a_RElbow_pos_torso(i,1)],[a_RShoulder_pos_torso(i,2) a_RElbow_pos_torso(i,2)],[a_RShoulder_pos_torso(i,3) a_RElbow_pos_torso(i,3)],'Color','b','LineWidth',widths);
        line([a_RElbow_pos_torso(i,1) a_RHand_pos_torso(i,1)],[a_RElbow_pos_torso(i,2) a_RHand_pos_torso(i,2)],[a_RElbow_pos_torso(i,3) a_RHand_pos_torso(i,3)],'Color','b','LineWidth',widths);
        
        line([a_torso(i,1) a_LHip_torso(i,1)],[a_torso(i,2) a_LHip_torso(i,2)],[a_torso(i,3) a_LHip_torso(i,3)],'Color','b','LineWidth',widths);
        line([a_torso(i,1) a_RHip_torso(i,1)],[a_torso(i,2) a_RHip_torso(i,2)],[a_torso(i,3) a_RHip_torso(i,3)],'Color','b','LineWidth',widths);
        
        xlabel('X');
        ylabel('Y');
        zlabel('Z');
        xlim([-0.80 0.80]);
        ylim([-0.80 0.80]);
        % if human is adult
        zlim([-1.00 0.60]);
%         zlim([-0.75 0.75]);
%         set(gca,'XDir','reverse');
        % need to change view point
        view([80 45 60]);

        legend([legend1],{ 'Real Human'});
        
        hold off;
        temp_num = num2str(i);
        filename = strcat(output_path, 'human_trial_', temp_num ,'.jpg');
        saveas(fig1,filename);
        
    end
    
    
    
    
end
