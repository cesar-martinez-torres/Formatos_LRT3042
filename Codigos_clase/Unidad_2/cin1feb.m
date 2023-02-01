%% Cinematica 1feb
% Robot PincherX usando matrices T SE3
syms q1 q2 q3 q4
l1=5%cm
l2=5
l3=5
l4=5
R1=trotz(q1)%radianes
t1=transl(0,0,l1)
s0Ts1=R1*t1
R2=troty(q2)%radianes
t2=transl(0,0,l2)
s1Ts2=R2*t2
R3=troty(q3)%radianes
t3=transl(0,0,l3)
s2Ts3=R3*t3
R4=troty(q4)%radianes
t4=transl(0,0,l4)
s3Ts4=R4*t4
% Obtener s0Ts4
s0Ts4=s0Ts1*s1Ts2*s2Ts3*s3Ts4
s0Ts4=simplify(s0Ts4)
q1g=7
q2g=8
q3g=2
q4g=53
q1=deg2rad(q1g)
q2=deg2rad(q2g)
q3=deg2rad(q3g)
q4=deg2rad(q4g)
s0Ts4=eval(s0Ts4)
O=tr2rpy(s0Ts4)
Og=rad2deg(O)
