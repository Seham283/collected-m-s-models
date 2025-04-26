untitled
% 🔹 Given Volume Constraint
V = 50; % Volume in liters

% 🔹 Define the equation to solve for r
volume_equation = @(r) 4 * pi * r.^3 - 100; % Derived from derivative of surface area

% 🔹 Solve for optimal radius numerically
r_opt = fzero(volume_equation, 1); % Initial guess: 1

% 🔹 Compute optimal height using volume equation
h_opt = V / (pi * r_opt^2);

% 🔹 Compute minimum surface area
A_min = 2 * pi * r_opt^2 + (100 / r_opt);

% 🔹 Display results
fprintf('🔹 Optimal Radius (r): %.4f meters\n', r_opt);
fprintf('🔹 Optimal Height (h): %.4f meters\n', h_opt);
fprintf('🔹 Minimum Surface Area (A): %.4f square meters\n', A_min);

% 🔹 Generate cylinder coordinates
theta = linspace(0, 2*pi, 40); % Angle range
z = linspace(0, h_opt, 40);    % Height range
[Theta, Z] = meshgrid(theta, z);
X = r_opt * cos(Theta);
Y = r_opt * sin(Theta);

% 🔹 Create figure
figure;
hold on;

% 🔹 Plot the side surface of the cylinder
surf(X, Y, Z, 'FaceColor', 'cyan', 'FaceAlpha', 0.7, 'EdgeColor', 'none');

% 🔹 Generate circular top and bottom surfaces
theta_top = linspace(0, 2*pi, 40);
[Theta_top, R_top] = meshgrid(theta_top, linspace(0, r_opt, 40));
X_top = R_top .* cos(Theta_top);
Y_top = R_top .* sin(Theta_top);

% 🔹 Plot the bottom surface
surf(X_top, Y_top, zeros(size(X_top)), 'FaceColor', 'blue', 'FaceAlpha', 0.5, 'EdgeColor', 'none');

% 🔹 Plot the top surface
surf(X_top, Y_top, h_opt * ones(size(X_top)), 'FaceColor', 'blue', 'FaceAlpha', 0.5, 'EdgeColor', 'none');

% 🔹 Set labels and title
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Height');
title('Optimal Cylindrical Water Tank');
grid on;
axis equal;
view(45, 30); % Adjust view angle for better visualization
hold off;