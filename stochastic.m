P0 = 1000;    % Initial deposit
mu = 0.02;    % Mean interest rate (2% per month)
sigma = 0.01; % Standard deviation (1%)
n = 36;       % Number of months

% Initialize arrays
P = zeros(1, n);
P(1) = P0;
r_values = normrnd(mu, sigma, 1, n-1); % Generate random interest rates

% Print mathematical model
fprintf('Stochastic Model for Mutual Fund Growth:\n');
fprintf('P(n+1) = P(n) * (1 + r_n)\n');
fprintf('r_n ~ N(%.2f, %.2f^2)\n\n', mu, sigma);

fprintf('Step-by-step calculations:\n');
fprintf('Initial Balance: P(1) = %.2f\n', P0);

% Iterative computation of account balance
for i = 1:n-1
    P(i+1) = P(i) * (1 + r_values(i));
    
    % Print step-by-step calculations
    fprintf('Step %d:\n', i);
    fprintf('r(%d) = %.4f\n', i, r_values(i));
    fprintf('P(%d) = %.2f * (1 + %.4f) = %.2f\n', i+1, P(i), r_values(i), P(i+1));
end

% Visualization
figure;
plot(1:n, P, 'b-o', 'LineWidth', 1.5);
xlabel('Months');
ylabel('Account Balance');
title('Mutual Fund Growth with Stochastic Interest Rate');
grid on;

% Display final balance
fprintf('\nFinal Account Balance after %d months: %.2f\n', n, P(end));
