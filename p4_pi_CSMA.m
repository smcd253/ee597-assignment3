% constants
num_users = 3;
Ts_v_d = 1000;
range_probabilities = 101;

% plot pcsma throughput over probabilities and diff Ts_v_d cases
pcsma_st = zeros(1,range_probabilities);
prob_range = 0:0.01:1;
hold on
for p = 1:range_probabilities
    pcsma_st(p) = pcsma_saturation_throughput(num_users, prob_range(p), Ts_v_d);
end
plot(prob_range, pcsma_st);
hold off

% plot metadata
legend('Tsvd = 1000');
title('Normalized Saturation Throughput for pi-CSMA (3 Users)');
xlabel('p');
ylabel('Normalized Saturation Throughput');


% pCSMA saturation throughput function definition
function st = pcsma_saturation_throughput(n, p, Ts_v_di)
    exp_success = Ts_v_di*n*p*(1-p)^(n-1);
    exp_idle = (1-p)^n;
    exp_success_collision = Ts_v_di*(1-(1-p)^n);
    st = exp_success/(exp_idle + exp_success_collision);
end