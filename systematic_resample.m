% function S = systematic_resample(S_bar)
% This function performs systematic re-sampling
% Inputs:   
%           S_bar(t):       4XM
% Outputs:
%           S(t):           4XM
function S = systematic_resample(S_bar)
% FILL IN HERE
% Using Alg. (3) from Lab2 PF
cdf = cumsum(S_bar(4,:));
S(1,:) = zeros(size(S_bar(1,:))); S(2,:) = zeros(size(S_bar(2,:))); S(3,:) = zeros(size(S_bar(3,:)));
M = size(S_bar(1,:),2);
r0 = rand/M;
for m = 1:M
    i = find(cdf >= r0,1);
    S(1,m,:)=S_bar(1,i,:);
    S(2,m,:)=S_bar(2,i,:);
    S(3,m,:)=S_bar(3,i,:);
    r0 = r0+1/M;
end
S(4,:)=1/M*ones(size(S_bar(4,:)));
end
