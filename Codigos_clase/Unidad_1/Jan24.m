%% 3D Transformations
clear all
close all
P=[1,1,0]
W=SE3()
figure
plot_point3(P, 'Marker', '^', 'Label', 'A', 'Color', 'r');%Custom function
hold on
trplot(W)
