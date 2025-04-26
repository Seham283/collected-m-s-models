
% Define parameters
y0 = 100; % Initial quantity
k = 0.2;  % Growth rate (set k < 0 for decay)
t = linspace(0, 10, 100); % Time from 0 to 10

% Compute y(t)
y = y0 * exp(k * t);

% Display the mathematical expression in the command window
fprintf('The exponential function is: y(t) = %.0fe^{%.2f t}\n', y0, k);

% Plot results
figure;
plot(t, y, 'b', 'LineWidth', 2);
xlabel('Time (t)');
ylabel('y(t)');
title('Exponential Growth/Decay Model');
grid on;
legend(['y(t) = ', num2str(y0), 'e^{', num2str(k), 't}']);
