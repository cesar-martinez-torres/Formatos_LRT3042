%% CyD Robots 15 marzo
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
noap=T
syms q1 q2 q3
aAb=trotz(q1)*transl([0 0 l1])*transl([0 0 0])*trotx(pi/2)
bAc=trotz(q2)*transl([0 0 0])*transl([0 0 0])*trotx(-pi/2)
cAd=trotz(0)*transl([0 0 q3])*transl([0 0 0])*trotx(0)
syms nx ny nz ox oy oz ax ay az px py pz
noap=[nx ox ax px;ny oy ay py;nz oz az pz;0 0 0 1]
% Paso 1
aAb*bAc*cAd==noap
inv(aAb)*noap==bAc*cAd
p1izq=inv(aAb)*noap
p1izq=simplify(p1izq)
p1der=bAc*cAd
ec1=p1izq(3,4)==p1der(3,4)
% Paso 2
p2izq=inv(bAc)*inv(aAb)*noap
p2der=cAd
p2izq=simplify(p2izq)
ec2=p2izq(1,4)==p2der(1,4)
ec3=p2izq(2,4)==p2der(2,4)
ec4=p2izq(3,4)==p2der(3,4)



