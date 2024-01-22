%% Exercise 1.1
% World coordinate frame = Same as Matlab
W=SE2()
% Create points 
RH=[4,6]'
LH=[12;6]
DS=[6;7]
CS=[10;7]
RV=[12;9]
G=[12,3]'
% Plot coordinate frames and points
figure
trplot2(W,'frame','W','color','b')
grid on
hold on
plot_point(RH,'*')
plot_point(LH,'*')
plot_point(DS,'*')
plot_point(CS,'*')
plot_point(RV,'*')
plot_point(G,'*')