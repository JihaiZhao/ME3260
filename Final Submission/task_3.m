%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ME3260 - System Dynamics and Vibration% S.Stockar, Spring 2021%% Initialization Parameters%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear all
clc
%% Problem Data:% General Data
p_amb   = 1e5;    % Ambient Pressure [Pa]
g       = 9.81;   % Gravity [m/s^2]
rho     = 1000;   % Density of Water [kg/m^3]
% Reservoir, Connecting Line and Surge Tank
h0      = 10;     % Height of Reservoir (from Reference 1 - See Figure) [m]
L_line  = 5;      % Length of Connecting Line [m]
D_line  = 0.8;    % Diameter of Connecting Line [m]
lambda  = 5e-3;   % UPDATED Friction Factor [-]
D_tank  = 6;      % Diameter of Surge Tank [m]
A_line  = pi*D_line^2/4;
A_tank  = pi*D_tank^2/4;% Penstock and High-Pressure Chamber
D_p     = 0.75;      % Penstock Diameter [m]
L_p     = 220;       % Penstock Length [m]
h2      = 175;       % Height of Penstock (from Reference 2 - See Figure) [m]
lambda_p = 1e-4;     % UPDATED Friction Factor [-]
V_c     = 0.27;      % Volume of High Pressure Chamber [m^3]
A_p     = pi*D_p^2/4;    % Penstock Area [m^2]
V_p     = A_p*L_p;       % Penstock Volume [m^3]
K       = 2e9;       % Bulk Modulus [Pa]
% Spear Valve and Pelton Wheel
Av0     = 0.5;       % Area of the nozzle (completely Open) [m^2]
Cd      = 0.9;       % UPDATED Discharge coefficient [-]
D_w     = 3.5;       % Pelton Wheel Diameter [m]
beta_3  = 78*pi/180;        % Blade Angle [deg]
psi     = 0.97;      % Losses in Pelton Wheel [-]
% Shaft Dynamics and Generator
J   = 4.6e5;         % Turbine and Shaft Inertia [kgm^2]
a2 = 7.2e3;          % Generator Load Model Parameters
a1 = 4e3;            % Generator Load Model Parameters
a0 = 600;            % Generator Load Model Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial Conditions and Nominal Conditions
Q_line_0    = 20;   % Connecting line flow rate [m^3/s]
Q_p_0       = 20;   % Penstock flow raete [m^3/s]
h_tank_0    = 7.47; % Tank Height [m]
dV0         = 0;    % Chamber Volume Variation [m^3]
dp0         = 0;    % Chamber Pressure Variation [Pa]
x_v     = 0.5;  % Nominal valve position
omega_t = 15 ;  % Nominal Turbine speed --> This is only used in Part 1.
Rv=(Av0/pi)^(1/2);
%% Test Simulation - Part 1
ts      = 50;   % Step time
t_end   = 100;  % Final simulation time (modify as specified in the problem statement)
out = sim('task_3s');  %Simulate the model --> Change the name with your model's name
time=out.w_dot.Time;
w_dot=out.w_dot.Data;
wt=out.wt.Data;
xt=out.xt.Data;

figure
plot(time,w_dot)
grid on; grid minor
ylabel('w_d(W)')
xlabel('time (s)')
legend('power')

figure
plot(time,wt)
grid on; grid minor
ylabel('w(t) (rad/s)')
xlabel('time (s)')
legend('speed')

figure
plot(time,xt)
grid on; grid minor
ylabel('x(t)')
xlabel('time (s)')
legend('x(t)')