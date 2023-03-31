%% Robot diapositiva 92
clear all
close all
l1=2;
l2=2;
l3=2;
l4=1;
A(1)=Link([90 l1 0 -(pi/2)]);
A(2)=Link([0 0 l2 0]);
A(3)=Link([0 0 0 pi/2]);
A(4)=Link([0 l3 0 -(pi/2)]);
A(5)=Link([0 0 0 pi/2]);
A(6)=Link([0 l4 0 0]);
R6= SerialLink(A, 'name', 'Robot 6DOF'); %Unir articulaciones 
%% Calcular las cinemáticas directa e inversa
Muneca_esferica=R6.isspherical
qz=[21 36 54 0 5 0];
qz=deg2rad(qz)
figure
R6.plot(qz)
 
cd=R6.fkine(qz)
ci=R6.ikine6s(cd,'r','u','f')
ci2=R6.ikine(cd)
cd1=R6.fkine(ci)
error=cd-cd1
figure
R6.plot(ci)
R6.jacob0(qz,'rpy')
