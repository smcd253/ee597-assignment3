% constants
num_users = 2;
Ts_v_d = [10, 100, 1000];
num_cases = length(Ts_v_d);
range_probabilities = 101;

% plot pcsma throughput over probabilities and diff Ts_v_d cases
pcsma_st = zeros(1,range_probabilities);
prob_range = 0:0.01:1;
hold on
for i = 1 : num_cases
    for p = 1:range_probabilities
        pcsma_st(p) = pcsma_saturation_throughput(num_users, prob_range(p), Ts_v_d(i));
    end
    plot(prob_range, pcsma_st);
end

% plot slotted aloha
sa_st = zeros(1, range_probabilities);
for p = 1:range_probabilities
    sa_st(p) = prob_range(p)*(1-prob_range(p));
end
plot(prob_range, sa_st);
hold off

% plot metadata
legend('Tsvd = 10', 'Tsvd = 100', 'Tsvd = 1000', 'Slotted Aloha');
title('Norm. Sat. Throughput for pi-CSMA and Slotted Aloha (2 Users)');
xlabel('p');
ylabel('Normalized Saturation Throughput');


% pCSMA saturation throughput function definition
function st = pcsma_saturation_throughput(n, p, Ts_v_di)
    exp_success = Ts_v_di*n*p*(1-p)^(n-1);
    exp_idle = (1-p)^n;
    exp_success_collision = Ts_v_di*(1-(1-p)^n);
    st = exp_success/(exp_idle + exp_success_collision);
end