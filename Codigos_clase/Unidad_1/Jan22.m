%% Exercise 1.1
clear
close all
% World coordinate frame = Same as Matlab
W=SE2()
% Create points 
LH=[4,6]'
RH=[12;6]
DS=[6;7]
CS=[10;7]
RV=[12;9]
G=[12,3]'
% Plot coordinate frames and points
figure
trplot2(W,'frame','W','color','b')
grid on
hold on
plot_point(RH,'*')
plot_point(LH,'*')
plot_point(DS,'*')
plot_point(CS,'*')
plot_point(RV,'*')
plot_point(G,'*')
%% i)
wTc=SE2(8,2,0,'deg')
% Coordinates of each point according to C
cTw=inv(wTc)
cRH=cTw*RH
cLH=cTw*LH
cDS=cTw*DS
cCS=cTw*CS
cRV=cTw*RV
cG=cTw*G
figure
trplot2(W,'frame','W','color','b')
grid on
hold on
trplot2(wTc,'frame','C','color','k')
plot_point(RH,'*')
plot_point(LH,'*')
plot_point(DS,'*')
plot_point(CS,'*')
plot_point(RV,'*')
plot_point(G,'*')
%% ii)
wTc=SE2(11,5,45,'deg')
%Compute the new position of all points
wRH=wTc*cRH
wLH=wTc*cLH
wDS=wTc*cDS
wCS=wTc*cCS
wRV=wTc*cRV
wG=wTc*cG
figure
trplot2(W,'frame','W','color','b')
grid on
hold on
trplot2(wTc,'frame','C','color','k')
plot_point(wRH,'*')
plot_point(wLH,'*')
plot_point(wDS,'*')
plot_point(wCS,'*')
plot_point(wRV,'*')
plot_point(wG,'*')