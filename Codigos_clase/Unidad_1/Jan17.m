%% January 17
W=SE2()
wTa=SE2(1,1,0,'deg')
aTb=SE2(1,0,0,'deg')
bTc=SE2(0,2,180,'deg')
% Obtain the T according to the global coordinate frame
wTb=wTa*aTb
wTc=wTb*bTc
figure
trplot2(W,'frame','W','color','b')
grid on
hold on
trplot2(wTa,'frame','A','color','k')
trplot2(wTb,'frame','B','color','r')
trplot2(wTc,'frame','C','color','g')



