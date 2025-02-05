%% Ejemplo 1
W=transl2(0,0);
WtA=transl2(3,5)*trot2(43,'deg');
WtB=trot2(122,'deg');
WtC=transl2(5,0)

figure
trplot2(W,'frame','W')
hold on
trplot2(WtA,'frame','A')
trplot2(WtB,'frame','B')
trplot2(WtC,'frame','C')
grid on

% Calculñar punto
Cp1e=[3;3]
Cp1h=e2h(Cp1e)
Wp1h=WtC*Cp1h
Wp1e=h2e(Wp1h)

figure
trplot2(W,'frame','W')
hold on
trplot2(WtA,'frame','A')
trplot2(WtB,'frame','B')
trplot2(WtC,'frame','C')
plot_point(Wp1e,'*')
grid on