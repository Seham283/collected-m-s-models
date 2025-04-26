clc; clear; close all;

% Define the function for food intake rate
syms t;
w = 3*t / (2*t + 7); % Weight function
R = w / (t + 1); % Rate of food intake

% Display the mathematical expression for R(t)
disp('Mathematical Expression for Food Intake Rate R(t):');
pretty(R) % Displays R(t) in readable format

% Differentiate R(t) to find the critical point
dR = diff(R, t);
disp('Derivative dR/dt:');
pretty(dR) % Displays dR/dt in readable format

% Solve for critical points
critical_points = solve(dR == 0, t);

% Convert symbolic solutions to numeric values
optimal_t = double(critical_points);
optimal_t = optimal_t(optimal_t > 0); % Select valid positive time

% Display critical points
disp('Critical Points (Optimal Search Time in minutes):');
disp(optimal_t)

% Plot the function to visualize the maximum point
fplot(R, [0, 20], 'b', 'LineWidth', 2);
hold on;
plot(optimal_t, subs(R, t, optimal_t), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
xlabel('Time spent in bush (t minutes)');
ylabel('Food intake rate R(t)');
title('Optimal Foraging Time for a Bird');
grid on;

% Display result
fprintf('Optimal time to search each bush before moving: %.2f minutes\n', optimal_t);
