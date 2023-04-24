%% Dinamica
syms y(t) m g f(t)
V=diff(y(t),t)
cin=(1/2*m*V^2)
pot=(m*g*y(t))
Lagr= cin-pot
dl_dyp=diff(Lagr,V)
dl_dypt=diff(dl_dyp,t)
dl_dy=diff(Lagr,y(t))
ec1=dl_dypt-dl_dy==f(t)
%% 
