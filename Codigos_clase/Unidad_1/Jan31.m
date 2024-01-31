% Rotation 
% clear
% close all
% W=SE3()
% r=rotz(90,'deg')
% t=[0,0,0]
% A=SE3(r,t)
% r=rotz(-90,'deg')
% t=[0,0,0]
% B=SE3(r,t)
% figure
% tranimate(W,A)
% pause()
% figure
% tranimate(W,B)
% % R Planar
clear
syms q1
r=SE2(0,0,q1)
r1=trot2(q1)
t=SE2(25,0,0)
t1=transl2(25,0)
aTb=r*t