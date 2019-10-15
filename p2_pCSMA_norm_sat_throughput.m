%Normalized Saturation Throughput
%p-persistent CSMA as function of p
%for different values of n
%
%d = 50 * 10^-6;
%Ts = 9000 * 10^-6;
%Tc = 8750 * 10^-6;
Ts=9000;
Tc=8750;
d=50; %slot time

%n=[2 3 5 10 25];
S=zeros(100,5);

%p_idle=(1-p)^n;
%p_succ=nchoosek(n,1)*p*(1-p)^(n-1);
%p_coll=1-(1-p)^n-n*p*(1-p)^(n-1);

%S=p_succ*Ts/(p_idle*d+p_coll*Tc)
ns=[2 3 5 10 25];
ps=0.01:0.01:1;
for n=1:length(ns)
    for p=1:length(ps)

        p_idle=(1-ps(p))^ns(n);
        p_succ=nchoosek(ns(n),1)*ps(p)*(1-ps(p))^(ns(n)-1);
        p_coll=1-(1-ps(p))^ns(n)-ns(n)*ps(p)*(1-ps(p))^(ns(n)-1);

        S(p,n)=p_succ*Ts/(p_idle*d+p_coll*Tc+p_succ*Ts);

    end
end

f1 = figure(1);
hold on;
grid on;
for n=1:length(ns) 
    plot(ps,S(:,n));
    fprintf('For n=%d, max saturation throughput is %.2f\n',ns(1,n),max(S(:,n)));
end
hold off;
legend('n = 2', 'n = 3', 'n = 5', 'n = 10','n = 25');
title('Normalized Saturation Throughput for pCSMA');
xlabel('p');
ylabel('Normalized Saturation Throughput');

f2 = figure(2);
hold on;
grid on;
for n=1:length(ns)    
    plot(ns(1,n),max(S(:,n)),'-*');
end
hold off;
legend('n = 2', 'n = 3', 'n = 5', 'n = 10','n = 25');
title('Normalized Saturation Throughput for pCSMA');
xlabel('n');
ylabel('Max Saturation Throughput');
%identify and plot optimal p parameter as function of n