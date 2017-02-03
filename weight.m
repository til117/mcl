% function S_bar = weight(S_bar,Psi,outlier)
%           S_bar(t)            4XM
%           outlier             1Xn
%           Psi(t)              1XnXM
% Outputs: 
%           S_bar(t)            4XM
function S_bar = weight(S_bar,Psi,outlier)
% FILL IN HERE
%BE CAREFUL TO NORMALIZE THE FINAL WEIGHTS
% Using eq. (12) from Lab2 PF
w = prod(Psi(1,~outlier,:),2);
S_bar(4,:) = w/sum(w);
end
