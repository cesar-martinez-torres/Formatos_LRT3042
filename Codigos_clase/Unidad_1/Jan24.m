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
t=[0,1,1]'
rot=rotx(0,'deg')
wTa=SE3(rot,t)
mTa=mTw*wTa
figure
trplot(M)
grid on
hold on
trplot(mTw)
trplot(mTa)
