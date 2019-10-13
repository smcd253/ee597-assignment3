% constants
d = 50 * 10^-6;
Ts = 9000 * 10^-6;
Tc = 8750 * 10^-6;
num_users = 1000;
% note: p is same for all users (i.e. p = 1/n)

% build saturation output array
st = zeros(1,num_users);
for n = 1 : num_users
    st(n) = saturation_throughput (n, 1/n, d, Ts, Tc);
end

% plot results
plot(st);
title('Normalized Saturation Throughput for pCSMA');
xlabel('Number of Users');
ylabel('Normalized Saturation Throughput');


% pCSMA saturation throughput function definition
function st = saturation_throughput(n, p, d, Ts, Tc)
    exp_success = Ts*n*p*(1-p)^(n-1);
    exp_idle = d*(1-p)^n;
    exp_collision = Tc*(1-((1-p)^n)-n*p*(1-p^(n-1)));
    st = exp_success/(exp_idle + exp_success + exp_collision);
end