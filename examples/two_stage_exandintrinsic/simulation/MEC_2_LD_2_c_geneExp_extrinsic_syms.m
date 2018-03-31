function [model] = MEC_2_LD_2_c_geneExp_extrinsic_syms(varargin)
% This function provides the model definition for the moment approximation
% with additional extrinsic noise of the two stage gene expression. 
% It is generated by the toolbox CERENA.

% CVODES OPTIONS

model.atol = 1e-8;
model.rtol = 1e-8;
model.maxsteps = 1e4;

% STATES

syms mu_1 mu_2 mu_3 mu_4 mu_5 mu_6 mu_7 C_1_1 C_1_2 C_1_3 C_1_4 C_1_5 C_1_6 C_1_7 C_2_2 C_2_3 C_2_4 C_2_5 C_2_6 C_2_7 C_3_3 C_3_4 C_3_5 C_3_6 C_3_7 C_4_4 C_4_5 C_4_6 C_4_7 C_5_5 C_5_6 C_5_7 C_6_6 C_6_7 C_7_7

x = [
mu_1, mu_2, mu_3, mu_4, mu_5, mu_6, mu_7, C_1_1, C_1_2, C_1_3, C_1_4, C_1_5, C_1_6, C_1_7, C_2_2, C_2_3, C_2_4, C_2_5, C_2_6, C_2_7, C_3_3, C_3_4, C_3_5, C_3_6, C_3_7, C_4_4, C_4_5, C_4_6, C_4_7, C_5_5, C_5_6, C_5_7, C_6_6, C_6_7, C_7_7 ...
];

% PARAMETERS

syms mk1 mk2 mk3 mk4 mk5 vk1 vk2 vk3 vk4 vk5 

% KAPPA (constant parameters)

syms indmu1 indmu2 indmu3 indmu4 indmu5 indmu6 indmu7 indC1 indC2 indC3 indC4 indC5 indC6 indC7 indC8 indC9 indC10 indC11 indC12 indC13 indC14 indC15 indC16 indC17 indC18 indC19 indC20 indC21 indC22 indC23 indC24 indC25 indC26 indC27 indC28 kmu01 kmu02 kmu03 kmu04 kmu05 kmu06 kmu07 kC01 kC02 kC03 kC04 kC05 kC06 kC07 kC08 kC09 kC010 kC011 kC012 kC013 kC014 kC015 kC016 kC017 kC018 kC019 kC020 kC021 kC022 kC023 kC024 kC025 kC026 kC027 kC028 

syms t

p = [mk1,mk2,mk3,mk4,mk5,vk1,vk2,vk3,vk4,vk5];

k = [indmu1,indmu2,indmu3,indmu4,indmu5,indmu6,indmu7,indC1,indC2,indC3,indC4,indC5,indC6,indC7,indC8,indC9,indC10,indC11,indC12,indC13,indC14,indC15,indC16,indC17,indC18,indC19,indC20,indC21,indC22,indC23,indC24,indC25,indC26,indC27,indC28,kmu01,kmu02,kmu03,kmu04,kmu05,kmu06,kmu07,kC01,kC02,kC03,kC04,kC05,kC06,kC07,kC08,kC09,kC010,kC011,kC012,kC013,kC014,kC015,kC016,kC017,kC018,kC019,kC020,kC021,kC022,kC023,kC024,kC025,kC026,kC027,kC028];

if nargin > 0
   f0_user = varargin{1};
   if ~isnumeric(f0_user)
      p_user = setdiff(symvar(f0_user),p);
      % ADDITIONAL PARAMETERS IN INITIAL CONDITIONS
      p = [p,p_user];
   end
	fmu01 = f0_user(1); 
	fmu02 = f0_user(2); 
	fmu03 = f0_user(3); 
	fmu04 = f0_user(4); 
	fmu05 = f0_user(5); 
	fmu06 = f0_user(6); 
	fmu07 = f0_user(7); 
	fC01 = f0_user(8); 
	fC02 = f0_user(9); 
	fC03 = f0_user(10); 
	fC04 = f0_user(11); 
	fC05 = f0_user(12); 
	fC06 = f0_user(13); 
	fC07 = f0_user(14); 
	fC08 = f0_user(15); 
	fC09 = f0_user(16); 
	fC010 = f0_user(17); 
	fC011 = f0_user(18); 
	fC012 = f0_user(19); 
	fC013 = f0_user(20); 
	fC014 = f0_user(21); 
	fC015 = f0_user(22); 
	fC016 = f0_user(23); 
	fC017 = f0_user(24); 
	fC018 = f0_user(25); 
	fC019 = f0_user(26); 
	fC020 = f0_user(27); 
	fC021 = f0_user(28); 
	fC022 = f0_user(29); 
	fC023 = f0_user(30); 
	fC024 = f0_user(31); 
	fC025 = f0_user(32); 
	fC026 = f0_user(33); 
	fC027 = f0_user(34); 
	fC028 = f0_user(35); 
else
	fmu01 = -(1000*mk1*mk3)/(vk3 - mk3^2); 
	fmu02 = (1000*mk1*mk3*mk4)/(mk5*(vk3 - mk3^2)*(vk5/mk5^2 - 1)); 
	fmu03 = mk1; 
	fmu04 = mk2; 
	fmu05 = mk3; 
	fmu06 = mk4; 
	fmu07 = mk5; 
	fC01 = (500000*(mk1/1000 + (2*vk1)/mk3 + (mk1*vk3)/(1000*(vk3 - mk3^2)) - (mk1*mk3^2)/(1000*(vk3 - mk3^2)) + (2*mk1^2*mk3*vk3)/(vk3 - mk3^2)^2))/mk3; 
	fC02 = (1000000*((mk4*(mk1/1000 + (2*vk1)/mk3 + (mk1*vk3)/(1000*(vk3 - mk3^2)) - (mk1*mk3^2)/(1000*(vk3 - mk3^2)) + (2*mk1^2*mk3*vk3)/(vk3 - mk3^2)^2))/(2*mk3) + (mk4*vk1)/(mk3*mk5) + (mk1^2*mk3*mk4*vk3)/(mk5*(vk3 - mk3^2)^2)))/(mk3 + mk5); 
	fC03 = (1000*vk1)/mk3; 
	fC04 = 0; 
	fC05 = (1000*mk1*vk3)/(vk3 - mk3^2); 
	fC06 = 0; 
	fC07 = 0; 
	fC08 = (500000*((2*mk4*((mk4*(mk1/1000 + (2*vk1)/mk3 + (mk1*vk3)/(1000*(vk3 - mk3^2)) - (mk1*mk3^2)/(1000*(vk3 - mk3^2)) + (2*mk1^2*mk3*vk3)/(vk3 - mk3^2)^2))/(2*mk3) + (mk4*vk1)/(mk3*mk5) + (mk1^2*mk3*mk4*vk3)/(mk5*(vk3 - mk3^2)^2)))/(mk3 + mk5) - (mk1*mk3*mk4)/(1000*(vk3 - mk3^2)) + (mk1*mk3*mk4)/(1000*(vk3 - mk3^2)*(vk5/mk5^2 - 1)) + (2*mk1^2*mk3^2*vk4)/(mk5*(vk3 - mk3^2)^2) - (mk1*mk3*mk4*vk5)/(1000*mk5^2*(vk3 - mk3^2)*(vk5/mk5^2 - 1)) + (2*mk1^2*mk3^2*mk4^2*vk5)/(mk5^3*(vk3 - mk3^2)^2*(vk5/mk5^2 - 1)^2)))/mk5; 
	fC09 = (1000*mk4*vk1)/(mk3*mk5); 
	fC010 = 0; 
	fC011 = (1000*mk1*mk4*vk3)/(mk5*(vk3 - mk3^2)); 
	fC012 = -(1000*mk1*mk3*vk4)/(mk5*(vk3 - mk3^2)); 
	fC013 = -(1000*mk1*mk3*mk4*vk5)/(mk5^2*(vk3 - mk3^2)*(vk5/mk5^2 - 1)); 
	fC014 = vk1; 
	fC015 = 0; 
	fC016 = 0; 
	fC017 = 0; 
	fC018 = 0; 
	fC019 = 0; 
	fC020 = 0; 
	fC021 = 0; 
	fC022 = 0; 
	fC023 = vk3; 
	fC024 = 0; 
	fC025 = 0; 
	fC026 = vk4; 
	fC027 = 0; 
	fC028 = vk5; 
end
% INPUT 

u = sym.empty(0,0);

% SYSTEM EQUATIONS

xdot = sym(zeros(size(x)));

xdot(1) = mu_3 - C_1_5 + mu_4 - mu_1*mu_5;
xdot(2) = C_1_6 - C_2_7 + mu_1*mu_6 - mu_2*mu_7;
xdot(3) = 0;
xdot(4) = 0;
xdot(5) = 0;
xdot(6) = 0;
xdot(7) = 0;
xdot(8) = 2*C_1_3 + 2*C_1_4 + C_1_5/1000 + mu_3/1000 + mu_4/1000 - 2*C_1_1*mu_5 - 2*C_1_5*mu_1 + (mu_1*mu_5)/1000;
xdot(9) = C_2_3 + C_2_4 + C_1_1*mu_6 - C_1_2*mu_5 + C_1_6*mu_1 - C_1_2*mu_7 - C_1_7*mu_2 - C_2_5*mu_1;
xdot(10) = C_3_3 + C_3_4 - C_1_3*mu_5 - C_3_5*mu_1;
xdot(11) = C_3_4 + C_4_4 - C_1_4*mu_5 - C_4_5*mu_1;
xdot(12) = C_3_5 + C_4_5 - C_1_5*mu_5 - C_5_5*mu_1;
xdot(13) = C_3_6 + C_4_6 - C_1_6*mu_5 - C_5_6*mu_1;
xdot(14) = C_3_7 + C_4_7 - C_1_7*mu_5 - C_5_7*mu_1;
xdot(15) = C_1_6/1000 + C_2_7/1000 + 2*C_1_2*mu_6 + 2*C_2_6*mu_1 - 2*C_2_2*mu_7 - 2*C_2_7*mu_2 + (mu_1*mu_6)/1000 + (mu_2*mu_7)/1000;
xdot(16) = C_1_3*mu_6 - C_2_3*mu_7 + C_3_6*mu_1 - C_3_7*mu_2;
xdot(17) = C_1_4*mu_6 - C_2_4*mu_7 + C_4_6*mu_1 - C_4_7*mu_2;
xdot(18) = C_1_5*mu_6 - C_2_5*mu_7 + C_5_6*mu_1 - C_5_7*mu_2;
xdot(19) = C_1_6*mu_6 - C_2_6*mu_7 + C_6_6*mu_1 - C_6_7*mu_2;
xdot(20) = C_1_7*mu_6 - C_2_7*mu_7 + C_6_7*mu_1 - C_7_7*mu_2;
xdot(21) = 0;
xdot(22) = 0;
xdot(23) = 0;
xdot(24) = 0;
xdot(25) = 0;
xdot(26) = 0;
xdot(27) = 0;
xdot(28) = 0;
xdot(29) = 0;
xdot(30) = 0;
xdot(31) = 0;
xdot(32) = 0;
xdot(33) = 0;
xdot(34) = 0;
xdot(35) = 0;
% INITIAL CONDITIONS

x0 = sym(zeros(size(x)));

x0(1) = (indmu1*kmu01)/1000 - (fmu01*(indmu1 - 1))/1000;
x0(2) = (indmu2*kmu02)/1000 - (fmu02*(indmu2 - 1))/1000;
x0(3) = (indmu3*kmu03)/1000 - (fmu03*(indmu3 - 1))/1000;
x0(4) = (indmu4*kmu04)/1000 - (fmu04*(indmu4 - 1))/1000;
x0(5) = (indmu5*kmu05)/1000 - (fmu05*(indmu5 - 1))/1000;
x0(6) = (indmu6*kmu06)/1000 - (fmu06*(indmu6 - 1))/1000;
x0(7) = (indmu7*kmu07)/1000 - (fmu07*(indmu7 - 1))/1000;
x0(8) = (indC1*kC01)/1000000 - (fC01*(indC1 - 1))/1000000;
x0(9) = (indC2*kC02)/1000000 - (fC02*(indC2 - 1))/1000000;
x0(10) = (indC3*kC03)/1000000 - (fC03*(indC3 - 1))/1000000;
x0(11) = (indC4*kC04)/1000000 - (fC04*(indC4 - 1))/1000000;
x0(12) = (indC5*kC05)/1000000 - (fC05*(indC5 - 1))/1000000;
x0(13) = (indC6*kC06)/1000000 - (fC06*(indC6 - 1))/1000000;
x0(14) = (indC7*kC07)/1000000 - (fC07*(indC7 - 1))/1000000;
x0(15) = (indC8*kC08)/1000000 - (fC08*(indC8 - 1))/1000000;
x0(16) = (indC9*kC09)/1000000 - (fC09*(indC9 - 1))/1000000;
x0(17) = (indC10*kC010)/1000000 - (fC010*(indC10 - 1))/1000000;
x0(18) = (indC11*kC011)/1000000 - (fC011*(indC11 - 1))/1000000;
x0(19) = (indC12*kC012)/1000000 - (fC012*(indC12 - 1))/1000000;
x0(20) = (indC13*kC013)/1000000 - (fC013*(indC13 - 1))/1000000;
x0(21) = (indC14*kC014)/1000000 - (fC014*(indC14 - 1))/1000000;
x0(22) = (indC15*kC015)/1000000 - (fC015*(indC15 - 1))/1000000;
x0(23) = (indC16*kC016)/1000000 - (fC016*(indC16 - 1))/1000000;
x0(24) = (indC17*kC017)/1000000 - (fC017*(indC17 - 1))/1000000;
x0(25) = (indC18*kC018)/1000000 - (fC018*(indC18 - 1))/1000000;
x0(26) = (indC19*kC019)/1000000 - (fC019*(indC19 - 1))/1000000;
x0(27) = (indC20*kC020)/1000000 - (fC020*(indC20 - 1))/1000000;
x0(28) = (indC21*kC021)/1000000 - (fC021*(indC21 - 1))/1000000;
x0(29) = (indC22*kC022)/1000000 - (fC022*(indC22 - 1))/1000000;
x0(30) = (indC23*kC023)/1000000 - (fC023*(indC23 - 1))/1000000;
x0(31) = (indC24*kC024)/1000000 - (fC024*(indC24 - 1))/1000000;
x0(32) = (indC25*kC025)/1000000 - (fC025*(indC25 - 1))/1000000;
x0(33) = (indC26*kC026)/1000000 - (fC026*(indC26 - 1))/1000000;
x0(34) = (indC27*kC027)/1000000 - (fC027*(indC27 - 1))/1000000;
x0(35) = (indC28*kC028)/1000000 - (fC028*(indC28 - 1))/1000000;

% OBSERVABLES

y = sym(zeros(2,1));

y(1) = mu_2;
y(2) = C_2_2;

% SYSTEM STRUCT

model.sym.nmx = 0;
model.sym.x = x;
model.sym.u = u;
model.sym.xdot = xdot;
model.sym.p = p;
model.sym.k = k;
model.sym.x0 = x0;
model.sym.y = y;
% Additional fields for the prespecified length of kappa
model.sym.nk1 = 0;
end