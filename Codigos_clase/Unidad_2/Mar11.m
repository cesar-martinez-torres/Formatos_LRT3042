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
ec1=izq1(3,4)==der1(3,4)
q1_sol1=atan2(-py,-px)
q1_sol2=atan2(py,px)
%% Paso 2
izq2=inv(bTc)*inv(aTb)*noap
izq2=simplify(izq2)
der2=cTd
der2=simplify(der2)
ec2=izq2(1,4)==der2(1,4)
ec3=izq2(3,4)==der2(3,4)
%% Evaluar
L1=5
L(1)=Link([0 L1 0 pi/2 0])
L(2)=Link([0 0 0 -pi/2 0])
L(3)=Link([0 0 0 0 1])
L(3).qlim=[0 3]
ant=SerialLink(L,'name','Ejemplo1')
Q=[pi pi/4 1.5]
T=ant.fkine(Q)
angles=tr2rpy(T,'deg')
%% 
T=T.T
px=T(1,4)
py=T(2,4)
py=0
pz=T(3,4)
q1_sol1=eval(q1_sol1)
q1_sol2=eval(q1_sol2)
q1_sol1g=rad2deg(q1_sol1)
q1_sol2g=rad2deg(q1_sol2)
%%
q1n=q1_sol1
q1=q1n
ec2q1s1=eval(ec2)
ec2q1s1=vpa(ec2q1s1)
a=-1.06
b=1.06
q2_sol1=atan2(a,-b)
q2_sol2=atan2(-a,b)
q2_sol1g=rad2deg(q2_sol1)
q2_sol2g=rad2deg(q2_sol2)
