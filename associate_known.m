% function [outlier,Psi] = associate_known(S_bar,z,W,Lambda_psi,Q,known_associations)
%           S_bar(t)            4XM
%           z(t)                2Xn
%           W                   2XN
%           Lambda_psi          1X1
%           Q                   2X2
%           known_associations  1Xn
% Outputs: 
%           outlier             1Xn
%           Psi(t)              1XnXM
function [outlier,Psi] = associate_known(S_bar,z,W,Lambda_psi,Q,known_associations)
% FILL IN HERE
%BE SURE THAT YOUR innovation 'nu' has its second component in [-pi, pi]
% also notice that you have to do something here even if you do not have to maximize the likelihood.
% Using Alg. (4) from Lab2 PF 
k=size(z,2);       
Psi=zeros(1,k,size(S_bar,2));
Psi_k=zeros(size(W,2),size(S_bar,2));
for i =1:k 
  for k =1:size(W,2) 
    zh=observation_model(S_bar,W,k);
    nu=repmat(z(:, i),1,size(S_bar,2))-zh;
    nu(2,:)=wrapToPi(nu(2,:));
    D=sum(nu'.*(inv(Q)*nu));
    Psi_k(k,:)=det(2*pi*Q)^(-1/2)*exp(-1/2*D);
  end
  Psi(1,i,:)=reshape(max(Psi_k),1,1,size(S_bar,2));
end
end
