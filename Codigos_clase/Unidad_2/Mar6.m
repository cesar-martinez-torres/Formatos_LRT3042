%Anthropomorphic 6DOF
clear
close all
L1=10
L2=5
L3=10
L4=3
L(1)=Link([0 L1 0 -pi/2 0])
L(2)=Link([0 0 L2 0 0])
L(3)=Link([0 0 0 pi/2 0])
L(4)=Link([0 L3 0 -pi/2 0])
L(5)=Link([0 0 0 pi/2 0])
L(6)=Link([0 L4 0 0 0])
R6=SerialLink(L,'name','Diap 91')
R6.teach