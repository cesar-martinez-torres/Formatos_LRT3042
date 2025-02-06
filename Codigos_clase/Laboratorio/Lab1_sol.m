%% Lab 1
clear
close all
WtW=SE2(0,0,0)% Eje mundo (fijo)
x=0;% Rotacion del eje del taco
WtTa=SE2(0,0,x,'deg')%Eje del taco (Movil, solo rotacion)
WtCm=SE2(140,0,0)%Eje del centro de la mesa (fijo)
% Puntos del triangulo
L=28.5
h=((sqrt(3))/2)*L
Wpc=[210;0]
Wpar=[210+h;L/2]
Wpab=[210+h;-(L/2)]
% Eje auxiliar
Wtaux=SE2(210,0,30,'deg')
Wtaux2=Wtaux*(SE2((5.7*2)+2.85,0,0))
aux2pb3e=[0;0]
aux2pb3h=e2h(aux2pb3e)
Wpb3h=(Wtaux2.T)*aux2pb3h
Wpb3e=h2e(Wpb3h)
% Unir los puntos para graficar
P = [Wpc, Wpar, Wpab, Wpb3e];
names = {'Wpc', 'Wpar', 'Wpab','Wpb3e'}; % Nombres de los puntos

figure
trplot2(WtW,'frame','W','color','k')
hold on
trplot2(WtTa,'frame','Taco','color','b')
trplot2(WtCm,'frame','Centro','color','r')
trplot2(Wtaux,'frame','AUX','color','g')
trplot2(Wtaux2,'frame','AUX2','color','g')
plot_point(P, 'ro', 'MarkerSize', 8, 'LineWidth', 2);
for i = 1:size(P,2)
    text(P(1,i) + 5, P(2,i), names{i}, 'FontSize', 12, 'Color', 'b');
end
axis([0 280 -80 80])
grid on

%% Posición bola 8
clear all
syms pxb8 pyb8
WtC=SE2(140,0,0)% centro de la mesa (fijo)
Cpb8e=[pxb8;pyb8]
Cpb8h=e2h(Cpb8e)
Wpb8h=(WtC.T)*Cpb8h