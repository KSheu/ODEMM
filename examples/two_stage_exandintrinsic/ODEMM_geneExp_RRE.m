%% Definition of model
M.name = 'geneExp_RRE'; 
M.n_subpop = 2; 
M.model = @(T,theta,u)simulate_geneExp_RRE(T,theta,[]); 
M.theta = @(xi,u)[10^xi(1);10^xi(2)*u(2) - 10^xi(3)*(u(2) - 1);10^xi(4);10^xi(5);10^xi(6)];
M.dthetadxi= @(xi,u)[10^xi(1)*log(10),0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
	0,10^xi(2)*u(2)*log(10),-10^xi(3)*log(10)*(u(2) - 1),0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
	0,0,0,10^xi(4)*log(10),0,0,0,0,0,0,0,0,0,0,0,0,0;...
	0,0,0,0,10^xi(5)*log(10),0,0,0,0,0,0,0,0,0,0,0,0;...
	0,0,0,0,0,10^xi(6)*log(10),0,0,0,0,0,0,0,0,0,0,0];

% Subpopulation 1 
% Experiment 1 
s=1; e=1;
M.mean_ind{s,e} = [1];
M.var_ind{s,e} = [];
M.w_ind{s,e} = [];
M.mu{s,e} = @(t,x,sigma,xi,u) [x(:,1)];
M.dmudxi{s,e} = @(t,x,dxdxi,sigma,dsigmadxi,xi,u) bsxfun(@plus, [permute(dxdxi(1,:,:),[3,2,1])],...
	bsxfun(@plus,[0],...
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]));

M.sigma{s,e} = @(t,x,xi,u)	[10^xi(8);10^xi(9);10^xi(10);10^xi(11);10^xi(12)];
M.dsigmadxi{s,e} = @(t,x,dxdxi,xi,u)	bsxfun(@plus, [0;0;0;0;0],...
	[0,0,0,0,0,0,0,10^xi(8)*log(10),0,0,0,0,0,0,0,0,0;...
	0,0,0,0,0,0,0,0,10^xi(9)*log(10),0,0,0,0,0,0,0,0;...
	0,0,0,0,0,0,0,0,0,10^xi(10)*log(10),0,0,0,0,0,0,0;...
	0,0,0,0,0,0,0,0,0,0,10^xi(11)*log(10),0,0,0,0,0,0;...
	0,0,0,0,0,0,0,0,0,0,0,10^xi(12)*log(10),0,0,0,0,0]);

M.w{s,e} = @(t,x,xi,u)[xi(7);xi(7);xi(7);xi(7);xi(7)];
M.dwdxi{s,e} = @(t,x,dxdxi,xi,u)bsxfun(@plus, [0;0;0;0;0],...
	[0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0;...
	0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0;...
	0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0;...
	0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0;...
	0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0]);
M.distribution{s,e} = 'norm';

M.u{s,e} = [1];
r=1;
M.scaling{r,e} = @(xi,u)[1];
M.offset{r,e} = @(xi,u)[0];
M.dscalingdxi{r,e} = @(xi,u)[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
M.doffsetdxi{r,e} = @(xi,u)[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% Subpopulation 2 
% Experiment 1 
s=2; e=1;
M.mean_ind{s,e} = [1];
M.var_ind{s,e} = [];
M.w_ind{s,e} = [];
M.mu{s,e} = @(t,x,sigma,xi,u) [x(:,1)];
M.dmudxi{s,e} = @(t,x,dxdxi,sigma,dsigmadxi,xi,u) bsxfun(@plus, [permute(dxdxi(1,:,:),[3,2,1])],...
	bsxfun(@plus,[0],...
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]));

M.sigma{s,e} = @(t,x,xi,u)	[10^xi(13);10^xi(14);10^xi(15);10^xi(16);10^xi(17)];
M.dsigmadxi{s,e} = @(t,x,dxdxi,xi,u)	bsxfun(@plus, [0;0;0;0;0],...
	[0,0,0,0,0,0,0,0,0,0,0,0,10^xi(13)*log(10),0,0,0,0;...
	0,0,0,0,0,0,0,0,0,0,0,0,0,10^xi(14)*log(10),0,0,0;...
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,10^xi(15)*log(10),0,0;...
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10^xi(16)*log(10),0;...
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10^xi(17)*log(10)]);

M.w{s,e} = @(t,x,xi,u)[1 - xi(7);1 - xi(7);1 - xi(7);1 - xi(7);1 - xi(7)];
M.dwdxi{s,e} = @(t,x,dxdxi,xi,u)bsxfun(@plus, [0;0;0;0;0],...
	[0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0;...
	0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0;...
	0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0;...
	0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0;...
	0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0]);
M.distribution{s,e} = 'norm';

M.u{s,e} = [0];
r=1;
M.scaling{r,e} = @(xi,u)[1];
M.offset{r,e} = @(xi,u)[0];
M.dscalingdxi{r,e} = @(xi,u)[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
M.doffsetdxi{r,e} = @(xi,u)[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];


parameters.name = {'log_{10}(k_1)',...
'log_{10}(k_{2,1})',...
'log_{10}(k_{2,2})',...
'log_{10}(k_{3})',...
'log_{10}(k_4)',...
'log_{10}(k_5)',...
'w',...
'log_{10}(\sigma_{exp. 1, t=0, u=1 s = 1 }',...
'log_{10}(\sigma_{exp. 1, t=5, u=1 s = 1 }',...
'log_{10}(\sigma_{exp. 1, t=10, u=1 s = 1 }',...
'log_{10}(\sigma_{exp. 1, t=30, u=1 s = 1 }',...
'log_{10}(\sigma_{exp. 1, t=60, u=1 s = 1 }',...
'log_{10}(\sigma_{exp. 1, t=0, u=1 s = 2 }',...
'log_{10}(\sigma_{exp. 1, t=5, u=1 s = 2 }',...
'log_{10}(\sigma_{exp. 1, t=10, u=1 s = 2 }',...
'log_{10}(\sigma_{exp. 1, t=30, u=1 s = 2 }',...
'log_{10}(\sigma_{exp. 1, t=60, u=1 s = 2 }'};
parameters.number = length(parameters.name);
parameters.max = [3;3;3;3;3;3;1;2;2;2;2;2;2;2;2;2;2];
parameters.min = [-3;-3;-3;-3;-3;-3;0;-4;-4;-4;-4;-4;-4;-4;-4;-4;-4];
