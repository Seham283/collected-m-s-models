
P0 = 1000; % Initial amount
r_fixed = 0.05; % Fixed annual interest rate (5%)
n = 12; % Number of months

% Fixed Interest Rate Model
P_fixed = P0 * (1 + r_fixed) .^ (1:n);

% Print mathematical expression for fixed interest
fprintf('Fixed Interest Model:\n');
fprintf('P(n) = P0 * (1 + r)^n\n');
for i = 1:n
    fprintf('P(%d) = %.2f * (1 + %.2f)^%d = %.2f\n', i, P0, r_fixed, i, P_fixed(i));
end
fprintf('\n');

% Variable Interest Rate Model (Changing r every 3 months)
r_variable = [0.05, 0.04, 0.06, 0.03]; % Changing interest rates per quarter
P_variable = zeros(1, n);
P_variable(1) = P0;

fprintf('Variable Interest Model:\n');
fprintf('P(n) = P(n-1) * (1 + r_n)\n');

for i = 2:n
    r_current = r_variable(ceil(i/3)); % Select interest rate for the quarter
    P_variable(i) = P_variable(i-1) * (1 + r_current);
    
    fprintf('P(%d) = P(%d) * (1 + %.2f) = %.2f * %.2f = %.2f\n', ...
        i, i-1, r_current, P_variable(i-1), (1 + r_current), P_variable(i));
end

% Visualization
figure;
plot(1:n, P_fixed, 'b-o', 'LineWidth', 1.5);
hold on;
plot(1:n, P_variable, 'r-s', 'LineWidth', 1.5);
xlabel('Months');
ylabel('Savings Amount');
title('Savings Growth with Fixed and Variable Interest Rates');
legend('Fixed Rate', 'Variable Rate');
grid on;