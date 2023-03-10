%% cin 22 feb
% Robot cilindrico
clear
close all
L1=2;
L4=2;
% Links
R(1)=Link([0 L1 0 0 0])
R(2)=Link([pi/2 0 0 pi/2 1])
R(2).qlim= [0 5];
R(3)=Link([0 0 0 0 1])
R(3).qlim= [0 5];
R(3).offset=L4
R(4)=Link([0 0 0 0 0])
Robot_1=SerialLink(R,'name','Cilindrico')
Crad=[pi/4 0 0 0]
[cd,ALL]=Robot_1.fkine(Crad)
O=tr2rpy(cd,'deg','xyz')
lim=15
W=SE3()
figure
Robot_1.plot(Crad,'workspace', [-lim lim -lim lim -lim lim])
hold on
trplot(W,'arrow', 'frame', 'W','length',3, 'text_opts', {'FontSize', 10, 'FontWeight', 'bold'})
%trplot(ALL(1),'arrow', 'frame', 'S1','length',3, 'text_opts', {'FontSize', 10, 'FontWeight', 'bold'})
%trplot(ALL(2),'arrow', 'frame', 'S2','length',3, 'text_opts', {'FontSize', 10, 'FontWeight', 'bold'})
%trplot(ALL(3),'arrow', 'frame', 'S3','length',3, 'text_opts', {'FontSize', 10, 'FontWeight', 'bold'})
%trplot(ALL(4),'arrow', 'frame', 'S4','length',3, 'text_opts', {'FontSize', 10, 'FontWeight', 'bold'})
trplot(cd,'arrow', 'frame', 'TCP','length',6, 'text_opts', {'FontSize', 10, 'FontWeight', 'bold'})


