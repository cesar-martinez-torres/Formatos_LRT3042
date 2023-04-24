%% Pick and place P560
mdl_puma560;
puntos=50;
T1=jtraj(qz,qr,puntos);
Tap=[-1 0 0 0.4115; 0 1 0 -0.1501;0 0 -1 -0.4318;0 0 0 1]
qap=p560.ikine6s(Tap)
figure
p560.plot(qap)
T2=jtraj(qr,qap,puntos);
