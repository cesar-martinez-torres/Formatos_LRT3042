%% RR Planar Robot
syms q1 q2
r=SE2(0,0,q1)
t=SE2(15,0,0)
aTb=r*t
%%%%%%
r=SE2(0,0,q2)
t=SE2(10,0,0)
bTc=r*t
%%%%%%%%
aTc=aTb*bTc
aTc=simplify(aTc)
q1=deg2rad(45)
q2=deg2rad(15)
aTc=eval(aTc.T)
angles=tr2rpy(aTc,'deg')
%% RRR Planar
clear 
syms q1 q2 q3
r=SE2(0,0,q1)
t=SE2(5,0,0)
aTb=r*t
%%%%%%%%%%%
r=SE2(0,0,q2)
t=SE2(10,0,0)
bTc=r*t
%%%%%%%%%%%%%%%%%%
r=SE2(0,0,q3)
t=SE2(15,0,0)
cTd=r*t
%%%%
aTd=aTb*bTc*cTd
aTd=simplify(aTd)
q1=deg2rad(-30)
q2=deg2rad(30)
q3=deg2rad(0)
aTd=eval(aTd.T)
angles=tr2rpy(aTd,'deg')
%% Pincher X Robot
clear
syms q1 q2 q3 q4
r=rotz(q1)
t=[0,0,42]
aTb=SE3(r,t)
%%%%%%
r=roty(q2)
t=[0,0,105]
bTc=SE3(r,t)
%%%%%
r=roty(q3)
t=[0,0,105]
cTd=SE3(r,t)
%%%
r=roty(q4)
t=[0,0,105]
dTe=SE3(r,t)
%%%%
aTe=aTb*bTc*cTd*dTe
aTe=simplify(aTe)
aTe=aTe.T
fx=aTe(1,4)
fy=aTe(2,4)
fz=aTe(3,4)
q1=deg2rad(40)
q2=deg2rad(65)
q3=deg2rad(30)
q4=deg2rad(100)

aTe=eval(aTe)
angles=tr2rpy(aTe,'deg')