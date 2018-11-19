function predictions=AA_brier(expertsPrediction,outcomes)
[n,T]=size(expertsPrediction);
w(1:n,1)=1;
eta=2;
r=[0;1];
gamma=zeros(n,T);
predictions=zeros(1,T);
for t=1:T
    gamma(:,t)=expertsPrediction(:,t);
    p=w(:,t)/sum(w(:,t));
    l0=(-1/eta)*log(sum(p.*exp(-eta*((gamma(:,t)-r(1)).^2))));
    l1=(-1/eta)*log(sum(p.*exp(-eta*((gamma(:,t)-r(2)).^2))));
    predictions(t)=(1/2)-((l1-l0)/2);
    w(:,t+1)=p.*(exp(-eta*(gamma(:,t)-outcomes(t)).^2));
end
end
 
    