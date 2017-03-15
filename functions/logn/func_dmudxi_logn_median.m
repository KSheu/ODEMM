function dmudxi = func_dmudxi_logn_median(t,x,dxdxi,Sigma,dSigmadxi,xi,u,dim)
% This function calculates the derivative of mu of a log-normal
% distribution for the case of linking the mean of the simulation to the
% median of the log-normal distributin
%
% Parameters:
% t: time vector (not used, included for consistency and possible extensions)
% x: vector of means and variances (not used, included for consistency and possible extensions)
% dxdxi: derivatives of means and variances
% Sigma: (not used, included for consistency and possible extensions)
% dSigmadxi: (not used, included for consistency and possible extensions)
% xi: parameter vector (not used, included for consistency and possible extensions)
% u: input (not used, included for consistency and possible extensions)
% n_dim: dimension of measurement
%
% Return values:
% dmudxi: derivative of mu of a log-normal distribution

dmudxi=zeros(numel(t),numel(xi),dim);
for k = 1:dim
    dmudxi(:,:,k) = bsxfun(@rdivide,permute(dxdxi(k,:,:),[3,2,1]),x(:,k));
end

end