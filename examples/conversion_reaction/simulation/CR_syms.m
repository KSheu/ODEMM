function [model] = CR_syms()
% This function defines the model of the conversion process with
% the linear output, which is used for the Reaction Rate Equations
%
% Return values:
% model: model struct used with amiwrap

model.param = 'log'; 

%% STATES

% create state syms
syms x1 x2

% create state vector
x = [
x1 x2
];

%% PARAMETERS ( for these sensitivities will be computed )

% create parameter syms
syms k1 k2 k3

% create parameter vector 
p = [k1,k2,k3];

%% SYSTEM EQUATIONS

% create symbolic variable for time
syms t

xdot = sym(zeros(size(x)));

xdot(1) = -(k1+k2)*x1+k3*x2;
xdot(2) = +(k1+k2)*x1-k3*x2 ;


%% INITIAL CONDITIONS

x0 = sym(zeros(size(x)));

x0(1) = 1-k2/k3;
x0(2) = k2/k3;


%% OBSERVABLES

y = sym(zeros(1,1));
y(1) = x2;

%% SYSTEM STRUCT
model.sym.x = x;
model.sym.xdot = xdot;
model.sym.p = p;
model.sym.x0 = x0;
model.sym.y = y;
end