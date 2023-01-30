%% Cinematica 30 enero
%RR planar por transformaciones
syms q1 q2  % Todos los eslabones son iguales a 1
%primer articulacion
R1=trot2(q1)%q1 en radianes
t1=transl2(1,0)
aTb=R1*t1%0T1
%segunda articulacion
R2=trot2(q2)%q1 en radianes
t2=transl2(1,0)
bTc=R2*t2%1T2
% Matriz T total
aTc=aTb*bTc
aTc=simplify(aTc)
% Evaluando la cinematica directa
q1g=32
q2g=27
q1=deg2rad(q1g)
q2=deg2rad(q2g)
aTc=eval(aTc)
% Obtener la orientacion de la brida
O=rad2deg(tr2rpy(aTc))
figure
tranimate2 (aTc)
