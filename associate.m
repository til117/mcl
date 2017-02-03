% function [outlier,Psi] = associate(S_bar,z,W,Lambda_psi,Q)
%           S_bar(t)            4XM
%           z(t)                2Xn
%           W                   2XN
%           Lambda_psi          1X1
%           Q                   2X2
% Outputs: 
%           outlier             1Xn
%           Psi(t)              1XnXM
function [outlier,Psi] = associate(S_bar,z,W,Lambda_psi,Q)
% FILL IN HERE
%BE SURE THAT YOUR innovation 'nu' has its second component in [-pi, pi]
% Using Alg. (4) from Lab2 PF
M = size(S_bar,2);  
k = size(z,2);     
N = size(W,2);   
Psi = zeros(1,k,M);
Qinv=inv(Q);
Psi_k=zeros(N,M);
for i=1:k 
  for k=1:N 
    zh=observation_model(S_bar,W,k);
    nu=repmat(z(:,i),1,M)-zh;
    nu(2,:)= wrapToPi(nu(2,:));
    D=sum(nu.*(Qinv*nu));
    Psi_k(k,:)= det(2*pi*Q)^(-1/2)*exp(-1/2*D);
  end
Psi(1,i,:)  = reshape(max(Psi_k),1,1,M);
end
outlier=mean(Psi,3)<=Lambda_psi;
end
