%% 3D Transformations
clear
close all
P=[1,1,0]
W=SE3()
figure
plot_point3(P, 'Marker', '^', 'Label', 'A', 'Color', 'r');%Custom function
hold on
trplot(W)
%% Conversions
A=SE3(rotx(15,'deg')*rotz(22,'deg'),[3,4,5])
rpyangles=tr2rpy(A,'deg')
A1=rpy2tr(rpyangles,'deg')
%% Exercise 1.2
close all
clear
M=SE3()
t=[5,1,1]
rot=rotx(0,'deg')
mTw=SE3(rot,t)
t=[0,1,1]
rot=rotx(0,'deg')
wTa=SE3(rot,t)
mTa=mTw*wTa
rot=roty(0,'deg')
t=[-1,1,0]
aTb=SE3(rot,t)
mTb=mTa*aTb
wTb=wTa*aTb
% BTC
rot=roty(180,'deg')*rotz(90,'deg')
t=[0,0,2]
bTc=SE3(rot,t)
cTb=inv(bTc)
% Corner Points
ap1=[0,2,0]'
ap2=[-2,2,0]'
ap3=[-2,0,0]'
mp1=mTa*ap1
mp2=mTa*ap2
mp3=mTa*ap3

figure
trplot(M)
grid on
hold on
trplot(mTw)
trplot(mTa)
trplot(mTb)
plot_point3(mp1, 'Marker', 'o', 'Label', 'P1', 'Color', 'b')
plot_point3(mp2, 'Marker', 'x', 'Label', 'P2', 'Color', 'b')
plot_point3(mp3, 'Marker', '^', 'Label', 'P3', 'Color', 'b')

