%% Homework Solution
clear
close all
L1=3
L2=2
L3=1
L(1)=Link([0 L1 0 pi/2 0])
L(2)=Link([0 0 L2 0 0])
L(3)=Link([0 0 L3 0 0])
ant=SerialLink(L,'name','Antropomorphic')
figure
ant.teach
pause()
%% SCARA
clear all 
close all  
l1=5;
l2=5;
l3=5;
l4=5;
q1=0;
q2=0;
q3=0;
q4=0;
L(1)=Link([q1 8 l1 0 0])
L(2)=Link([q2 0 l2 pi 0])
L(3)=Link([0 q3 0 0 1])
L(4)=Link([0 l4 q4 0 0])
L(3).qlim = [0 6];
SCARA3=SerialLink(L, 'name', 'SCARA3')
SCARA3.plot([0 0 0 0],'workspace', [-15 15 -15 15 -15 15])
SCARA3.teach
