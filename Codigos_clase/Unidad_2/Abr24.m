%% 
clear
close all
mdl_puma560
%p560.teach
%% qz a qs(ready) (MJ)
M=100
% BASE
q1=jtraj(qz(1),qs(1),M)
%Hombro
q2=jtraj(qz(2),qs(2),M)
% codo
q3=jtraj(qz(3),qs(3),M)
% Muñeca
q4=jtraj(qz(4),qs(4),M)
q5=jtraj(qz(5),qs(5),M)
q6=jtraj(qz(6),qs(6),M)
Q1=[q1 q2 q3 q4 q5 q6]
%% Movimiento 2 qs a esq1 (MJ)
esq1=[0 0 -3.1416 0 0 0]
q1=jtraj(qs(1),esq1(1),M)
q2=jtraj(qs(2),esq1(2),M)
q3=jtraj(qs(3),esq1(3),M)
q4=jtraj(qs(4),esq1(4),M)
q5=jtraj(qs(5),esq1(5),M)
q6=jtraj(qs(6),esq1(6),M)
Q2=[q1 q2 q3 q4 q5 q6]
%% Movimiento 3 esq1 a esq2 (ML)
Tesq1=p560.fkine(esq1)
% Calcular Tesq2
vTesq1=Tesq1.t
x=vTesq1(1)+0.3
t=[x vTesq1(2) vTesq1(3)]
Tesq2=SE3(Tesq1.R,t)
% Verficar si tiene solucion (alcanzable)
q=p560.ikine6s(Tesq2)
C3=ctraj(Tesq1,Tesq2,M)
Q3=p560.ikine6s(C3)
%% Enviar trayectoria
Qt=[Q1;Q2;Q3]
figure
p560.plot(Qt)

