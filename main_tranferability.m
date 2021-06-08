%% Calculate total transferability

% KL_div = [0.1029;0.0623;0.5913;2.7205;0.5916;2.7391];

% % for source base 
% KL_div = [5.60E-03;7.32E-02;0.592378285;2.772108866;0.591064863;2.740148588];
% capa = [0.326530612;0.212885154;0.112178205;0.321869489;0.111644658;0.326152683];
% capa2 = [0.326530612;0.212885154;0.112178205;0.321869489;0.111644658;0.326152683];
% Len = [0.767035133752994;0.767035133752994;0.550408192692471;0.550408192692471;...
%     0.717578854568762;0.717578854568762];

% for coincident area
KL_div = [2.67E-04;1.83E-04;0.095133573;0.072000222;0.095079215;0.071124683];
capa = [0.605341246;0.394658754;0.247644287;0.752355713;0.244308231;0.755691769];
capa2 = [0.605341246;0.394658754;0.247644287;0.752355713;0.244308231;0.755691769];
Len = [0.767035133752994;0.767035133752994;0.550408192692471;0.550408192692471;...
    0.717578854568762;0.717578854568762];

sz_KL = size(KL_div,1);

output = zeros(6,1);

% % normalize KL divergence 
% max_k = max(KL_div);
% min_k = min(KL_div);
% for i_k = 1:sz_KL
%     re_KL_div(i_k,1) = (KL_div(i_k) - min_k)/max_k;
% end

for i = 1:sz_KL
    % convert D to sigmoid 
    sig_D(i,1) = sigm(KL_div(i,1));
%     sig_D(i,1) = KL_div(i,1);
    output(i,1) = Len(i)*(capa(i) + (1 - sig_D(i))*(1 - capa2(i)));
    
    
%     output2(i,1) = (capa(i) + (1 - sig_D(i))*(1 - capa2(i)));
%     output3(i,1) = Len(i)*(capa(i) + (1 - re_KL_div(i))*(1 - capa(i)));
%     output4(i,1) = (capa(i) + (1 - re_KL_div(i))*(1 - capa(i)));
%     
%     output_2(i,1) = Len(i)*(capa(i) + (1 - sig_D(i))*(1 - capa2(i)) - (capa2(i)-capa(i)));
%     output2_2(i,1) = (capa(i) + (1 - sig_D(i))*(1 - capa2(i)) - (capa2(i)-capa(i)));
end

% adult2kid2pepper T3' = sigmoid(T1)*T2

% sigmoid 
% t1 = adult2kid, t2 kid2pepper 
t1 = 0.508024590036455;
t2 = 0.233548272778948;
t3_dot_sig = sigm(t1)*t2
t3_dot_tanh = t1*t2



% kid2adult2pepper = T2' = sigmoid(T1')*T3
% t1_dot = kid2adult , t3 = adult2pepper
t1_dot = 0.454119165146169;
t3 = 0.235751988695788;
t2_dot_sig = sigm(t1_dot)*t3
t2_dot_tanh = t1_dot*t3





%% additional cal, capability 
capa = 0.01*[47.43;51.66;20.15;65.37;20.33;64.92];
capa2 = 0.01*[48.31;52.59;35.94;79.44;36.41;79.24];

for i = 1:6
    ratio(i,1) = capa(i,1)/(1-capa2(i,1));
end


%% alpha
a = 0.76;
b = [0.508024590036455 0.454119165146169 0.307300358919669 0.263364678044559];
answer = a*b











