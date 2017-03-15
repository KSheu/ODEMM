% This script generates the model incorporating only the means by reaction
% rate equations, estimates the parameters and calculates the profile
% likelihoods.

clear all;
close all;
clc;

%% Measurement data
load('./project/data/data_geneExp');

%% Definition parameters
parameters.name = {'log_{10}(k_1)','log_{10}(k_{2,1})','log_{10}(k_{2,2})',...
    'log_{10}(k_{3})',...
    'log_{10}(k_4)','log_{10}(k_5)','w'};

parameters.number = length(parameters.name);
parameters.min = [-3*ones(6,1);0];
parameters.max = [ 3*ones(6,1);1];

%% Model definition
M.name = 'geneExp_RRE';
M.n_subpop = 2; %number of subpopulations
M.model = @(T,theta,u) simulate_geneExp_RRE(T,theta,[]);
e = 1; % experiment index
for s = 1:M.n_subpop
    M.mean_ind{s,e} = [1]; %index of mean in output
    M.var_ind{s,e} = []; %index of variances in output (empty if RREs used)
end
M.sim_type = 'RRE';

% definition of symbolic parameters required for generateODEMM
xi = sym(zeros(parameters.number,1));
for i = 1:parameters.number
    xi(i) = sym(['xi_' num2str(i,'%d')]);
end

u = sym(zeros(1,1)); % 1 for definition of stimulation, 1 for subpop, 1 for experiment
for i = 1:2
    u(i) = sym(['u_' num2str(i,'%d')]);
end

n_siminput = size(D(e).u,1); % number of input for simulation of inidividual subpopulation
M.sym.theta = [10.^xi(1);... %k1
    u(n_siminput+1)*10.^xi(2)+(1-u(n_siminput+1))*10.^xi(3);... %k2
    10.^xi(4);... %k3
    10.^xi(5);...%k4
    10.^xi(6)];%k5

M.u{1,e} = [1]; % subpop, condition, experiment
M.u{2,e} = [0];

% distribution assumption
for s = 1:M.n_subpop
    M.distribution{s,e} = 'norm'; % 'norm', 'logn_median'
end
% definition weights
M.sym.w{1,e} = ones(size(D(e).t(:)))*xi(7);
M.sym.w{2,e} = ones(size(D(e).t(:)))*(1-xi(7));

r=1;
M.sym.scaling{r,e} = [sym('1')];
M.sym.offset{r,e} = [sym('0')];

[conditions,D] = collectConditions(D,M);
options.sigmas = 'time-dependent';
options.boundaries.min = -4;
options.boundaries.max = 2;
[parameters,conditions,D] = getRREsigmas(parameters,conditions,options,D,M);

generateODEMM(D,M,parameters,conditions,options)
eval(['ODEMM_' M.name]);

xi = (parameters.max+parameters.min)/2;
[g,g_fd_f,g_fd_b,g_fd_c] = testGradient(xi,@(xi) logLikelihood(xi,M,D,options,conditions),1e-4);
[g,g_fd_f,g_fd_b,g_fd_c]

%% Multi-start optimization
options.MS.fmincon = optimset('GradObj','on','display','iter','TolFun',1e-10, ...
    'TolX',1e-10, 'MaxIter', 1000,'algorithm','interior-point');
options.MS.n_starts = 100;
options.MS.comp_type = 'sequential'; options.MS.mode = 'visual';
parameters = getMultiStarts(parameters,@(xi) logLikelihood(xi,M,D,options,conditions),options.MS);
save ./project/results/geneExp_RRE parameters D M options conditions 

%% Profile likelihood calculation
options_PL.fmincon = optimset('GradObj','on','display','off','MaxIter',50,...
    'algorithm','trust-region-reflective');
options_PL.parameter_index = 1:7;
options_PL.P.min = max(-6,parameters.min);
options_PL.P.max = min( 6,parameters.max);
options_PL.P_next_step.min = 1e-3;
options_PL.MAP_index = 1;
parameters = getParameterProfiles(parameters,@(xi) logLikelihood(xi,M,D,options,conditions),options_PL);
parameters.MS.BIC = -2*parameters.MS.logPost+ log(sum(sum(~isnan(D(1).y))))*parameters.number;
save ./project/results/geneExp_RRE parameters D M options conditions 

options_PL.parameter_index = [4,6];
options_PL.MAP_index = 2;
parameters_2 = getParameterProfiles(parameters,@(xi) logLikelihood(xi,M,D,options,conditions),options_PL);
save ./project/results/geneExp_RRE_2ndmode parameters_2 D M options conditions 