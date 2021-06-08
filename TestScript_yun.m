
clear; clc; 
% This is the least squared norm but can be changed to any distance. KL
% Divergence could be here or perhaps we could some other metric here.
% Ground_Distance_Matrix_Func = @(v1,v2) norm(v1-v2,2);
Ground_Distance_Matrix_Func = @(v1,v2) KLDiv(v1',v2');

% the columns are the different features we have and the robots we want
% pull from should be the rows. May be more than a single row.
% Vec1 = [[5, 10, 5, 5, 5, 5];
%         [5, 6, 10, 8, 7, 1];];
Vec1 = [5, 10, 5, 5, 5, 5];

% The columns are the different features we have and the row is the robot
% we want to match. I think this should only ever be one row for our system

Vec2 = [10, 10, 10, 10, 10, 10];

% These weights are the size of the rows. This is usually represented as
% the frequency of different values for a robot configuration. Treat these
% as masses which are allowed to contribute the new robot.
% W1 = [0.8;0.4;];
W1 = 1;
W2 = 1;

[flow_A_to_B,Earth_Movers_dist] = EMD(Vec1,Vec2,W1,W2,Ground_Distance_Matrix_Func);
partial_weights_assignments=reshape(flow_A_to_B,[size(Vec2,1),size(Vec1,1)]);


% test 1 norm Earth_Movers_dist = 11.1803
% test 2 KLDiv Earth_Movers_dist = 0.049