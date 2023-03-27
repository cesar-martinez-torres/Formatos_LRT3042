%% CyD Robots 27 marzo
clear
close all
l1=5
A(1)= Link([0 l1 0 pi/2 0]); %Generar cada una de las articulaciones 
A(2)= Link([0 0 0 -pi/2 0]);%th,d,a,alpha, tipo art; 0=rot 1=pris
A(3)= Link([0 0 0 0 1]);
A(3).qlim = [0 5];
Robot= SerialLink(A, 'name', 'esferico'); %Unir articulaciones
%figure
%Robot.teach
% Generar la matriz T del punto alcanzable
T=Robot.fkine([0 pi/2 3])
pos=T.t
ori=tr2rpy(T,'xyz')
%% Resolver la cinemática inversa
syms q1 q2 q3
aAb=trotz(q1)*transl([0 0 l1])*transl([0 0 0])*trotx(pi/2);
bAc=trotz(q2)*transl([0 0 0])*transl([0 0 0])*trotx(-pi/2);
cAd=trotz(0)*transl([0 0 q3])*transl([0 0 0])*trotx(0);
syms nx ny nz ox oy oz ax ay az px py pz
noap=[nx ox ax px;ny oy ay py;nz oz az pz;0 0 0 1];
% Paso 1
aAb*bAc*cAd==noap;
inv(aAb)*noap==bAc*cAd;
p1izq=inv(aAb)*noap;
p1izq=simplify(p1izq);
p1der=bAc*cAd; 
p1izq==p1der; %% "Automatico"
ec1=p1izq(3,4)==p1der(3,4) % Dos soluciones (4)
px=pos(1)
py=pos(2)
a=-py
b=px
q1_sol1=atan2(a,-b)
q1_sol1=vpa(q1_sol1)
q1_sol1=round(q1_sol1)% q1s1=0
%nSolucion 2
q1_sol2=atan2(-a,b)%q1s2=-pi
% Paso 2
p2izq=inv(bAc)*inv(aAb)*noap;
p2der=cAd;
p2izq=simplify(p2izq);
p2izq==p2der
% Evaluación para q1_sol1... De ecauacion 2 obtener q2_sol1
pz=pos(3)
ec2=p2izq(1,4)==p2der(1,4)% para q2
q1=q1_sol1
q2_sol1=eval(ec2)%Evaluado con q1=0
q2_sol1=solve(q2_sol1) %q2=pi/2
%q2_sol2 con q1_sol2 q1=-pi
q1=q1_sol2
q2_sol2=eval(ec2)%Evaluado con q1=-pi
q2_sol2=solve(q2_sol2) %q2=pi/2
% Evaluar q3 con q1=0 q2=pi/2
q1=0
q2=pi/2
ec3=p2izq(3,4)==p2der(3,4)%para q3
q3_sol1=eval(ec3)
% Evaluar q3 con q1=-pi q2=pi/2
q1=-pi
q2=pi/2
ec3=p2izq(3,4)==p2der(3,4)%para q3
q3_sol2=eval(ec3)
%% Validación de resultados
Q1=[0 pi/2 3]
Q2=[-pi pi/2 -3]%% Decartar por los limites de la prismática 0 a 5
Tsol1=Robot.fkine(Q1)
figure
Robot.plot(Q1)
error=T-Tsol1



