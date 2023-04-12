%% Uso de Jtraj y ctraj
clear
close all
mdl_puma560
figure
p560.teach
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
subplot(6,1,1)
plot(tt,q1)
subplot(6,1,2)
plot(tt,q2)
subplot(6,1,3)
plot(tt,q3)
subplot(6,1,4)
plot(tt,q4)
subplot(6,1,5)
plot(tt,q5)
subplot(6,1,6)
plot(tt,q6)
grid on
Q=[q1' q2' q3' q4' q5' q6']
figure
p560.plot3d(Q)





