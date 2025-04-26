x0 = 500; % Initial prey population
y0 = 200; % Initial predator population
a = 0.1;  % Prey decrease rate due to predation
b = 0.3;  % Prey natural growth rate
c = 0.15; % Predator growth rate due to predation
d = 0.1;  % Predator natural growth rate
n = 50;   % Number of time steps

% Initialize arrays
x = zeros(1, n);
y = zeros(1, n);
x(1) = x0;
y(1) = y0;

% Print mathematical model
fprintf('Predator-Prey Model Equations:\n');
fprintf('x(n+1) = -a * y(n) + b * x(n)\n');
fprintf('y(n+1) = c * y(n) + d * x(n)\n\n');

fprintf('Step-by-step calculations:\n');
fprintf('Initial conditions: x(1) = %d, y(1) = %d\n', x0, y0);

% Iterative computation of populations
for i = 1:n-1
    x(i+1) = -a * y(i) + b * x(i);
    y(i+1) = c * y(i) + d * x(i);
    
    % Print step-by-step calculations
    fprintf('Step %d:\n', i);
    fprintf('x(%d) = -%.2f * %.2f + %.2f * %.2f = %.2f\n', ...
            i+1, a, y(i), b, x(i), x(i+1));
    fprintf('y(%d) = %.2f * %.2f + %.2f * %.2f = %.2f\n', ...
            i+1, c, y(i), d, x(i), y(i+1));
end

% Visualization
figure;
plot(1:n, x, 'b-o', 'LineWidth', 1.5);
hold on;
plot(1:n, y, 'r-s', 'LineWidth', 1.5);
xlabel('Time Steps');
ylabel('Population Size');
title('Predator-Prey Population Dynamics');
legend('Prey Population', 'Predator Population');
grid on;
