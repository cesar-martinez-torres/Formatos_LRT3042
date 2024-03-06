%Anthropomorphic 6DOF
clear
close all
L1=10
L2=5
L3=10
L4=3
L(1)=Link([0 L1 0 -pi/2 0])
L(2)=Link([0 0 L2 0 0])
L(3)=Link([0 0 0 pi/2 0])
L(4)=Link([0 L3 0 -pi/2 0])
L(5)=Link([0 0 0 pi/2 0])
L(6)=Link([0 L4 0 0 0])
R6=SerialLink(L,'name','Diap 91')
R6.teach
%% Evaluar la cin directa
% T directa simbolica
syms q1 q2 q3 q4 q5 q6
aTb=trotz(q1)*transl(0,0,L1)*transl(0,0,0)*trotx(-pi/2)
bTc=trotz(q2)*transl(0,0,0)*transl(L2,0,0)*trotx(0)
cTd=trotz(q3)*transl(0,0,0)*transl(0,0,0)*trotx(pi/2)
dTe=trotz(q4)*transl(0,0,L3)*transl(0,0,0)*trotx(-pi/2)
eTf=trotz(q5)*transl(0,0,0)*transl(0,0,0)*trotx(pi/2)
fTg=trotz(q6)*transl(0,0,L4)*transl(0,0,0)*trotx(0)
T=aTb*bTc*cTd*dTe*eTf*fTg
T=simplify(T)
fx=T(1,4)
fy=T(2,4)
fz=T(3,4)
%%
Q=[10 20 35 35 35 100]
Qr=deg2rad(Q)
T=R6.fkine(Qr)
angles=tr2rpy(T,'deg')
W=SE3()
close all
figure
R6.plot(Qr)
hold on
trplot(W)