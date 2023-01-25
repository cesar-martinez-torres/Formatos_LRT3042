%% 18 enero 2023
% Ejes de referencia
close all
W=SE2(0,0,0,'deg')
C=SE2(8,2,0,'deg')
% Puntos
MI=[4;6]
MD=[12,6]'
AC=[6,7]'
ACOP=[10,7]'
RD=[12;9]
TG=[12;3]
figure('Name','Ejercicio 1.1 (i)','NumberTitle','off');
trplot2(W, 'frame', 'W','arrow')
hold on
trplot2(C, 'frame', 'C','arrow')
plot_point(MI, '*')
plot_point(MD, '*')
plot_point(AC, '*')
plot_point(ACOP, '*')
plot_point(RD, '*')
plot_point(TG, '*')
axis([-1 13 -1 10])
grid on
%% Inciso (ii)
% Puntos con respecto a eje C
cMI=[-4;4]
cMD=[4,4]'
cAC=[-2,5]'
cACOP=[2,5]'
cRD=[4;7]
cTG=[4;1]
% Puntos homogeneos con respecto a eje C
cMIh=[-4;4;1]
cMDh=[4,4,1]'
cACh=[-2,5,1]'
cACOPh=[2,5,1]'
cRDh=[4;7;1]
cTGh=[4;1;1]
% Nueva posicion del eje de referencia C
wTc=SE2(11,5,45,'deg')
wTc=wTc.T
% Nueva posicion de los puntos
wMIh=wTc*cMIh
wMDh=wTc*cMDh
wACh=wTc*cACh
wACOPh=wTc*cACOPh
wRDh=wTc*cRDh
wTGh=wTc*cTGh
wMI=[wMIh(1);wMIh(2)]
