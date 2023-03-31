%% Robot
mdl_planar3
%% Matrices simbolicas
syms q1 q2 q3
aAb=trotz(q1)*transl([0 0 0])*transl([1 0 0])*trotx(0);
bAc=trotz(q2)*transl([0 0 0])*transl([1 0 0])*trotx(0);
cAd=trotz(q3)*transl([0 0 0])*transl([1 0 0])*trotx(0);
syms nx ny nz ox oy oz ax ay az px py pz
noap=[nx ox ax px;ny oy ay py;nz oz az pz;0 0 0 1];
%% Pasos
% Paso 1
aAb*bAc*cAd==noap;
inv(aAb)*noap==bAc*cAd;
p1izq=inv(aAb)*noap;
p1izq=simplify(p1izq);
p1der=bAc*cAd;
p1izq==p1der
ec1=p1izq(1,3)==p1der(1,3)% de la tabla: ec4 dos soluciones
a=ax
b=ay
q1_sol1=atan2(a,-b)
q1_sol2=atan2(-a,b)
% Paso 2
p2izq=inv(bAc)*inv(aAb)*noap;
p2der=cAd;
p2izq=simplify(p2izq);
p2izq==p2der
ec2=p2izq(2,3)==p2der(2,3)
q1=q1_sol1
q2_sol1y2=ay*cos(q2 + atan2(ax, -ay)) - ax*sin(q2 + atan2(ax, -ay))
q1=q1_sol2
q2_sol3y4= ay*cos(q2 + atan2(ax, -ay)) - ax*sin(q2 + atan2(ax, -ay))
ec3=p2izq(2,4)==p2der(2,4)
q1=q1_sol1
q2=q2_sol1y2
q3_sol1a4=eval(ec3)
