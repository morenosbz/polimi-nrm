function f = evaluate_objective(x, M, V)
%
% function f = evaluate_objective(x, M, V)
%
% Function to evaluate the objective functions for the given input vector x.%
% x is an array of decision variables and f(1), f(2), etc are the
% objective functions. The algorithm always minimizes the objective
% function hence if you would like to maximize the function then multiply
% the function by negative one. M is the numebr of objective functions and
% V is the number of decision variables. 
%
% This functions is basically written by the user who defines his/her own
% objective function. Make sure that the M and V matches your initial user
% input.
%

x = x(1:V) ;
x = x(:)   ;

% --------------------------------------
% insert here your function:

global opt_inputs;
data = opt_inputs.data;
h_init = opt_inputs.h_init;
param = opt_inputs.param;
h_bar = opt_inputs.h_bar;
w = param.reg.w;

param.reg.h1 = x(1);
param.reg.h2 = x(2);
param.reg.m1 = x(3);
param.reg.m2 = x(4);

[r_reg, s_reg, h_reg] = simRegLake(h_init, data, param);

J1 = getVulnerability2(r_reg,param.reg.w,2);

params2.p3 = 0.081;
params2.p2 = -0.483;
params2.p1 = 1.506;
params2.p0 = -1.578;
S = getFlooding2(h_reg, h_bar, params2);
J2 = mean(S);

f = [J1, J2];


% --------------------------------------

% Check for error
if length(f) ~= M
    error('The number of decision variables does not match you previous input. Kindly check your objective function');
end