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
% I need to remember how to use SE3
t=[3,4,5]'
rot=rotx(15,'deg')*rotz(22,'deg')
A=[rot,t;0,0,0,1]
%%%%%%%%%%%%%%%%%%%%%%%
rpyangles=tr2rpy(A,'deg')
A1=rpy2tr(rpyangles,'deg')
%% Exercise 1.2
close all
clear
M=SE3()
t=[5,1,1]'
rot=rotx(0,'deg')
mTw=[rot,t;0,0,0,1]
t=[0,1,1]'
rot=rotx(0,'deg')
wTa=[rot,t;0,0,0,1]
mTa=mTw*wTa
figure
trplot(M)
grid on
hold on
trplot(mTw)
trplot(mTa)