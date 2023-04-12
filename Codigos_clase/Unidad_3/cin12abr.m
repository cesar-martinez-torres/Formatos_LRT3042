%% Uso de Jtraj y ctraj
clear all
mdl_puma560
figure
p560.teach
close all
figure
p560.plot3d(qr)
%% Trayectorias (eje a eje de qz a qr)
%para q1, q4 q5 y q6 van de 0 a 0
%para q2
q1=zeros(1,39)
q4=zeros(1,39)
q5=zeros(1,39)
q6=zeros(1,39)
puntos=20
q2=jtraj(0,pi/2,puntos)
q2=[q2', pi/2*ones(1,19)]
q3=jtraj(0,-pi/2,puntos)
q3=[zeros(1,19), q3']
t=[0:1:19]
t1=[19:1:38]
tt=[0:1:38]
figure
plot(tt,q2)
hold on
plot(tt,q3)
plot(tt,q1)
plot(tt,q4)
plot(tt,q5)
plot(tt,q6)
grid on




