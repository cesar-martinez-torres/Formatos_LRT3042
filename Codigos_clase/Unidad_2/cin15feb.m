%% Cinematica 15 febrero
close all
clear
l1=5;
l2=5;
l3=2;
A(1)= Link([0 l1 0 -pi/2 0]); %Generar cada una de las articulaciones 
A(2)= Link([0 0 l2 pi/2 0]);%th,d,a,alpha, tipo art; 0=rot 1=pris
A(3)= Link([0 0 0 0 1]);
A(3).qlim = [3 6];
Robot1= SerialLink(A, 'name', 'RRP'); %Unir articulaciones
figure
Robot1.plot([pi/2 0 4],'workspace', [-10 10 -10 10 -10 10]) %Plotear robot
figure
Robot1.teach
c1=[0 0 3]
cin_dir=Robot1.fkine(c1,'deg')
O=tr2rpy(cin_dir,'deg')
