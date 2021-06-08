%% Drawing bar plot for manipulability measure scales 

% totally 10 steps 
red = linspace(1,0,10)';
blue = linspace(0,1,10)';
dum_zeros = zeros(10,1);
rgb_map = [red dum_zeros blue];

% draw plot 
fig_total = figure('position', [0, 0, 600, 600]);
x_temp = [1;nan]; % 10 jobs
pos_bar1 = [];
y_temp = [];
% maxium measure = 2
scale = 1/10;
y_temp =[scale scale scale scale scale ....
    scale scale scale scale scale; nan(1,10)];
    
pos_bar1 = bar(x_temp,y_temp, 'stacked');
for i = 1:10
    pos_bar1(i).FaceColor = 'flat';
    pos_bar1(i).CData = rgb_map(i,:);
end

a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',12,'FontWeight','bold')
xticks([]);

ylim([0 1]);
str_title = 'Manipulability Measure Scale';
% title(str_title,'FontSize', 14);
% legend([],'FontSize', 12, 'Location', 'northeastoutside');
yticks([]);
str_legend = ["0.01"...
"0.03"...
"0.05"...
"0.07"...
"0.09"...
"0.11"...
"0.13"...
"0.15"...
"0.17"...
"0.19"];
legend(str_legend,'FontSize',14);

