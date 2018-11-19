tennis=dlmread('tennis1.txt');
x=[4 6 8 10];
expertsPrediction=tennis(:,x)';
outcomes=tennis(:,2)';
[n,T]=size(expertsPrediction);
predictions=AA_brier(expertsPrediction,outcomes);
 LossE1=cumsum((outcomes -expertsPrediction(1,:)).^2);
   LossE2=cumsum((outcomes-expertsPrediction(2,:)).^2);
   LossE3=cumsum((outcomes-expertsPrediction(3,:)).^2);
   LossE4=cumsum((outcomes-expertsPrediction(4,:)).^2);
   Loss_L=cumsum((outcomes-predictions).^2);
   Loss_avg=cumsum((outcomes-((sum(expertsPrediction))/4)).^2);
Losstot=sum((outcomes-predictions).^2);
o=[LossE1;LossE2;LossE3;LossE4];
f=repmat(Loss_L,4,1);
g=repmat(Loss_avg,4,1);
e=o-f;
h=o-g;

figure(1)
plot(1:T,o(1,:),'-red')
hold on
plot(1:T,o(2,:),'-b')
plot(1:T,o(3,:),'-g')
plot(1:T,o(4,:),'-y')
plot(1:T,Loss_L,'-m')
title('Five losses vs. time')
 xlabel('time')
ylabel('loss')   
legend('Loss E1','Loss E2','Loss E3','Loss E4','Loss L','Location','northwest')

figure(2)
plot(1:T,e(1,:),'-red')
hold on
plot(1:T,e(2,:),'-b')
plot(1:T,e(3,:),'-g')
plot(1:T,e(4,:),'-y')
xlabel('time')
ylabel('loss')
legend('Expert 1','Expert 2','Expert 3','Expert 4','Location','northwest')

figure(3)
plot(1:T,h(1,:),'-red')
hold on
plot(1:T,h(2,:),'-b')
plot(1:T,h(3,:),'-g')
plot(1:T,h(4,:),'-y')
xlabel('time')
ylabel('loss')
legend('Expert 1','Expert 2','Expert 3','Expert 4','Location','northwest')
