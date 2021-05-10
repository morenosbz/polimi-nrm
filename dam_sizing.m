clc;
% clear all; 
close all;
q = [1 2 3 3 5 5 8 6 7 3 2 1];
cumQt = cumsum(q);
r = 4;
Rt = r*ones(size(q));
cumRt = cumsum(Rt);

figure;
plot(q, '.-b'); hold on;
plot(Rt, 'r'); hold on;
plot(cumQt, '--b'); hold on;
plot(cumRt, '--r'); hold on;
legend('Inflows', 'Target release', 'Cumulative inflows', 'Cumulative target release')

% Rippl
D = cumRt - cumQt;
max(D)