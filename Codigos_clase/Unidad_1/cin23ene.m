%% 23 enero cinematica
close all
clear
W=transl(0,0,0)
wTa=transl(0,1,1)
aTb=transl(-1,1,0)%aux
wTb=wTa*aTb
bTc=transl(0,0,2)
xroll=trotx(180,'deg')%aux
ypitch=troty(0,'deg')%aux
zyaw=trotz(-90,'deg')%aux
bTc_rot=xroll*ypitch*zyaw
wTc=wTa*aTb*bTc
figure
trplot(W, 'frame', 'W','arrow')
hold on
trplot(wTa, 'frame', 'A','arrow')
trplot(wTb, 'frame', 'B','arrow')
trplot(wTc, 'frame', 'C','arrow')
%% 25 ene 
%Puntos
aP1e=[0;2;0]
aP1h=e2h(aP1e)
wP1h=wTa*aP1h
wP1e=h2e(wP1h)
wP2e=[-2;3;1]
wP3e=[-2;1;1]
wP4e=[0;1;1]
figure
trplot(W, 'frame', 'W','arrow')
hold on
trplot(wTa, 'frame', 'A','arrow')
trplot(wTb, 'frame', 'B','arrow')
trplot(wTc, 'frame', 'C','arrow')
plot3(wP1e(1),wP1e(2),wP1e(3),'o')
plot3(wP2e(1),wP2e(2),wP2e(3),'o')
plot3(wP3e(1),wP3e(2),wP3e(3),'o')
plot3(wP4e(1),wP4e(2),wP4e(3),'o')
% Simbólica
syms thx thy thz x y z
Rx=rotx(thx)%¡¡¡Radianes
Ry=roty(thy)%¡¡¡Radianes
Rz=rotz(thz)%¡¡¡Radianes
R=Rx*Ry*Rz
t=[x;y;z]
aTbsym=SE3(R,t)
wTbsym=wTa*aTbsym.T
% Evaluando un punto
x=-0.5
y=0.3
z=0
thx=0
thy=pi
thz=pi/2
aTb=eval(wTbsym)
%%




