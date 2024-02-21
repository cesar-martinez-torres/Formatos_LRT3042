%% Cilindrical robot
% Step 14
clear
close all
syms q1 q2 q3 q4
L1=5
L4=1.5
aTb=trotz(q1)*transl(0,0,L1)*transl(0,0,0)*trotx(0)
bTc=trotz(pi/2)*transl(0,0,q2)*transl(0,0,0)*trotx(pi/2)
cTd=trotz(0)*transl(0,0,q3)*transl(0,0,0)*trotx(0)
dTe=trotz(q4)*transl(0,0,L4)*transl(0,0,0)*trotx(0)
% step 15
T=aTb*bTc*cTd*dTe
T=simplify(T)
q1=deg2rad(0)
q2=5
q3=5
q4=deg2rad(0)
T1=eval(T)
angles=tr2rpy(T1,'deg')
%% Using toolbox
L(1)=Link([0 L1 0 0 0])
L(2)=Link([pi/2 0 0 pi/2 1])
L(3)=Link([0 0 0 0 1])
L(4)=Link([0 L4 0 0 0])
L(2).qlim=[0 5]
L(3).qlim=[0 5]
cilin=SerialLink(L,'name','Cilindrical')
figure
cilin.teach
Q=[q1 q2 q3 q4]
T2=cilin.fkine(Q)