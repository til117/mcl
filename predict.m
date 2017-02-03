% function [S_bar] = predict(S,u,R)
% This function should perform the prediction step of MCL
% Inputs:
%           S(t-1)              4XM
%           v(t)                1X1
%           omega(t)            1X1
%           R                   3X3
%           delta_t             1X1
% Outputs:
%           S_bar(t)            4XM
function [S_bar] = predict(S,v,omega,R,delta_t)
% FILL IN HERE
% Using eq. (3) from Lab2 PF
M=size(S,2);
S_bar=zeros(4,M);
R1=ones(4,M);
R1(1,:) = repmat(R(1,1),1,M); R1(2,:) = repmat(R(2,2),1,M); R1(3,:) = repmat(R(3,3),1,M);
S_bar(1,:) = S(1,:) + delta_t * v*cos(S(3,:)) + (randn(1,M).*R1(1,:));
S_bar(2,:) = S(2,:) + delta_t * v*sin(S(3,:)) + (randn(1,M).*R1(2,:));
S_bar(3,:) = S(3,:) + repmat(delta_t*omega,1,M) + (randn(1,M).*R1(3,:));
S_bar(4,:) = S(4,:);
end