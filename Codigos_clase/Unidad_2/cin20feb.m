%% Cinematica 20feb
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
Robot_1.teach
