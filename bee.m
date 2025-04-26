
% Define different travel times (tau)
tau_values = [1, 2, 3]; 

% Define a range of t values (time spent at each flower)
t = linspace(0.1, 5, 100); 

% Print header in command window
fprintf('\nOptimal Time for Nectar Collection:\n');
fprintf('-----------------------------------------\n');
fprintf('|  τ (sec)  |  Optimal t (sec)  |\n');
fprintf('-----------------------------------------\n');

% Plot the function
figure;
hold on;

for i = 1:length(tau_values)
    tau = tau_values(i);
    
    % Compute nectar collection rate r(t)
    r = t ./ ((t + 0.5) .* (t + tau));
    
    % Compute the optimal time t that maximizes r(t)
    optimal_t = sqrt(0.5 * tau);
    optimal_r = optimal_t / ((optimal_t + 0.5) * (optimal_t + tau));
    
    % Print results in command window
    fprintf('|    %d      |     %.3f       |\n', tau, optimal_t);
    
    % Plot r(t)
    plot(t, r, 'DisplayName', ['\tau = ', num2str(tau)]);
    
    % Mark the optimal point on the graph
    plot(optimal_t, optimal_r, 'ro', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 8);
end

fprintf('-----------------------------------------\n');

% Formatting the graph
xlabel('Time spent at each flower (t)');
ylabel('Nectar collection rate r(t)');
title('Effect of \tau on Nectar Collection Rate');
legend;
grid on;
hold off;
