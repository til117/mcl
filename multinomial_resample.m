% function S = multinomial_resample(S_bar)
% This function performs systematic re-sampling
% Inputs:   
%           S_bar(t):       4XM
% Outputs:
%           S(t):           4XM
function S = multinomial_resample(S_bar)
% FILL IN HERE
% Using Alg. (2) from Lab2 PF
cdf = cumsum(S_bar(4,:));
S(1,:) = zeros(size(S_bar(1,:))); X(1,:) = S(1,:); X_bar(1,:) = S_bar(1,:);
S(2,:) = zeros(size(S_bar(2,:))); X(2,:) = S(2,:); X_bar(2,:) = S_bar(2,:);
S(3,:) = zeros(size(S_bar(3,:))); X(3,:) = S(3,:); X_bar(3,:) = S_bar(3,:);
M = size(S_bar(1,:),2);
for m = 1 : M
    rn = rand;
    i = find(cdf >= rn,1);
    X(:,m)=X_bar(:,i);
    X(:,m)=X_bar(:,i);
    X(:,m)=X_bar(:,i);
end
S(1,:)=X(1,:); S(2,:)=X(2,:); S(3,:)=X(3,:); S(4,:)= 1/M*ones(size(S_bar(4,:)));
end
