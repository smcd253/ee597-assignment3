% St = S1 + S2 + S3
% S1 = p1(1-p2)(1-p3)
% S2 = p2(1-p1)(1-p3)
% S3 = p3(1-p2)(1-p1)

num_probabilities = 101;
step_size = 1/(num_probabilities-1);
S1 = zeros(1, num_probabilities^3);
S2 = zeros(1, num_probabilities^3);
S3 = zeros(1, num_probabilities^3);

i = 1;
for p1 = 0:step_size:1
    for p2 = 0:step_size:1
        for p3 = 0:step_size:1
            S1(i) = p1*(1-p2)*(1-p3);
            S2(i) = p2*(1-p1)*(1-p3);
            S3(i) = p3*(1-p2)*(1-p1);
            i = i + 1;
        end    
    end
end

plot3(S1, S2, S3);
xlabel('S1');
ylabel('S2');
zlabel('S3');
title('Slotted Aloha for 3 Users');
grid on;