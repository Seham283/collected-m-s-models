% Given Parameters
r = 0.5; % Absorption ratio
d = 1;   % Dose per day
M0 = 0;  % Initial concentration
n = 10;  % Number of days for simulation

% Initialize concentration array
M = zeros(1, n+1);
M(1) = M0;

% Print header in command window
fprintf('\nMedication Concentration Over Days:\n');
fprintf('-----------------------------------------\n');
fprintf('| Day (t) |  Concentration (M_t)  |\n');
fprintf('-----------------------------------------\n');

% Compute medication concentration for each day
for t = 1:n
    M(t+1) = r * M(t) + d;
    fprintf('|    %2d   |       %.3f       |\n', t, M(t+1));
    
    % Stop if concentration reaches 2 mg/L
    if M(t+1) >= 2
        break;
    end
end

fprintf('-----------------------------------------\n');
fprintf('The medication concentration reaches 2 mg/L on day %d.\n', t);

% Plot concentration over days
figure;
hold on;
plot(0:t, M(1:t+1), '-o', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Days');
ylabel('Medication Concentration (mg/L)');
title('Medication Concentration Over Time');
grid on;

% Mark the point where concentration reaches 2 mg/L
scatter(t, M(t+1), 80, 'r', 'filled', 'DisplayName', 'Target Concentration');
legend('Concentration Curve', 'Target Concentration');
hold off;
