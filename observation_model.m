% function h = observation_model(S,W,j)
% This function is the implementation of the observation model
% The bearing should lie in the interval [-pi,pi)
% Inputs:
%           S           4XM
%           W           2XN
%           j           1X1
% Outputs:  
%           h           2XM
function h = observation_model(S,W,j)
% FILL IN HERE
% Complementary to the associate.m function
w = repmat(W(:,j),1,size(S,2));
br = atan2(w(2,:)-S(2,:),w(1,:)-S(1,:))-S(3,:);
br = mod(br+pi,2*pi)-pi;
h = [sqrt((w(1,:)-S(1,:)).^2+(w(2,:)-S(2,:)).^2);br];
end