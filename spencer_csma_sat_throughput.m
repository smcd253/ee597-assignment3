% constants
% d = 50 * 10^-6;
% Ts = 9000 * 10^-6;
% Tc = 8750 * 10^-6;
d = 1;
Ts = 1;
Tc = 1;
num_users = 10;
% note: p is same for all users (i.e. p = 1/n)

% build saturation output array
st = zeros(1,101);
hold on;
for n = 1 : num_users
    for p = 0:0.01:1
        st(p) = saturation_throughput (n, p, d, Ts, Tc);
    end
    plot(0:0.01:1, st);
end
hold off;
% plot results
title('Normalized Saturation Throughput for pCSMA');
xlabel('p');
ylabel('Normalized Saturation Throughput');


% pCSMA saturation throughput function definition
function st = saturation_throughput(n, p, d, Ts, Tc)
    exp_success = Ts*n*p*((1-p)^(n-1));
    exp_idle = d*(1-p)^n;
    exp_collision = Tc*(1-(1-p)^n-n*p*(1-p)^(n-1));
    st = exp_success/(exp_idle + exp_success + exp_collision);
end