%% 
clear
close all
syms q1 q2 q3 q4
aTb=trotz(q1)*transl(0,0,0)*transl(10,0,0)*trotx(0)
bTc=trotz(q2)*transl(0,0,0)*transl(10,0,0)*trotx(0)
cTd=trotz(q3)*transl(0,0,0)*transl(5,0,0)*trotx(0)
T=aTb*bTc*cTd
T=simplify(T)
%% "Draw" the robot
L(1)=Link([0 0 10 0 0])
L(2)=Link([0 0 10 0 0])
L(3)=Link([0 0 5 0 0])
rrrP=SerialLink(L,'name','Robot 1')
rrrP.teach
figure
Q=[pi/2 0 pi]
rrrP.plot(Q,'deg')