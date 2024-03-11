%% Inverse kinematics
clear
close all
syms q1 q2 q3
L1=5

aTb=trotz(q1)*transl(0,0,L1)*transl(0,0,0)*trotx(pi/2)
bTc=trotz(q2)*transl(0,0,0)*transl(0,0,0)*trotx(-pi/2)
cTd=trotz(0)*transl(0,0,q3)*transl(0,0,0)*trotx(0)
syms nx ny nz ox oy oz ax ay az px py pz
noap=[nx ox ax px;ny oy ay py;nz oz az pz;0 0 0 1]
izq1=inv(aTb)*noap
izq1=simplify(izq1)
der1=bTc*cTd
der1=simplify(der1)
% Elementos candidatos 1,4 y 3,4
% (1,4)
ca1=izq1(1,4)==der1(1,4)
ca2=izq1(3,4)==der1(3,4)
q1sol=solve(ca2,q1)
